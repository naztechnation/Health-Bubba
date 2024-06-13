import 'package:flutter/material.dart';  
import 'package:google_fonts/google_fonts.dart';
 
import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart'; 
import '../../../../utils/navigator/page_navigator.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/text_edit_view.dart';
import '../widgets/medication_card.dart';
import 'create_new_medication.dart';

class MedicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          Container(
              color: const Color(0xFFFFFFFF),
          
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 11),
                        child: Text(
                          'Medication',
                          style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 1.5,
                            color: const Color(0xFF0A0D14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey.shade300,),
                  const SizedBox(height: 10,),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical:  0, horizontal: 15),
                    child: TextEditView(
                      controller: TextEditingController(),
                      prefixIcon:SizedBox(
                  width: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 0,),
                      const ImageView.svg(AppImages.searchIcon, height: 19,),
                      Container(
                    height: 20,
                    width: 1,
                     
                    decoration: BoxDecoration(
                        color: const Color(0xFF000000),
                        borderRadius: BorderRadius.circular(11)),
                  ),
                  const SizedBox(width: 0,),
                    ],
                  ),
                ),
                      hintText: 'Search Medications, Patients',
                    ),
                  ),
                  const SizedBox(height: 20,),

                  Divider(color: Colors.grey.shade300,height: 0,),
                   
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: const [
                        MedicationCard(),
                        MedicationCard(),
                        MedicationCard(),
                        MedicationCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
           Positioned(
            bottom: 20,
            right: 20,
            left: 20,
             child: ButtonView(
                        onPressed: () {
                          AppNavigator.pushAndStackPage(context, page: CreateNewMedication());
                        },
                        borderRadius: 100,
                        color: AppColors.lightSecondary,
                        child: const Text(
                          'Create New Medication',
                          style: TextStyle(
                              color: AppColors.lightPrimary,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )),
           ),
                      const SizedBox(height: 40,)
        ],
      ),
      
    );
  }
}
