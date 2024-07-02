import 'package:flutter/material.dart';



import '../../../../model/patients/appointment_lists.dart';
import '../../../../utils/navigator/page_navigator.dart';
import 'appointment_patient_card.dart';
import 'cancel_appointment.dart';
import 'reschedule.dart';

class UpcomingPage extends StatelessWidget {

  final  List<AppointmentListsData>  upcomingAppointment;

  const UpcomingPage({super.key, required this.upcomingAppointment});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: ListView.builder(
         itemCount: upcomingAppointment.length,
         shrinkWrap: true,
         physics: const NeverScrollableScrollPhysics(),
         itemBuilder: ( (context, index) {
         return AppointmentPatientCard(
           isScheduled: false,
           isReBook: false,
           actionText: 'Reschedule',
           onCancel: () {
             AppNavigator.pushAndStackPage(context,
                 page: CancelAppointment());
           },
           onAccept: () {
             AppNavigator.pushAndStackPage(context,
                 page:   ReschedulePage(
                   isSchedule: true, appointment: upcomingAppointment[index], isDue: false,
                 ));
           }, upcomingAppointment: upcomingAppointment[index],
         );
        })),
      ),
    );
  }
}
