import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/settings/settings.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';

import 'widgets/appointment_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SafeArea(
                  child: Container(
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
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Hi, Dr Cynthia',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      height: 1.3,
                                      color: const Color(0xFF0A0D14),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Finish setting up your account',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 14.3),
                            child: SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 16, 1.7),
                                    width: 32,
                                    height: 32,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFFE5E7EB)),
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xFFFFFFFF),
                                      ),
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        padding:
                                            const EdgeInsets.fromLTRB(3, 3, 3, 3),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF1F3F5),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            padding: const EdgeInsets.fromLTRB(
                                                2, 2, 2, 2),
                                            child: const SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: ImageView.svg(
                                                  AppImages.notifyIcon),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      AppNavigator.pushAndStackPage(context, page: SettingsPage());
                                    },
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: const ImageView.asset(
                                              AppImages.onboardingOne)),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
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
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xFFE5E7EB),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 16, 16, 15),
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
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFFE5E7EB)),
                                                  borderRadius:
                                                      BorderRadius.circular(100),
                                                  color: const Color(0xFFFFFFFF),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          7.4, 0, 7.4, 0),
                                                  child: Text(
                                                    '1/4 completed',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.7,
                                                      color:
                                                          const Color(0xFF4B5563),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: const Color(0xFFE2E4E9)),
                                              borderRadius:
                                                  BorderRadius.circular(16),
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        3, 3, 3, 3),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(0, 0, 0, 8),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0A000000),
                                                            offset: Offset(0, 1),
                                                            blurRadius: 1.5,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0D2F3037),
                                                            offset: Offset(0, 24),
                                                            blurRadius: 34,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0A222A35),
                                                            offset: Offset(0, 4),
                                                            blurRadius: 3,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0D000000),
                                                            offset: Offset(0, 1),
                                                            blurRadius: 0.5,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Container(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(
                                                            12, 10, 22, 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          8.3,
                                                                          0),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                99),
                                                                    color: const Color(
                                                                        0xFFFFFFFF),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x14123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                2),
                                                                        blurRadius:
                                                                            2,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                1),
                                                                        blurRadius:
                                                                            0.5,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x14123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                0),
                                                                        blurRadius:
                                                                            0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 20,
                                                                    height: 20,
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .fromLTRB(
                                                                            5,
                                                                            5,
                                                                            5,
                                                                            5),
                                                                    child:
                                                                        const SizedBox(
                                                                      width: 10,
                                                                      height: 10,
                                                                      child: ImageView.svg(
                                                                          AppImages
                                                                              .check),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          1.5,
                                                                          0,
                                                                          1.5),
                                                                  child: Text(
                                                                    'Add a Bio to your profile',
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough,
                                                                      color: const Color(
                                                                          0xFF15141D),
                                                                      decorationColor:
                                                                          const Color(
                                                                              0xFF15141D),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 5, 0, 5),
                                                              width: 4,
                                                              height: 10,
                                                              child: const Icon(
                                                                Icons
                                                                    .arrow_forward_ios,
                                                                size: 16,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(0, 0, 0, 8),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0A000000),
                                                            offset: Offset(0, 1),
                                                            blurRadius: 1.5,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0D2F3037),
                                                            offset: Offset(0, 24),
                                                            blurRadius: 34,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0A222A35),
                                                            offset: Offset(0, 4),
                                                            blurRadius: 3,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0D000000),
                                                            offset: Offset(0, 1),
                                                            blurRadius: 0.5,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Container(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(
                                                            12, 10, 22, 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          4.4,
                                                                          0),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                99),
                                                                    color: const Color(
                                                                        0xFFFFFFFF),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x14123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                2),
                                                                        blurRadius:
                                                                            2,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                1),
                                                                        blurRadius:
                                                                            0.5,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x14123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                0),
                                                                        blurRadius:
                                                                            0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 20,
                                                                    height: 20,
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .fromLTRB(
                                                                            5,
                                                                            5,
                                                                            5,
                                                                            5),
                                                                    child:
                                                                        SizedBox(
                                                                      width: 10,
                                                                      height: 10,
                                                                      child:
                                                                          ImageView
                                                                              .svg(
                                                                        AppImages
                                                                            .check,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade300,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          1.5,
                                                                          0,
                                                                          1.5),
                                                                  child: Text(
                                                                    'Configure availability',
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
                                                                      color: const Color(
                                                                          0xFF15141D),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 5, 0, 5),
                                                              width: 4,
                                                              height: 10,
                                                              child:
                                                                  const SizedBox(
                                                                width: 4,
                                                                height: 10,
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  size: 16,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(0, 0, 0, 8),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0A000000),
                                                            offset: Offset(0, 1),
                                                            blurRadius: 1.5,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0D2F3037),
                                                            offset: Offset(0, 24),
                                                            blurRadius: 34,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0A222A35),
                                                            offset: Offset(0, 4),
                                                            blurRadius: 3,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0D000000),
                                                            offset: Offset(0, 1),
                                                            blurRadius: 0.5,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Container(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(
                                                            12, 10, 22, 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          8.5,
                                                                          0),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                99),
                                                                    color: const Color(
                                                                        0xFFFFFFFF),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x14123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                2),
                                                                        blurRadius:
                                                                            2,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                1),
                                                                        blurRadius:
                                                                            0.5,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x14123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                0),
                                                                        blurRadius:
                                                                            0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 20,
                                                                    height: 20,
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .fromLTRB(
                                                                            5,
                                                                            5,
                                                                            5,
                                                                            5),
                                                                    child:
                                                                        SizedBox(
                                                                      width: 10,
                                                                      height: 10,
                                                                      child:
                                                                          ImageView
                                                                              .svg(
                                                                        AppImages
                                                                            .check,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade300,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          1.5,
                                                                          0,
                                                                          1.5),
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.7,
                                                                  child: Text(
                                                                    'Specify Languages for communication',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 1,
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
                                                                      color: const Color(
                                                                          0xFF15141D),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 5, 0, 5),
                                                              width: 4,
                                                              height: 10,
                                                              child:
                                                                  const SizedBox(
                                                                width: 4,
                                                                height: 10,
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  size: 16,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(0, 0, 0, 8),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0A000000),
                                                            offset: Offset(0, 1),
                                                            blurRadius: 1.5,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0D2F3037),
                                                            offset: Offset(0, 24),
                                                            blurRadius: 34,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0A222A35),
                                                            offset: Offset(0, 4),
                                                            blurRadius: 3,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0D000000),
                                                            offset: Offset(0, 1),
                                                            blurRadius: 0.5,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Container(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(
                                                            12, 10, 22, 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          8.2,
                                                                          0),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                99),
                                                                    color: const Color(
                                                                        0xFFFFFFFF),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x14123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                2),
                                                                        blurRadius:
                                                                            2,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                1),
                                                                        blurRadius:
                                                                            0.5,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x14123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                0),
                                                                        blurRadius:
                                                                            0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 20,
                                                                    height: 20,
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .fromLTRB(
                                                                            5,
                                                                            5,
                                                                            5,
                                                                            5),
                                                                    child:
                                                                        SizedBox(
                                                                      width: 10,
                                                                      height: 10,
                                                                      child:
                                                                          ImageView
                                                                              .svg(
                                                                        AppImages
                                                                            .check,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade300,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          1.5,
                                                                          0,
                                                                          1.5),
                                                                  child: Text(
                                                                    'Add Specialties or area of focus',
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
                                                                      color: const Color(
                                                                          0xFF15141D),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 5, 0, 5),
                                                              width: 4,
                                                              height: 10,
                                                              child:
                                                                  const SizedBox(
                                                                width: 4,
                                                                height: 10,
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  size: 16,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                        color: const Color(
                                                            0xFFFFFFFF),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0A000000),
                                                            offset: Offset(0, 1),
                                                            blurRadius: 1.5,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0D2F3037),
                                                            offset: Offset(0, 24),
                                                            blurRadius: 34,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0A222A35),
                                                            offset: Offset(0, 4),
                                                            blurRadius: 3,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0D000000),
                                                            offset: Offset(0, 1),
                                                            blurRadius: 0.5,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Container(
                                                        padding: const EdgeInsets
                                                            .fromLTRB(
                                                            12, 10, 22, 10),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          8.4,
                                                                          0),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                99),
                                                                    color: const Color(
                                                                        0xFFFFFFFF),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x14123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                2),
                                                                        blurRadius:
                                                                            2,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                1),
                                                                        blurRadius:
                                                                            0.5,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x14123769),
                                                                        offset:
                                                                            Offset(
                                                                                0,
                                                                                0),
                                                                        blurRadius:
                                                                            0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 20,
                                                                    height: 20,
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .fromLTRB(
                                                                            5,
                                                                            5,
                                                                            5,
                                                                            5),
                                                                    child:
                                                                        SizedBox(
                                                                      width: 10,
                                                                      height: 10,
                                                                      child:
                                                                          ImageView
                                                                              .svg(
                                                                        AppImages
                                                                            .check,
                                                                        color: Colors
                                                                            .grey
                                                                            .shade300,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          0,
                                                                          1.5,
                                                                          0,
                                                                          1.5),
                                                                  child: Text(
                                                                    'Set consultation fee ',
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
                                                                      color: const Color(
                                                                          0xFF15141D),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 5, 0, 5),
                                                              width: 4,
                                                              height: 10,
                                                              child:
                                                                  const SizedBox(
                                                                width: 4,
                                                                height: 10,
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  size: 16,
                                                                ),
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              appointmentCard(),
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
                                          16, 12, 26, 11),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 289.1,
                                            height: 48,
                                            child: Container(
                                              padding: const EdgeInsets.fromLTRB(
                                                  0, 1, 0, 1),
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  const SizedBox(
                                                    width: 45,
                                                    height: 46,
                                                    child: ImageView.asset(
                                                        AppImages
                                                            .scheduleAppointment),
                                                  ),
                                                  Positioned(
                                                    right: 0,
                                                    bottom: 0,
                                                    child: SizedBox(
                                                      width: 228.1,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .fromLTRB(
                                                                    0, 0, 0, 8),
                                                            child: Align(
                                                              alignment: Alignment
                                                                  .topLeft,
                                                              child: Text(
                                                                'Schedule Appointment',
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
                                                          ),
                                                          Positioned(
                                                            bottom: 0,
                                                            child: SizedBox(
                                                              height: 20,
                                                              child: Text(
                                                                'Book appointment on behalf of a patient',
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
                                                              ),
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
                                                0, 7, 0, 31),
                                            width: 4,
                                            height: 10,
                                            child: const SizedBox(
                                              width: 4,
                                              height: 10,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 16,
                                              ),
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
                                          16, 12, 26, 11),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.fromLTRB(
                                                  0, 1, 0, 1),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const SizedBox(
                                                    width: 45,
                                                    height: 46,
                                                    child: ImageView.asset(
                                                        AppImages
                                                            .createPrescriptionn),
                                                  ),
                                                  SizedBox(
                                                    height: 48,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin: const EdgeInsets
                                                              .fromLTRB(
                                                              0, 0, 0, 8),
                                                          child: Align(
                                                            alignment:
                                                                Alignment.topLeft,
                                                            child: SizedBox(
                                                              height: 20,
                                                              child: SizedBox(
                                                                height: 20,
                                                                child: Text(
                                                                  'Create a New Prescription',
                                                                  style:
                                                                      GoogleFonts
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
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                          child: Text(
                                                            'Manage and provide patient prescriptions',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight.w400,
                                                              fontSize: 12,
                                                              height: 1.7,
                                                              color: const Color(
                                                                  0xFF6B7280),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 7, 0, 31),
                                            width: 4,
                                            height: 10,
                                            child: const SizedBox(
                                              width: 4,
                                              height: 10,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 16,
                                              ),
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
                                      padding:
                                          const EdgeInsets.fromLTRB(16, 0, 26, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 44.6, 0),
                                              child: SizedBox(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 11, 0, 11),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const SizedBox(
                                                        width: 45,
                                                        height: 46,
                                                        child: ImageView.asset(
                                                            AppImages
                                                                .viewPatient),
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.sizeOf(
                                                                    context)
                                                                .width *
                                                            0.6,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      0, 0, 0, 8),
                                                              child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Container(
                                                                  child: Text(
                                                                    'View Patient Profiles',
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
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              'Access comprehensive patient profiles for streamlined virtual consultations.',
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
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 7, 0, 51),
                                            width: 4,
                                            height: 10,
                                            child: const SizedBox(
                                              width: 4,
                                              height: 10,
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                size: 16,
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
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0.2, 0, 0.2, 16),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Analytics',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: const Color(0xFF15141D),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(9999),
                                                color: const Color(0xFFFAFAFB),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0x1A2F3037),
                                                    offset: Offset(0, 0),
                                                    blurRadius: 0,
                                                  ),
                                                ],
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 4, 7.9, 4),
                                                child: Text(
                                                  '1 day',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    height: 1.4,
                                                    color:
                                                        const Color(0xFF5E5F6E),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(9999),
                                                color: const Color(0xFFFAFAFB),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0x1A2F3037),
                                                    offset: Offset(0, 0),
                                                    blurRadius: 0,
                                                  ),
                                                ],
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 4, 7.7, 4),
                                                child: Text(
                                                  '7days',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    height: 1.4,
                                                    color:
                                                        const Color(0xFF5E5F6E),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(9999),
                                                color: const Color(0xFF2F3037),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0x4D2F3037),
                                                    offset: Offset(0, 2),
                                                    blurRadius: 2,
                                                  ),
                                                  BoxShadow(
                                                    color: Color(0xFF2F3037),
                                                    offset: Offset(0, 0),
                                                    blurRadius: 0,
                                                  ),
                                                ],
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        8, 4, 8.9, 4),
                                                child: Text(
                                                  '30days',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    height: 1.4,
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 358,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFFE2E4E9)),
                                          borderRadius: BorderRadius.circular(12),
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
                                          width: 358,
                                          padding: const EdgeInsets.fromLTRB(
                                              3, 3, 3, 3),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 16, 10, 0),
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                            height: 80,
                                                            width: 80,
                                                            child: ImageView.svg(
                                                                AppImages
                                                                    .noData)),
                                                        Container(
                                                          margin: const EdgeInsets
                                                              .fromLTRB(
                                                              0, 0, 0, 15),
                                                          child: Text(
                                                            'No Data Available Yet. ',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize: 14,
                                                              height: 1.7,
                                                              color: const Color(
                                                                  0xFF0A0D14),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Once you start using the app for consultations and prescriptions, your analytics will be displayed here',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              GoogleFonts.getFont(
                                                            'Inter',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12,
                                                            height: 1.7,
                                                            color: const Color(
                                                                0xFF6B7280),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 30,
                                                        )
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        analyticsData()
                      ],
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
