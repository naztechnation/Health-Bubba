


 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/image_view.dart';
import '../../../widgets/checkbox.dart';

class DeleteAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
        backgroundColor: Colors.white,

       appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Delete Account',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 12.0, top: 19, bottom: 19),
            child: SizedBox(
              width: 15,
              height: 15,
              child: ImageView.svg(
                AppImages.backBtn,
                height: 15,
              ),
            ),
          ),
        ),
        actions: const [
          Text(
            '         ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                   
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 12, 18.4, 12),
                      child: Text(
                        'We’re sad to see you go! Kindly let us know where we let you down and we’ll be sure to review it and make improvements asap. Thank you.',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.6,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                                                padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Reason for deactivating',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          height: 1.4,
                                          color: const Color(0xFF131316),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextEditView(
                                    controller: TextEditingController(),
                                    borderColor: Colors.grey.shade200,
                                    borderWidth: 0.5,
                                    hintText: 'Select',
                                     suffixIcon: const Padding(
                                      padding: EdgeInsets.all(17.0),
                                      child: ImageView.svg(
                                        AppImages.dropDown,
                                        scale: 0.8,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                                Divider(
              color: Colors.grey.shade300,
            ),  
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border(
                    bottom:  BorderSide (
                      color: Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Provide more details',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.4,
                              color: const Color(0xFF131316),
                            ),
                          ),
                        ),
                      ),
                      TextEditView(controller: TextEditingController(),maxLines: 5, hintText: 'Please explain the reason you are deactivating',),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:15.0),
                child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                                                                                CustomCheckbox(isChecked: true,),

                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'I would like my account to be deleted and I acknowledge that my details will be completely removed from the HealthBubba’s system after 30days.',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    height: 1.4,
                                                    color: const Color(0xFF131316),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
              ),
              const SizedBox(height: 30,),

                Divider(
              color: Colors.grey.shade300,
            ),  
            ],
          ),
        ),
      ),
      bottomNavigationBar:  Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border(
            top: BorderSide(
              color: Color(0xFFE5E7EB),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x14000000),
              offset: Offset(0, -4),
              blurRadius: 8.8999996185,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
          child: ButtonView(
                  onPressed: () {
                    
                  },
                  borderRadius: 100,
                  color: const Color(0xFFF70000),
                  child: const Text(
                    'Delete Account',
                    style: TextStyle(
                        color: AppColors.lightPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ))
              
        ),
      ),
    );
  }
}