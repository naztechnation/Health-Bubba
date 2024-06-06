import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard_pages.dart/patient/book_appointment.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';

import '../../../../res/app_colors.dart';
import '../../../../widgets/button_view.dart';

class PatientDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Akeem Adewale',
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
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 79),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          border: Border(
                            top: BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 1,
                            ),
                            bottom: BorderSide(
                              color: Color(0xFFE5E7EB),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 16, 0, 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0.3, 0, 0, 16),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: const SizedBox(
                                            width: 62.6,
                                            height: 64,
                                            child: ImageView.asset(
                                              AppImages.onboardingOne,
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                    Text(
                                      'Akeem Adewale',
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
                          padding: const EdgeInsets.fromLTRB(16, 16, 16.7, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 11, 6, 11),
                                    width: 20,
                                    height: 20,
                                    child: const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: ImageView.svg(AppImages.ageIcon),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 2),
                                        child: Text(
                                          'Age',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 11.8, 0),
                                        child: Text(
                                          '24',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 1.7,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 12.7, 6, 12.7),
                                    width: 20,
                                    height: 20,
                                    child: const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child:
                                          ImageView.svg(AppImages.weightIcon),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 2),
                                        child: Text(
                                          'Weight',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 15.8, 0),
                                        child: Text(
                                          '56KG',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 1.7,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 13.2, 6, 12.6),
                                    width: 20,
                                    height: 20,
                                    child: const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child:
                                          ImageView.svg(AppImages.genderIcon),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 2),
                                        child: Text(
                                          'Gender+',
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
                                          'Male',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 1.7,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ],
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
                          padding: const EdgeInsets.fromLTRB(16, 16, 0, 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 1, 8, 1),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFFFFFFF),
                                        ),
                                        child: Container(
                                          width: 23,
                                          height: 23,
                                          padding: const EdgeInsets.fromLTRB(
                                              1.5, 1.5, 1.5, 1.5),
                                          child: const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: ImageView.svg(
                                              AppImages.tick,
                                            ),
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
                                        color: const Color(0xFF131316),
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
                          padding: const EdgeInsets.fromLTRB(16, 16, 0, 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Current Health Conditions',
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 1, 8, 1),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                                child: Container(
                                                  width: 23,
                                                  height: 23,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          1.5, 1.5, 1.5, 1.5),
                                                  child: const SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child: ImageView.svg(
                                                      AppImages.tick,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Vitamin Deficiency',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                height: 1.5,
                                                color: const Color(0xFF131316),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 1, 8, 1),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                                child: Container(
                                                  width: 23,
                                                  height: 23,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          1.5, 1.5, 1.5, 1.5),
                                                  child: const SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child: ImageView.svg(
                                                      AppImages.tick,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Osteoporosis',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                height: 1.5,
                                                color: const Color(0xFF131316),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 1, 8, 1),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFFFFFFF),
                                              ),
                                              child: Container(
                                                width: 23,
                                                height: 23,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        1.5, 1.5, 1.5, 1.5),
                                                child: const SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: ImageView.svg(
                                                    AppImages.tick,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Dermatological Problems',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              height: 1.5,
                                              color: const Color(0xFF131316),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 1, 8, 1),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                                child: Container(
                                                  width: 23,
                                                  height: 23,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          1.5, 1.5, 1.5, 1.5),
                                                  child: const SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child: ImageView.svg(
                                                      AppImages.tick,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Athritis',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                height: 1.5,
                                                color: const Color(0xFF131316),
                                              ),
                                            ),
                                          ],
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
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 1, 8, 1),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFFFFFFF),
                                              ),
                                              child: Container(
                                                width: 23,
                                                height: 23,
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        1.5, 1.5, 1.5, 1.5),
                                                child: const SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: ImageView.svg(
                                                    AppImages.tick,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Cholesterol',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              height: 1.5,
                                              color: const Color(0xFF131316),
                                            ),
                                          ),
                                        ],
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
                          padding: const EdgeInsets.fromLTRB(16, 16, 0, 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Appointments',
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
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Next Appointment: ',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          height: 1.5,
                                          color: const Color(0xFF131316),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'May 18, 2024, 10:00 AM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              height: 1.3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Last Appointment: ',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        height: 1.5,
                                        color: const Color(0xFF131316),
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'April 15, 2024, 11:00 AM',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            height: 1.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Upcoming Appointments: ',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          height: 1.5,
                                          color: const Color(0xFF131316),
                                        ),
                                        children: [
                                          TextSpan(
                                            text: '2',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                              height: 1.3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Number of Consultations: ',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      height: 1.5,
                                      color: const Color(0xFF131316),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '5',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          height: 1.3,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xFF093126),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33212126),
                  offset: Offset(0, 1),
                  blurRadius: 1.5,
                ),
                BoxShadow(
                  color: Color(0xFF083025),
                  offset: Offset(0, 0),
                  blurRadius: 0,
                ),
              ],
            ),
            child: ButtonView(
                onPressed: () {
                  AppNavigator.pushAndStackPage(context,
                      page: const BookAppointentPage(
                        isReBookAppointment: false,
                      ));
                },
                borderRadius: 100,
                color: AppColors.lightSecondary,
                child: const Text(
                  'Schedule an Appointment',
                  style: TextStyle(
                      color: AppColors.lightPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )),
          ),
        ),
      ),
    );
  }
}
