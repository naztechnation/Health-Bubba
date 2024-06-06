import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_colors.dart';

import '../../../../res/app_images.dart';
import '../../../../widgets/image_view.dart';

class MedicationDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPrimary,
        appBar: AppBar(
          title: const Text(
            'Ayoola Feranmi',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
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
        ),
        body: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 1,
                            ),
                          ),
                        ),
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
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFFFFF),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 16, 0, 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0.7, 0, 0, 16),
                                              child: const SizedBox(
                                                  width: 60,
                                                  height: 60,
                                                  child: ImageView.asset(
                                                    AppImages.onboardingOne,
                                                    fit: BoxFit.cover,
                                                  )),
                                            ),
                                          ),
                                          Text(
                                            'Paracetamol 500mg',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF0A0D14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
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
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 16, 12.5, 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 8),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Prescription details',
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
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 0, 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 10, 0),
                                                    child: Text(
                                                      'Medication name',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color: const Color(
                                                            0xFF5E5F6E),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Paracetamol ',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 3.8, 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 10, 0),
                                                    child: Text(
                                                      'Dosage',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color: const Color(
                                                            0xFF5E5F6E),
                                                      ),
                                                    ),
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color: const Color(
                                                            0xFF0A0D14),
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: '500mg ',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Inter',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                            height: 1.3,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: '1 Tablet',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Inter',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14,
                                                            height: 1.4,
                                                            color: const Color(
                                                                0xFF0A0D14),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 3.5, 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 10, 0),
                                                    child: Text(
                                                      'Frequency',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color: const Color(
                                                            0xFF5E5F6E),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Everyday',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 4.2, 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 10, 0),
                                                    child: Text(
                                                      'Time of the day',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color: const Color(
                                                            0xFF5E5F6E),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Morning',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 3.5, 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 10, 0),
                                                    child: Text(
                                                      'Take with meal',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color: const Color(
                                                            0xFF5E5F6E),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Before',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 3.8, 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 10, 0),
                                                    child: Text(
                                                      'Category',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color: const Color(
                                                            0xFF5E5F6E),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    ' Antipyretic and analgesic ',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 3.6, 12),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 10, 0),
                                                    child: Text(
                                                      'Duration',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color: const Color(
                                                            0xFF5E5F6E),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    '1 week',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 4, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 10, 0),
                                                    child: Text(
                                                      'Route of administration',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color: const Color(
                                                            0xFF5E5F6E),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Oral',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
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
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 16, 19, 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 8),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Notes',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF6B7280),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Lorem ipsum dolor sit amet consectetur. Enim viverra amet tristique enim magnis. Risus luctus nulla in.',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 18, 26, 17),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            'View Previous Medication ',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF6B7280),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 5, 15, 5),
                                          width: 4,
                                          height: 10,
                                          child: SizedBox(
                                              width: 4,
                                              height: 10,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey.shade400,
                                                size: 16,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
                                    padding: const EdgeInsets.fromLTRB(
                                        16, 16, 0, 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 8),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Current Medication',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF6B7280),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 1, 8, 1),
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xFFFFFFFF),
                                                  ),
                                                  child: Container(
                                                    width: 18,
                                                    height: 18,
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        1.5, 1.5, 1.5, 1.5),
                                                    child: const SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child: ImageView.svg(
                                                          AppImages.tick),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Amlodipine',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  height: 1.5,
                                                  color:
                                                      const Color(0xFF131316),
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
                          ],
                        ),
                      ),
                    ]),
              ),
            )));
  }
}
