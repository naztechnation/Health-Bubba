


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/image_view.dart';

class AppointmentPatientCard extends StatelessWidget {
  final bool isScheduled;
  final  bool isReBook;
  final String actionText;
  final  Function onAccept;
  final  Function onCancel;
  const AppointmentPatientCard({super.key,
   required this.isScheduled, 
  required this.isReBook,
  required this.actionText, 
  required this.onAccept,
  required this.onCancel,
  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                              padding: const EdgeInsets.fromLTRB(3, 7, 3, 3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Nov 19, 2023 - 2:30pm',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          height: 1.4,
                                          color: const Color(0xFF0A0D14),
                                        ),
                                      ),
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
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 12),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 2.5, 0, 2.5),
                                              child: Row(
                                                children: [
                                                  const ImageView.svg(
                                                      AppImages.avatar),
                                                      const SizedBox(width: 12,),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Video Consultation',
                                                        style: GoogleFonts
                                                            .getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                          fontSize:
                                                              12,
                                                          height: 1.7,
                                                          color: const Color(
                                                              0xFF6B7280),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Ayoola Feranmi',
                                                        style: GoogleFonts
                                                            .getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                          fontSize:
                                                              14,
                                                          height: 1.4,
                                                          color: const Color(
                                                              0xFF0A0D14),
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
                                                            fontSize:
                                                                12,
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
                                                                    FontWeight.w500,
                                                                fontSize:
                                                                    12,
                                                                height:
                                                                    1.3,
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
                                                                    FontWeight.w400,
                                                                fontSize:
                                                                    12,
                                                                height:
                                                                    1.7,
                                                                color: const Color(
                                                                    0xFF6B7280),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 11),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFE5E7EB),
                                              ),
                                              child: const SizedBox(
                                                width: 326,
                                                height: 1,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                             if(!isReBook) Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    onCancel();
                                                  },
                                                  child: Container(
                                                      width: MediaQuery.sizeOf(
                                                              context)
                                                          .width,
                                                      height: 42,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            100,
                                                          ),
                                                          color: AppColors
                                                              .lightPrimary,
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey,
                                                              width: 0.5)),
                                                      child: const Center(
                                                        child: Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .lightSecondary,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      )),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Opacity(
                                                  opacity: (isScheduled)? 1 : 0.5,
                                                  child: ButtonView(
                                                      expanded: false,
                                                      onPressed: () {
                                                        onAccept();
                                                      },
                                                      borderRadius: 100,
                                                      color: AppColors
                                                          .lightSecondary,
                                                      child:   Text(
                                                        actionText ,
                                                        style:const  TextStyle(
                                                            color: AppColors
                                                                .lightPrimary,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      )),
                                                ),
                                              ),
                                            ],
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
                    );
  }
}