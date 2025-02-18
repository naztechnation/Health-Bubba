import 'package:file_picker/file_picker.dart';
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
  UserViewModel() {
    searchController = TextEditingController();
    searchController.addListener(_filterPatients);
    medSearchController = TextEditingController();
    medSearchController.addListener(_filterMedications);

    _titleController.text = 'Dr.';
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

  String _doctorsLicenceDoc = '';
  String _doctorsOtherDoc = '';

  String _doctorsUploadedLicenceDoc = '';
  String _doctorsUploadedOtherDoc = '';

  String _pickedDocFilePath1 = '';
  String _pickedDocFileName1 = '';
  String _fileExtension1 = '';
  String _fileSize1 = '';

  String _pickedDocFilePath2 = '';
  String _pickedDocFileName2 = '';
  String _fileExtension2 = '';
  String _fileSize2 = '';

  GetProfileStatus? _status;
  DoctorsAnalytics? _analytics;

  late TextEditingController searchController;
  late TextEditingController medSearchController;

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _titleController = TextEditingController();
  final _licenceNumberController = TextEditingController();
  final _yearsOfExpController = TextEditingController();
  final _hospitalAffliateController = TextEditingController();
  final _phoneController = TextEditingController();
  final _locationController = TextEditingController();
  GetMedications? _medications;
  List<GetMedicationsData> medicationLists = [];

  List<GetMedicationsData> _filteredMedicationsLists = [];

  PatientsLists? _patients;
  List<Patients> _filteredPatientsLists = [];

  List<AppointmentListsData> _appointments = [];

  NotificationsData? _notificationsData;

  updateLicenceDoc(String doctorLicenceDoc) {
    _doctorsLicenceDoc = doctorLicenceDoc;
    setViewState(ViewState.success);
  }

  updateotherDoc(String doctorOtherDoc) {
    _doctorsOtherDoc = doctorOtherDoc;
    setViewState(ViewState.success);
  }

  updateUploadedLicenceDoc(String doctorLicenceDoc) {
    _doctorsUploadedLicenceDoc = doctorLicenceDoc;
    setViewState(ViewState.success);
  }

  updateUploadedotherDoc(String doctorOtherDoc) {
    _doctorsUploadedOtherDoc = doctorOtherDoc;
    setViewState(ViewState.success);
  }

  removeUploadedLicenceDoc() {
    _doctorsUploadedLicenceDoc = "";
    setViewState(ViewState.success);
  }

  removeUploadedotherDoc() {
    _doctorsUploadedOtherDoc = "";
    setViewState(ViewState.success);
  }

  void _filterPatients() {
    String query = searchController.text.toLowerCase();
    _filteredPatientsLists = _patients?.data.patients.where((patient) {
      return patient.firstName.toString().toLowerCase().contains(query);
    }).toList();
    setViewState(ViewState.success);
  }

  savePatientDetails(
      {required String patientId,
      required String patientName,
      required String patientImage}) {
    _patientId = patientId;
    _patientName = patientName;
    _patientImage = patientImage;

    setViewState(ViewState.success);
  }

  clearPatientDetails() {
    _patientId = '';
    _patientName = '';
    _patientImage = '';

    setViewState(ViewState.success);
  }

  removeAllPaths1() {
    _pickedDocFilePath1 = '';
    _pickedDocFileName1 = '';
    _fileExtension1 = '';
    _fileSize1 = '';
    _doctorsLicenceDoc = "";
    setViewState(ViewState.success);
  }

  removeAllPaths2() {
    _pickedDocFilePath2 = '';
    _pickedDocFileName2 = '';
    _fileExtension2 = '';
    _fileSize2 = '';
    _doctorsOtherDoc = "";
    setViewState(ViewState.success);
  }

  void _filterMedications() {
    String query = medSearchController.text.toLowerCase();
    _filteredMedicationsLists = medicationLists.where((medication) {
      return medication.medicationName.toString().toLowerCase().contains(query) || medication.patientFirstName.toString().toLowerCase().contains(query)|| medication.patientLastName.toString().toLowerCase().contains(query)  || medication.patientUsername.toString().toLowerCase().contains(query);
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

  clearAllField() {
    _firstnameController.clear();
    _lastnameController.clear();

    _licenceNumberController.clear();
    _yearsOfExpController.clear();
    _hospitalAffliateController.clear();
    _phoneController.clear();
    _locationController.clear();

    setViewState(ViewState.success);
  }

  Future<void> updateFirstname(
    String fName,
  ) async {
    _firstnameController.text = fName;

    setViewState(ViewState.success);
  }

  Future<void> updateLicenceNumber(
    String number,
  ) async {
    _licenceNumberController.text = number;

    setViewState(ViewState.success);
  }

  Future<void> updateYear(
    String fName,
  ) async {
    _yearsOfExpController.text = fName;

    setViewState(ViewState.success);
  }

  Future<void> updateHospital(
    String fName,
  ) async {
    _hospitalAffliateController.text = fName;

    setViewState(ViewState.success);
  }

  Future<void> updatePhone(
    String fName,
  ) async {
    _phoneController.text = fName;

    setViewState(ViewState.success);
  }

  Future<void> updateLocation(
    String fName,
  ) async {
    _locationController.text = fName;

    setViewState(ViewState.success);
  }

  Future<void> uploadFile(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null) {
        PlatformFile pickedFile = result.files.single;

        _pickedDocFilePath1 = pickedFile.path!;
        _pickedDocFileName1 = pickedFile.name;
        int fileSizeInBytes = pickedFile.size;
        String? fileExtension = pickedFile.extension; // Retrieve file extension

        // Optional: Convert file size to KB or MB for easier readability
        double fileSizeInKB = fileSizeInBytes / 1024;
        double fileSizeInMB = fileSizeInKB / 1024;

        _fileExtension1 = '$fileExtension';
        _fileSize1 = '${fileSizeInMB.toStringAsFixed(2)} MB';

        // Debugging or logging details
        // debugPrint('File Path: $_pickedDocFilePath');
        // debugPrint('File Name: $_pickedDocFileName');
        // debugPrint('File Extension: $fileExtension');
        // debugPrint('File Size: $fileSizeInBytes bytes');
        // debugPrint('File Size: ${fileSizeInKB.toStringAsFixed(2)} KB');
        // debugPrint('File Size: ${fileSizeInMB.toStringAsFixed(2)} MB');

        setViewState(ViewState.success);

        // Optionally return or use the file extension and size as needed
      } else {
        // File picker was canceled
        debugPrint("File picker was canceled.");
      }
    } catch (e) {
      debugPrint("Error picking file: $e");
    }
  }

  Future<void> uploadFile1(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null) {
        PlatformFile pickedFile = result.files.single;

        _pickedDocFilePath2 = pickedFile.path!;
        _pickedDocFileName2 = pickedFile.name;
        int fileSizeInBytes = pickedFile.size;
        String? fileExtension = pickedFile.extension; // Retrieve file extension

        // Optional: Convert file size to KB or MB for easier readability
        double fileSizeInKB = fileSizeInBytes / 1024;
        double fileSizeInMB = fileSizeInKB / 1024;

        _fileExtension2 = '$fileExtension';
        _fileSize2 = '${fileSizeInMB.toStringAsFixed(2)} MB';

        // Debugging or logging details
        // debugPrint('File Path: $_pickedDocFilePath');
        // debugPrint('File Name: $_pickedDocFileName');
        // debugPrint('File Extension: $fileExtension');
        // debugPrint('File Size: $fileSizeInBytes bytes');
        // debugPrint('File Size: ${fileSizeInKB.toStringAsFixed(2)} KB');
        // debugPrint('File Size: ${fileSizeInMB.toStringAsFixed(2)} MB');

        setViewState(ViewState.success);

        // Optionally return or use the file extension and size as needed
      } else {
        // File picker was canceled
        debugPrint("File picker was canceled.");
      }
    } catch (e) {
      debugPrint("Error picking file: $e");
    }
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

  Future<void> clearFirstname() async {
    _firstnameController.clear();

    setViewState(ViewState.success);
  }

  Future<void> clearLastname() async {
    _lastnameController.clear();

    setViewState(ViewState.success);
  }

  Future<void> clearTitle() async {
    _titleController.clear();

    setViewState(ViewState.success);
  }

  Future<void> savePatietList(
    PatientsLists filteredPatientsLists,
  ) async {
    List<Patients> newPatients = filteredPatientsLists.data.patients
        .where((patient) => !_filteredPatientsLists
            .any((existingPatient) => existingPatient.id == patient.id))
        .toList();

    _filteredPatientsLists.addAll(newPatients);
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

  updateInde(int index) async {
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
  List<GetMedicationsData> get filteredMedicationsLists =>
      _filteredMedicationsLists;
  String get patientId => _patientId;
  String get patientImage => _patientImage;
  String get patientName => _patientName;

  String get licenceDoc => _doctorsLicenceDoc;
  String get otherDoc => _doctorsOtherDoc;
  String get licenceUploadedDoc => _doctorsUploadedLicenceDoc;
  String get otherUploadedDoc => _doctorsUploadedOtherDoc;

  String get pickedDocFilePath1 => _pickedDocFilePath1;
  String get pickedDocFileName1 => _pickedDocFileName1;
  String get fileExtension1 => _fileExtension1;
  String get fileSize1 => _fileSize1;

  String get pickedDocFilePath2 => _pickedDocFilePath2;
  String get pickedDocFileName2 => _pickedDocFileName2;
  String get fileExtension2 => _fileExtension2;
  String get fileSize2 => _fileSize2;

  TextEditingController get firstnameController => _firstnameController;
  TextEditingController get lastnameController => _lastnameController;
  TextEditingController get titleController => _titleController;
  TextEditingController get licenceNumberController => _licenceNumberController;
  TextEditingController get yearsOfExpController => _yearsOfExpController;
  TextEditingController get hospitalAffliateController =>
      _hospitalAffliateController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get locationController => _locationController;
}
