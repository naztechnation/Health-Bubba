

 
import 'package:healthbubba/model/patients/appointment_lists.dart';

import '../../res/enum.dart';
import 'base_viewmodel.dart';

class UserViewModel extends BaseViewModel {
 
  int _currentIndex = 0;

    List<AppointmentListsData> _appointments = [];

Future<void> setAppointmentData(
    List<AppointmentListsData> appointments,
  ) async {
    _appointments = appointments;

    setViewState(ViewState.success);
  }

    updateIndex(int index) async {
    _currentIndex = index;

    setViewState(ViewState.success);
  }


  int get currentPage => _currentIndex;

   List<AppointmentListsData> get upcomingAppointments =>
      _appointments.where((upcoming) => upcoming.status == 0).toList() ?? [];
      List<AppointmentListsData> get completedAppointments =>
      _appointments.where((upcoming) => upcoming.status == 1).toList() ?? [];

      List<AppointmentListsData> get cancelledAppointments =>
      _appointments.where((upcoming) => upcoming.status == 2).toList() ?? [];

List<AppointmentListsData> get appointmentsWithinOneHour {
    final DateTime now = DateTime.now();
    return upcomingAppointments.where((appointment) {
      if (appointment.date == null) return false;
      try {
        final DateTime appointmentDateTime = DateTime.parse(appointment.date!);
        final Duration difference = appointmentDateTime.difference(now);
        return difference.inMinutes <= 60 && difference.inMinutes >= 0;
      } catch (e) {
        return false;
      }
    }).toList();
  }


}
