 
import 'package:flutter/material.dart';
 
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';
 
import 'appointment_patient_card.dart';

class UpcomingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             
            
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFE5E7EB),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
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
                              padding: const EdgeInsets.fromLTRB(3, 8, 3, 3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 0, 10, 11),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          child: Positioned(
                                            bottom: 0,
                                            child: SizedBox(
                                              height: 20,
                                              child: Text(
                                                'Nov 19, 2023 - 1:30pm',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF0A0D14),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 10, 0),
                                          width: 4,
                                          height: 10,
                                          child: SizedBox(
                                            width: 4,
                                            height: 5,
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.grey.shade300,
                                              size: 17,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
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
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 12, 12, 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 208.9,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 2.5, 0, 2.5),
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: const SizedBox(
                                                      width: 53.8,
                                                      height: 55,
                                                      child: ImageView.asset(
                                                        AppImages.onboardingTwo,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    right: 0,
                                                    bottom: 0,
                                                    child: SizedBox(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              'Video Consultation',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12,
                                                                height: 1.7,
                                                                color: const Color(
                                                                    0xFF6B7280),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Text(
                                                              'Ayoola Feranmi',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF0A0D14),
                                                              ),
                                                            ),
                                                          ),
                                                          RichText(
                                                            text: TextSpan(
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                                height: 1.7,
                                                                color: const Color(
                                                                    0xFF6B7280),
                                                              ),
                                                              children: [
                                                                TextSpan(
                                                                  text:
                                                                      'Today, 2:30pm',
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        12,
                                                                    height: 1.3,
                                                                    color: const Color(
                                                                        0xFF6C7079),
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      ' (30mins)',
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12,
                                                                    height: 1.7,
                                                                    color: const Color(
                                                                        0xFF6B7280),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 29.2, 0, 0),
                                            child: const SizedBox(
                                              width: 30.1,
                                              height: 30.8,
                                              child: ImageView.svg(
                                                  AppImages.videoIcon),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                   //
                                        const AppointmentPatientCard(isScheduled: false, isReBook: false,actionText: 'Reschedule'),

                    //
                    const AppointmentPatientCard(isScheduled: true, isReBook: false,actionText: 'Reschedule'),
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
