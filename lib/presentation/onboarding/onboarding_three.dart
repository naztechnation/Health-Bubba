import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/auth/sign_up.dart';
import 'package:healthbubba/res/app_colors.dart';
import 'package:healthbubba/res/app_routes.dart';
import 'package:healthbubba/widgets/button_view.dart';

import '../../handlers/secure_handler.dart';
import '../../res/app_images.dart';
import '../../utils/navigator/page_navigator.dart';

class OnboardingThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPrimary,
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 2, 0, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            AppImages.onboardingThree,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(1, 30, 0, 6),
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
                                      'Get real insights to your activities',
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
                                  margin:
                                      const EdgeInsets.fromLTRB(5.5, 0, 5.5, 0),
                                  child: Text(
                                    'Gain true insights into your practice with comprehensive analytics on revenue, patient count, consultations, and more.',
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
                              width: 11,
                              height: 6,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFF093126)),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Container(
                              width: 11,
                              height: 6,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFF093126)),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF093126),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const SizedBox(
                                width: 30,
                                height: 6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      ButtonView(
                          onPressed: () {
                                  AppNavigator.pushAndReplacePage(context, page: SignUpScreen());

                            StorageHandler.saveOnboardState('true');
                          },
                          borderRadius: 100,
                          color: AppColors.lightSecondary,
                          child: const Text(
                            'Done',
                            style: TextStyle(
                                color: AppColors.lightPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 14,
                      ),
                    ],
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
