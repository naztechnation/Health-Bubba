 
import 'package:flutter/material.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
  
 
import '../../../../model/patients/appointment_lists.dart';
import 'appointment_patient_card.dart';
import 'cancel_appointment.dart';
import 'reschedule.dart';

class CancelledPage extends StatelessWidget {
  final  List<AppointmentListsData>  cancelledAppointment;

  const CancelledPage({super.key, required this.cancelledAppointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child:   ListView.builder(
                itemCount: cancelledAppointment.length,
                shrinkWrap: true,
                itemBuilder: ( (context, index) {
                return AppointmentPatientCard(
                  isScheduled: false,
                  isReBook: true,
                  actionText: 'Reschedule',
                  onCancel: () {
                    AppNavigator.pushAndStackPage(context,
                        page: CancelAppointment());
                  },
                  onAccept: () {
                    AppNavigator.pushAndStackPage(context,
                        page:   ReschedulePage(
                          isSchedule: true, appointment: cancelledAppointment[index],isDue: false,
                        ));
                  }, upcomingAppointment: cancelledAppointment[index],
                );
               }))
      ),
    );
  }
}
