import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_colors.dart';
import 'package:healthbubba/widgets/button_view.dart';
import 'package:provider/provider.dart';

import '../../handlers/secure_handler.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../res/app_routes.dart';
import '../../utils/navigator/page_navigator.dart';

class OnboardingOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onboard =
        Provider.of<OnboardViewModel>(context, listen: false);
    return 
    GestureDetector(
      child: Scaffold(
        backgroundColor: AppColors.lightPrimary,
        body: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Container(
                         width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/onboard1.jpeg',
                            ),
                          ),
                        ),
                         
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(1, 0, 0, 6),
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFFFFF),
                              ),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                      child: Align(
                                        child: Text(
                                          'Schedule appointment with Patients',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            height: 1.4,
                                            color: const Color(0xFF131316),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(5.5, 0, 5.5, 0),
                                      child: Text(
                                        'Manage patient appointments seamlessly, ensuring timely and organized care for your clients.',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          height: 1.7,
                                          color: const Color(0xFF6B7280),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF093126),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Container(
                                    width: 30,
                                    height: 6,
                                  ),
                                ),
                                const SizedBox(width: 3,),
                                Container(
                                  width: 11,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFF093126)),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                const SizedBox(width: 3,),
      
                                Container(
                                  width: 11,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFF093126)),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                 const SizedBox(height: 30,),
      
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                   child: Column(
                     children: [
                       ButtonView(
                        
                        onPressed: (){
                        onboard.nextPage();
                      // AppNavigator.pushAndStackPage(context, page: OnboardingTwo());
                       }, 
                       borderRadius: 100,
                       color: AppColors.lightSecondary,
                       child: const Text('Next', 
                       style: TextStyle(color: AppColors.lightPrimary, fontSize: 14, fontWeight: FontWeight.w500),)),
                     
                        const SizedBox(height: 14,),
                    GestureDetector(
                      onTap: () {
                        AppNavigator.pushAndReplaceName(context, name: AppRoutes.signInScreen);
                     StorageHandler.saveOnboardState('true');
                      },
                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 38,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100, ),
                                         color:  AppColors.lightPrimary,
                                         border: Border.all(color: Colors.grey, width: 0.5)
                                         ),
                      
                      child: const Center(
                        child: Text('Skip', 
                                           style: TextStyle(color: AppColors.lightSecondary, fontSize: 14, fontWeight: FontWeight.w500),),
                      )
                                       ),
                    )
                    ],
                   ),
                 ),

                
               
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}