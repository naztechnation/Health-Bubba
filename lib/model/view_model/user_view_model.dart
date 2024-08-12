import 'package:healthbubba/model/patients/appointment_lists.dart';
import 'package:intl/intl.dart';

import '../../res/enum.dart';
import '../user/notifications_data.dart';
import 'base_viewmodel.dart';

class UserViewModel extends BaseViewModel {
  int _currentIndex = 0;

  List<AppointmentListsData> _appointments = [];

  NotificationsData? _notificationsData;

  Future<void> setAppointmentData(
    List<AppointmentListsData> appointments,
  ) async {
    _appointments = appointments;

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
    return _notificationsData?.data?.where((notify) => notify.date?.split('T')[0] == todaysDate).toList();
  }

List<NotifyData>? get yesterdayFilter {
    final String yesterdaysDate = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 1)));
    return _notificationsData?.data?.where((notify) => notify.date?.split('T')[0] == yesterdaysDate).toList();
  }

  List<NotifyData>? get pastDaysFilter {
    final String todaysDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final String yesterdaysDate = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 1)));

    return _notificationsData?.data?.where((notify) {
      final String? notificationDate = notify.date?.split('T')[0];
      return notificationDate != null && 
             notificationDate != todaysDate && 
             notificationDate != yesterdaysDate;
    }).toList();
  }
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
}
