import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard_pages.dart/patient/patient_details.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';

import '../../../../res/app_images.dart';
import '../../../../widgets/image_view.dart';
import '../widgets/patient_card.dart';

class PatientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
       
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
          
                    Text(
                      'Patients',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        height: 1.5,
                        color: const Color(0xFF0A0D14),
                      ),
                    ),
                     
                   
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
              child: TextEditView(
                controller: TextEditingController(),
                prefixIcon:const Padding(
                  padding:  EdgeInsets.all(12.0),
                  child:   ImageView.svg(AppImages.searchIcon, height: 12,),
                ),
              hintText: 'Search Patients name ',
              ),
            ),
             
            Expanded(
              child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFFFFFFFF),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x0A000000),
                                        offset: Offset(0, 1),
                                        blurRadius: 1.5,
                                      ),
                                      BoxShadow(
                                        color: Color(0x0D2F3037),
                                        offset: Offset(0, 24),
                                        blurRadius: 34,
                                      ),
                                      BoxShadow(
                                        color: Color(0x0A222A35),
                                        offset: Offset(0, 4),
                                        blurRadius: 3,
                                      ),
                                      BoxShadow(
                                        color: Color(0x0D000000),
                                        offset: Offset(0, 1),
                                        blurRadius: 0.5,
                                      ),
                                    ],
                                  ),
                child: Container(
                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFFFFFFFF),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x0A000000),
                                        offset: Offset(0, 1),
                                        blurRadius: 1.5,
                                      ),
                                      BoxShadow(
                                        color: Color(0x0D2F3037),
                                        offset: Offset(0, 24),
                                        blurRadius: 34,
                                      ),
                                      BoxShadow(
                                        color: Color(0x0A222A35),
                                        offset: Offset(0, 4),
                                        blurRadius: 3,
                                      ),
                                      BoxShadow(
                                        color: Color(0x0D000000),
                                        offset: Offset(0, 1),
                                        blurRadius: 0.5,
                                      ),
                                    ],
                                  ),
                  child: ListView(
                    shrinkWrap: true,
                    
                    children: [

                      GestureDetector(
                        onTap: () {
                          AppNavigator.pushAndStackPage(context, page: PatientDetails());
                        },
                        child: 
                       patientCard(context: context),
                       ),
                   
                    patientCard(context: context),
                    patientCard(context: context),
                    patientCard(context: context),
                    patientCard(context: context),
                    patientCard(context: context),
                    patientCard(context: context),
                    patientCard(context: context),
                  ],),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}