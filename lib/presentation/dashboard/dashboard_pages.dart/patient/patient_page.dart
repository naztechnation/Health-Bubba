import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard_pages.dart/patient/patient_details.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';

import '../../../../res/app_images.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/text_edit_view.dart';
import '../widgets/patient_card.dart';
 

class PatientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,

        title: const Text(
          'Patient',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
         
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    border: Border(
                      top: BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: Color(0xFFE5E7EB),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE2E4E9)),
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFFF6F8FA),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3DE4E5E7),
                            offset: Offset(0, 1),
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(3, 7, 3, 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                          ListView.builder(
                            itemCount: 20,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index){
                            return 
                            GestureDetector(onTap: () {
                              AppNavigator.pushAndStackPage(context, page: PatientDetails());
                            },
                            child:  patientCard(context:context
                            )
                            );
                            
                           
                          }, )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
