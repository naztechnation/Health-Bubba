import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
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
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(26, 12, 18.5, 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 7, 0, 7),
                            width: 4,
                            height: 10,
                            child: SizedBox(
                              width: 4,
                              height: 10,
                              child: SvgPicture.asset(
                                'assets/vectors/Unknown',
                              ),
                            ),
                          ),
                          Text(
                            'Appointments',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 1.5,
                              color: const Color(0xFF0A0D14),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 4.5, 0, 4.5),
                            width: 15,
                            height: 15,
                            child: SizedBox(
                              width: 15,
                              height: 15,
                              child: SvgPicture.asset(
                                'assets/vectors/Unknown',
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
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF1F5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(2, 2, 23.6, 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      color: const Color(0xFFFFFFFF),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x0D000000),
                                          offset: Offset(0, 4),
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                      child: Text(
                                        'Upcoming',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          height: 1.4,
                                          color: const Color(0xFF0A0D14),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(0, 12, 23.2, 12),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFA09CAB),
                                      ),
                                      child: Container(
                                        height: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(0, 8, 24.2, 8),
                                    child: Text(
                                      'Completed',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        height: 1.4,
                                        color: const Color(0xFF6B7280),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(0, 12, 26.6, 12),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFA09CAB),
                                      ),
                                      child: Container(
                                        height: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                    child: Text(
                                      'Cancelled',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        height: 1.4,
                                        color: const Color(0xFF6B7280),
                                      ),
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
                  Container(
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
                                  margin: const EdgeInsets.fromLTRB(8, 0, 10, 11),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 151.7,
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
                                                color: const Color(0xFF0A0D14),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(0, 6, 0, 4),
                                        width: 4,
                                        height: 10,
                                        child: SizedBox(
                                          width: 4,
                                          height: 10,
                                          child: SvgPicture.asset(
                                            'assets/vectors/Unknown',
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
                                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 208.9,
                                          height: 60,
                                          child: Container(
                                            padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                SizedBox(
                                                  width: 53.8,
                                                  height: 55,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/Unknown',
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  bottom: 0,
                                                  child: SizedBox(
                                                    width: 139.1,
                                                    height: 60,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.topLeft,
                                                          child: Text(
                                                            'Video Consultation',
                                                            style: GoogleFonts.getFont(
                                                              'Inter',
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 12,
                                                              height: 1.7,
                                                              color: const Color(0xFF6B7280),
                                                            ),
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
                                                        RichText(
                                                          text: TextSpan(
                                                            style: GoogleFonts.getFont(
                                                              'Inter',
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 12,
                                                              height: 1.7,
                                                              color: const Color(0xFF6B7280),
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text: 'Today, 2:30pm',
                                                                style: GoogleFonts.getFont(
                                                                  'Inter',
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 12,
                                                                  height: 1.3,
                                                                  color: const Color(0xFF6C7079),
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: ' (30mins)',
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
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(0, 29.2, 0, 0),
                                          child: SizedBox(
                                            width: 30.1,
                                            height: 30.8,
                                            child: SvgPicture.asset(
                                              'assets/vectors/Unknown',
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
                    ),
                  ),
                  Container(
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
                                  margin: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
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
                                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: SizedBox(
                                              width: 209.1,
                                              height: 60,
                                              child: Container(
                                                padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: const Color(0xFFE1E3E8),
                                                        borderRadius: BorderRadius.circular(119.6),
                                                      ),
                                                      child: SizedBox(
                                                        width: 55,
                                                        height: 55,
                                                        child: Container(
                                                          padding: const EdgeInsets.fromLTRB(17.9, 12, 19.1, 0),
                                                          child: Stack(
                                                            clipBehavior: Clip.none,
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(9),
                                                                  color: const Color(0xFFF5F6F8),
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                      color: Color(0x40BBBBBB),
                                                                      offset: Offset(0, 2),
                                                                      blurRadius: 1.9927535057,
                                                                    ),
                                                                  ],
                                                                ),
                                                                child: Container(
                                                                  width: 17.9,
                                                                  height: 17.9,
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: -13.2,
                                                                bottom: -23.9,
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(22.7),
                                                                    gradient: const LinearGradient(
                                                                      begin: Alignment(0, -1),
                                                                      end: Alignment(0, 1),
                                                                      colors: <Color>[Color(0xFFF5F6F8), Color(0x00F5F6F8)],
                                                                      stops: <double>[0, 1],
                                                                    ),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Color(0x40BBBBBB),
                                                                        offset: Offset(0, 5),
                                                                        blurRadius: 5.0483083725,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: Container(
                                                                    width: 45.4,
                                                                    height: 45.4,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 0,
                                                      bottom: 0,
                                                      child: SizedBox(
                                                        width: 138.1,
                                                        height: 60,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Align(
                                                              alignment: Alignment.topLeft,
                                                              child: Text(
                                                                'Video Consultation',
                                                                style: GoogleFonts.getFont(
                                                                  'Inter',
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 12,
                                                                  height: 1.7,
                                                                  color: const Color(0xFF6B7280),
                                                                ),
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
                                                            RichText(
                                                              text: TextSpan(
                                                                style: GoogleFonts.getFont(
                                                                  'Inter',
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 12,
                                                                  height: 1.7,
                                                                  color: const Color(0xFF6B7280),
                                                                ),
                                                                children: [
                                                                  TextSpan(
                                                                    text: 'Today, 2:30pm',
                                                                    style: GoogleFonts.getFont(
                                                                      'Inter',
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 12,
                                                                      height: 1.3,
                                                                      color: const Color(0xFF6C7079),
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: ' (30mins)',
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
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFE5E7EB),
                                            ),
                                            child: Container(
                                              width: 326,
                                              height: 1,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100),
                                                  color: const Color(0xFFFFFFFF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color(0x40E7E7E7),
                                                      offset: Offset(0, 4),
                                                      blurRadius: 2,
                                                    ),
                                                    BoxShadow(
                                                      color: Color(0xFFE9E9E9),
                                                      offset: Offset(0, 0),
                                                      blurRadius: 0,
                                                    ),
                                                  ],
                                                ),
                                                child: Container(
                                                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color(0x40000000),
                                                          offset: Offset(0, 0),
                                                          blurRadius: 0.5,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Text(
                                                      'Cancel',
                                                      style: GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        height: 1.6,
                                                        color: const Color(0xFF1F2123),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Opacity(
                                                opacity: 0.5,
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
                                                  child: Container(
                                                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                                    child: Container(
                                                      decoration: const BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color(0x40000000),
                                                            offset: Offset(0, 0),
                                                            blurRadius: 0.5,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Text(
                                                        'Reschedule',
                                                        style: GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 14,
                                                          height: 1.6,
                                                          color: const Color(0xFFFFFFFF),
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
                        bottom:  BorderSide (
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
                                  margin: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                      child: Text(
                                        'Dec 3rd, 2023 - 2:30pm',
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
                                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: SizedBox(
                                              width: 208.9,
                                              height: 60,
                                              child: Container(
                                                padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    SizedBox(
                                                      width: 53.8,
                                                      height: 55,
                                                      child: SvgPicture.asset(
                                                        'assets/vectors/Unknown',
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 0,
                                                      bottom: 0,
                                                      child: SizedBox(
                                                        width: 139.1,
                                                        height: 60,
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Align(
                                                              alignment: Alignment.topLeft,
                                                              child: Text(
                                                                'Video Consultation',
                                                                style: GoogleFonts.getFont(
                                                                  'Inter',
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 12,
                                                                  height: 1.7,
                                                                  color: const Color(0xFF6B7280),
                                                                ),
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
                                                            RichText(
                                                              text: TextSpan(
                                                                style: GoogleFonts.getFont(
                                                                  'Inter',
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 12,
                                                                  height: 1.7,
                                                                  color: const Color(0xFF6B7280),
                                                                ),
                                                                children: [
                                                                  TextSpan(
                                                                    text: 'Today, 2:30pm',
                                                                    style: GoogleFonts.getFont(
                                                                      'Inter',
                                                                      fontWeight: FontWeight.w500,
                                                                      fontSize: 12,
                                                                      height: 1.3,
                                                                      color: const Color(0xFF6C7079),
                                                                    ),
                                                                  ),
                                                                  TextSpan(
                                                                    text: ' (30mins)',
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
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFE5E7EB),
                                            ),
                                            child: Container(
                                              width: 326,
                                              height: 1,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100),
                                                  color: const Color(0xFFFFFFFF),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color(0x40E7E7E7),
                                                      offset: Offset(0, 4),
                                                      blurRadius: 2,
                                                    ),
                                                    BoxShadow(
                                                      color: Color(0xFFE9E9E9),
                                                      offset: Offset(0, 0),
                                                      blurRadius: 0,
                                                    ),
                                                  ],
                                                ),
                                                child: Container(
                                                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color(0x40000000),
                                                          offset: Offset(0, 0),
                                                          blurRadius: 0.5,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Text(
                                                      'Cancel',
                                                      style: GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        height: 1.6,
                                                        color: const Color(0xFF1F2123),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
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
                                                child: Container(
                                                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Color(0x40000000),
                                                          offset: Offset(0, 0),
                                                          blurRadius: 0.5,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Text(
                                                      'Reschedule',
                                                      style: GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        height: 1.6,
                                                        color: const Color(0xFFFFFFFF),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                border: Border(
                  top:  BorderSide (
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
                padding: const EdgeInsets.fromLTRB(20.5, 11, 19.4, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(7.5, 0, 7.5, 5),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/vectors/Unknown',
                            ),
                          ),
                        ),
                        Text(
                          'Home',
                          style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.6,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 3, 30.5, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(16.3, 0, 16.3, 8),
                                width: 14,
                                height: 18,
                                child: SizedBox(
                                  width: 14,
                                  height: 18,
                                  child: SvgPicture.asset(
                                    'assets/vectors/Unknown',
                                  ),
                                ),
                              ),
                              Text(
                                'Patient',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 1.6,
                                  color: const Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 17.2, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                width: 24,
                                height: 24,
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: SvgPicture.asset(
                                    'assets/vectors/Unknown',
                                  ),
                                ),
                              ),
                              Text(
                                'Appointment',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  height: 1.6,
                                  color: const Color(0xFF40B93C),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: SvgPicture.asset(
                                  'assets/vectors/Unknown',
                                ),
                              ),
                            ),
                            Text(
                              'Medication',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                height: 1.6,
                                color: const Color(0xFF6B7280),
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
          ],
        ),
      ),
    );
  }
}