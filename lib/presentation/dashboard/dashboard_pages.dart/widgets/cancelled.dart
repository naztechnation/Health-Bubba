 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
  
 
import '../../../../model/patients/appointment_lists.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/image_view.dart';
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
        child:  (cancelledAppointment.isEmpty)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                     SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.23,
                      width: 80,),
                  const SizedBox(
                      height: 80,
                      width: 80,
                      child: ImageView.svg(AppImages.noData)),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    child: Text(
                      'No Data for Cancelled Appointments Yet. ',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.7,
                        color: const Color(0xFF0A0D14),
                      ),
                    ),
                  ),
                   
                  const SizedBox(
                    height: 30,
                  )
                ],
              )
            :   ListView.builder(
                itemCount: cancelledAppointment.length,
                shrinkWrap: true,
                itemBuilder: ( (context, index) {
                return AppointmentPatientCard(
                  isScheduled: false,
                  isReBook: true,
                  actionText: 'Reschedule',
                  onCancel: () {
                    AppNavigator.pushAndStackPage(context,
                        page: CancelAppointment(appointmentId: cancelledAppointment[index].appointmentId.toString(),));
                  },
                  onAccept: () {
                    AppNavigator.pushAndStackPage(context,
                        page:   ReschedulePage(
                          isSchedule: true, appointment: cancelledAppointment[index],isDue: false, isCompleted: false,
                          
                        ));
                  }, upcomingAppointment: cancelledAppointment[index],
                );
               }))
      ),
    );
  }
}
