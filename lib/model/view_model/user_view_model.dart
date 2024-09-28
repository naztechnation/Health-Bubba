import 'package:flutter/material.dart';
import 'package:healthbubba/model/patients/appointment_lists.dart';
import 'package:intl/intl.dart';

import '../../res/enum.dart';
import '../patients/get_medications.dart';
import '../patients/get_profile_status.dart';
import '../patients/patients_list.dart';
import '../user/doctors_analytics.dart';
import '../user/notifications_data.dart';
import 'base_viewmodel.dart';

class UserViewModel extends BaseViewModel {

  UserViewModel(){
     searchController = TextEditingController();
  searchController.addListener(_filterPatients);
  medSearchController = TextEditingController();
    medSearchController.addListener(_filterMedications);
  }

    @override
void dispose() {
  searchController.dispose();
  super.dispose();
}  

  int _currentIndex = 0;
  String _patientId = '';
  String _patientName = '';
  String _patientImage = '';

  GetProfileStatus? _status;
  DoctorsAnalytics? _analytics;

  late TextEditingController searchController;
  late TextEditingController medSearchController;

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _titleController = TextEditingController();

  GetMedications? _medications;
   List<GetMedicationsData> medicationLists = [];

  List<GetMedicationsData> _filteredMedicationsLists = [];

   PatientsLists? _patients;
  List<Patients> _filteredPatientsLists = [];

  List<AppointmentListsData> _appointments = [];

 

  NotificationsData? _notificationsData;


  void _filterPatients() {
   
    String query = searchController.text.toLowerCase();
    _filteredPatientsLists = _patients?.data.patients.where((patient) {
      return patient.firstName.toString().toLowerCase().contains(query);
    }).toList();
    setViewState(ViewState.success);
  
}

    savePatientDetails({
     required String patientId,
     required String patientName,
     required String patientImage
    }){
      _patientId = patientId;
      _patientName = patientName;
      _patientImage = patientImage;

    setViewState(ViewState.success);

    }

    clearPatientDetails( ){
      _patientId = '';
      _patientName = '';
      _patientImage = '';

    setViewState(ViewState.success);

    }



void _filterMedications() {
     
      String query = medSearchController.text.toLowerCase();
      _filteredMedicationsLists = medicationLists.where((medication) {
        return medication.medicationName
            .toString()
            .toLowerCase()
            .contains(query);
      }).toList();
    setViewState(ViewState.success);
     
  }
  Future<void> setAppointmentData(
    List<AppointmentListsData> appointments,
  ) async {
    _appointments = appointments;

    setViewState(ViewState.success);
  }

  Future<void> saveProfileStatus(
    GetProfileStatus status,
  ) async {
    _status = status;

    setViewState(ViewState.success);
  }

    Future<void> updateFirstname(
    String fName,
  ) async {
    _firstnameController.text = fName;

    setViewState(ViewState.success);
  }

    Future<void> updateLastname(
    String lName,
  ) async {
    _lastnameController.text = lName;

    setViewState(ViewState.success);
  }

    Future<void> updateTitle(
    String title,
  ) async {
   _titleController.text = title;
     

    setViewState(ViewState.success);
  }

   Future<void> clearFirstname(
    
  ) async {
    _firstnameController.clear();

    setViewState(ViewState.success);
  }

    Future<void> clearLastname(
    
  ) async {
       _lastnameController.clear();


    setViewState(ViewState.success);
  }

    Future<void> clearTitle(
    
  ) async {
    _titleController.clear();

    setViewState(ViewState.success);
  }

  Future<void> savePatietList(
    PatientsLists filteredPatientsLists,
  ) async {
    _filteredPatientsLists = filteredPatientsLists.data.patients;
    _patients = filteredPatientsLists;

    setViewState(ViewState.success);
  }

  Future<void> saveMedicalList(
    GetMedications filteredMedsLists,
  ) async {
    _filteredMedicationsLists = filteredMedsLists.data ?? [];
    medicationLists = filteredMedsLists.data ?? [];

    setViewState(ViewState.success);
  }

  Future<void> saveAnalytics(
    DoctorsAnalytics analytics,
  ) async {
    _analytics = analytics;

    setViewState(ViewState.success);
  }

  Future<void> clearAnalytics() async {
    _analytics = null;

    setViewState(ViewState.success);
  }

  Future<void> clearProfileStatus() async {
    _status = null;

    setViewState(ViewState.success);
  }

  Future<void> filterNotification(
    NotificationsData notificationsData,
  ) async {
    _notificationsData = notificationsData;

    setViewState(ViewState.success);
  }

  updateIndex(int index) async {
    _currentIndex = index;

    setViewState(ViewState.success);
  }

  int get currentPage => _currentIndex;

  List<NotifyData>? get todayFilter {
    final String todaysDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return _notificationsData?.data
        ?.where((notify) => notify.date?.split('T')[0] == todaysDate)
        .toList();
  }

  List<NotifyData>? get yesterdayFilter {
    final String yesterdaysDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 1)));
    return _notificationsData?.data
        ?.where((notify) => notify.date?.split('T')[0] == yesterdaysDate)
        .toList();
  }

  List<NotifyData>? get pastDaysFilter {
    final String todaysDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final String yesterdaysDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 1)));

    return _notificationsData?.data?.where((notify) {
      final String? notificationDate = notify.date?.split('T')[0];
      return notificationDate != null &&
          notificationDate != todaysDate &&
          notificationDate != yesterdaysDate;
    }).toList();
  }



  List<AppointmentListsData> get appointments => _appointments;
  List<AppointmentListsData> get upcomingAppointments =>
      _appointments.where((upcoming) => upcoming.status == 0).toList() ?? [];
  List<AppointmentListsData> get completedAppointments =>
      _appointments.where((upcoming) => upcoming.status == 1).toList() ?? [];

  List<AppointmentListsData> get cancelledAppointments =>
      _appointments.where((upcoming) => upcoming.status == 2).toList() ?? [];

  List<AppointmentListsData> get appointmentsWithinOneHour {
    final DateTime now = DateTime.now().add(const Duration(hours: 1));
    return upcomingAppointments.where((appointment) {
      if (appointment.date == null) return false;
      try {
        final DateTime appointmentDateTime = DateTime.parse(
            replaceTimeInDateTime(appointment.date!, appointment.time!));
        final Duration difference = appointmentDateTime.difference(now);
        return difference.inMinutes <= 60 && difference.inMinutes >= 0;
      } catch (e) {
        return false;
      }
    }).toList();
  }

  String replaceTimeInDateTime(String dateTimeString, String newTime) {
    if (!dateTimeString.contains('T') || !dateTimeString.endsWith('Z')) {
      return dateTimeString;
    }

    List<String> parts = dateTimeString.split('T');
    if (parts.length != 2) {}

    String datePart = parts[0];

    String newDateTimeString = '${datePart}T${newTime}Z';

    return newDateTimeString;
  }

  GetProfileStatus? get status => _status;
  DoctorsAnalytics? get analytics => _analytics;
  PatientsLists? get patients => _patients;
  List<Patients> get filteredPatientsLists => _filteredPatientsLists;
  List<GetMedicationsData> get filteredMedicationsLists => _filteredMedicationsLists;
  String get patientId => _patientId;
  String  get patientImage => _patientImage;
  String get patientName => _patientName;

  TextEditingController  get firstnameController => _firstnameController;
  TextEditingController  get lastnameController => _lastnameController;
  TextEditingController  get titleController => _titleController;
}
