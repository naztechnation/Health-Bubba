 
import 'package:flutter/material.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
  
 
import 'appointment_patient_card.dart';
import 'reschedule.dart';

class CancelledPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child:   Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             
            
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                AppointmentPatientCard(isScheduled: true, isReBook: true,actionText: 'Rebook', onCancel: (){}, onAccept: (){
                  AppNavigator.pushAndStackPage(context, page: const ReschedulePage(isSchedule: false,));
                },),
                AppointmentPatientCard(isScheduled: true, isReBook: true,actionText: 'Rebook',  onCancel: (){}, onAccept: (){},),
                AppointmentPatientCard(isScheduled: true, isReBook: true,actionText: 'Rebook', onCancel: (){}, onAccept: (){},),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
