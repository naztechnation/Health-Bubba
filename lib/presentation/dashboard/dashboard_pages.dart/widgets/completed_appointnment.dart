 
import 'package:flutter/material.dart';
 
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';
 
import 'appointment_patient_card.dart';

class CompletedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                                        AppointmentPatientCard(isScheduled: true, isReBook: true,actionText: 'Rebook'),

                    //
                    AppointmentPatientCard(isScheduled: true, isReBook: true,actionText: 'Rebook'),
                    AppointmentPatientCard(isScheduled: true, isReBook: true,actionText: 'Rebook'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
