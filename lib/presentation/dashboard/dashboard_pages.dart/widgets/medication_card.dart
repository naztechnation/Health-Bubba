

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';

import '../../../../res/app_images.dart';
import '../../../../widgets/image_view.dart';
import '../medication/medication_details.dart';

class MedicationCard extends StatelessWidget {
  const MedicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pushAndStackPage(context, page: MedicationDetailsPage());
      },
      child: Container(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          decoration: const BoxDecoration(
                             
                          ),
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
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
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
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                              borderRadius: BorderRadius.circular(50),
                                              child: const SizedBox(
                                                width: 53.8,
                                                height: 55,
                                                child: SizedBox(
                                                  width: 53.8,
                                                  height: 55,
                                                  child: ImageView.asset(AppImages.onboardingOne)
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 12,),
                                        Column(
                                          children: [
                                              
                                            Positioned(
                                              right: 4.8,
                                              bottom: -2.5,
                                              child: SizedBox(
                                                width: 251.4,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Medical Prescription - Paracetamol 500Mg',
                                                      style: GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 12,
                                                        height: 1.7,
                                                        color: const Color(0xFF6B7280),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Text(
                                                        'Ayoola Feranmi',
                                                        style: GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          height: 1.4,
                                                          color: const Color(0xFF0A0D14),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Text(
                                                        'July 5 - Aug 8',
                                                        style: GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 12,
                                                          height: 1.7,
                                                          color: const Color(0xFF6C7079),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
    );
  }
}