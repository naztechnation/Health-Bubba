 
import 'package:flutter/material.dart';
import 'package:healthbubba/presentation/dashboard/dashboard_pages.dart/widgets/reschedule.dart';
 
 
 
import '../../../../model/patients/appointment_lists.dart';
import '../../../../utils/navigator/page_navigator.dart';
import 'appointment_patient_card.dart';
import 'cancel_appointment.dart';

class CompletedPage extends StatelessWidget {
  final  List<AppointmentListsData>  completedAppointment;

  const CompletedPage({super.key, required this.completedAppointment});

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
                itemCount: completedAppointment.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                          isSchedule: true, appointment: completedAppointment[index],
                        ));
                  }, upcomingAppointment: completedAppointment[index],
                );
               }))
      ),
    );
  }
}
