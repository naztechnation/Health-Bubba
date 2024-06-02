import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';

import '../../res/app_colors.dart';
import '../../widgets/button_view.dart';
import '../../widgets/checkbox.dart';
import '../../widgets/text_edit_view.dart';
import 'work_profile.dart';

class ProfileSetup extends StatelessWidget {

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const SizedBox(height: 30,),
              
              Container(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 11),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 1.4, 8),
                      child: Text(
                        'Setup your Profile',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 1.5,
                          color: const Color(0xFF0A0D14),
                        ),
                      ),
                    ),
                    Text(
                      'Provide all the essential details below',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 1.7,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 63),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      decoration:const BoxDecoration(
                          color:  Color(0xFFFCFCFC),
                          
                        ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(height: 8,),

                               TextEditView(
                                 controller: _emailController,
                                 borderColor: Colors.grey.shade200,
                                 borderWidth: 0.5,
                                 hintText: 'Select',
                                 suffixIcon: const Padding(
                                   padding:  EdgeInsets.all(17.0),
                                   child:   ImageView.svg(AppImages.dropDown, scale: 0.8,),
                                 ),
                               ),
                              const SizedBox(height: 15,),
                              
                             Text(
                                'First name',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(height: 8,),

                               TextEditView(
                                 controller: _emailController,
                                 borderColor: Colors.grey.shade200,
                                 borderWidth: 0.5,
                                 
                                  
                               ),
                              const SizedBox(height: 15,),
                              
                              
                             Text(
                                'Last name',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(height: 8,),

                               TextEditView(
                                 controller: _emailController,
                                 borderColor: Colors.grey.shade200,
                                 borderWidth: 0.5,
                                 
                                  
                               ),
                              const SizedBox(height: 15,),
                              Text(
                                'Medical Qualification',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(height: 8,),

                               TextEditView(
                                 controller: _emailController,
                                 borderColor: Colors.grey.shade200,
                                 borderWidth: 0.5,
                                 hintText: 'MBBS, MCPS, MD',
                                 suffixIcon: const Padding(
                                   padding:  EdgeInsets.all(17.0),
                                   child:   ImageView.svg(AppImages.dropDown, scale: 0.8,),
                                 ),
                               ),
                              const SizedBox(height: 15,),

                              Text(
                                'Medical License Number',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(height: 8,),

                               TextEditView(
                                 controller: _emailController,
                                 borderColor: Colors.grey.shade200,
                                 keyboardType: TextInputType.number,
                                 borderWidth: 0.5,
                                 
                                  
                               ),
                              const SizedBox(height: 15,),
                              Text(
                                'Years of Experience',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(height: 8,),

                               TextEditView(
                                 controller: _emailController,
                                 borderColor: Colors.grey.shade200,
                                 borderWidth: 0.5,
                                 hintText: 'Select',
                                 suffixIcon: const Padding(
                                   padding:  EdgeInsets.all(17.0),
                                   child:   ImageView.svg(AppImages.dropDown, scale: 0.8,),
                                 ),
                               ),
                              const SizedBox(height: 15,),
                              
                             Text(
                                'Clinic/ Hospital Affiliation',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(height: 8,),

                               TextEditView(
                                 controller: _emailController,
                                 borderColor: Colors.grey.shade200,
                                 borderWidth: 0.5,
                                 hintText: '',
                                  
                               ),
                              const SizedBox(height: 15,),
                               
                              Text(
                                'Phone Number',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(height: 8,),

                               TextEditView(
                                 controller: _emailController,
                                 borderColor: Colors.grey.shade200,
                                 keyboardType: TextInputType.number,
                                 borderWidth: 0.5,
                                 
                                  
                               ),
                              const SizedBox(height: 15,),

                            Text(
                                'Location (Optional)',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(height: 8,),

                               TextEditView(
                                 controller: _emailController,
                                 borderColor: Colors.grey.shade200,
                                 borderWidth: 0.5,
                                 hintText: 'Ikeja, Lagos, Nigeria',
                                 prefixIcon: const Padding(
                                   padding:  EdgeInsets.all(7.0),
                                   child:   ImageView.svg(AppImages.location, ),
                                 ),
                               ),
                              const SizedBox(height: 15,),
                               
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                           CustomCheckbox(),
                                            const SizedBox(width: 10,),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: 'I agree to HealthBubba’s ',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Terms and Conditions',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 1.3,
                                      color: const Color(0xFF40B93C),
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' and ',
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 1.3,
                                      color: const Color(0xFF40B93C),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                              const SizedBox(height: 30,),

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal:  15.0),
                 child: ButtonView(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  onPressed: () {
                                    AppNavigator.pushAndStackPage(context, page: const WorkInformation());
                                  },
                                  borderRadius: 100,
                                  color: AppColors.lightSecondary,
                                  child: RichText(
                                                      text: TextSpan(
                                                        text: 'Next - ',
                                                        style: GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          height: 1.6,
                                                          color: const Color(0xFFFFFFFF),
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: 'Work information',
                                                            style: GoogleFonts.getFont(
                                                              'Inter',
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 14,
                                                              height: 1.3,
                                                              color: const Color(0xCCFFFFFF),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),),
               ),
                              const SizedBox(height: 40,),
               
            ],
          ),
        ),
      ),
    );
  }
}