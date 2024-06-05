


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';

appointmentCard(){
  return Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border(
                        bottom: BorderSide (
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
                                  margin: const EdgeInsets.fromLTRB(8, 0, 6.4, 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Upcoming Appointment',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          height: 1.4,
                                          color: const Color(0xFF0A0D14),
                                        ),
                                      ),
                                      Container(
                                        width: 73.6,
                                        height: 20,
                                        child: Positioned(
                                          bottom: 0,
                                          child: SizedBox(
                                            height: 20,
                                            child: Text(
                                              'View all (6)',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF0A0D14),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
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
                                          width: 210.1,
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
                                                    width: 139.1,
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
                                                            'Adewale Abass',
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
                                          child: const SizedBox(
                                            width: 30.1,
                                            height: 30.8,
                                            child: ImageView.svg(AppImages.videoIcon),
                                          ),
                                        ),
                                      ],
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 208.9,
                                          child: Container(
                                            padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                const SizedBox(
                                                  width: 53.8,
                                                  height: 55,
                                                  child: ImageView.svg(AppImages.avatar),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  bottom: 0,
                                                  child: SizedBox(
                                                    width: 139.1,
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
                                          child: const SizedBox(
                                            width: 30.1,
                                            height: 30.8,
                                            child: ImageView.svg(AppImages.videoIcon)
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
                  );
}

analyticsData(){
  return Container(
                    decoration:const BoxDecoration(
                      color:  Color(0xFFFFFFFF),
                      border: Border(
                        bottom: BorderSide (
                          color:   Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0.2, 0, 0.2, 16),
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
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(9999),
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
                                          padding: const EdgeInsets.fromLTRB(8, 4, 7.9, 4),
                                          child: Text(
                                            '1 day',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(9999),
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
                                          padding: const EdgeInsets.fromLTRB(8, 4, 7.7, 4),
                                          child: Text(
                                            '7days',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(9999),
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
                                          padding: const EdgeInsets.fromLTRB(8, 4, 8.9, 4),
                                          child: Text(
                                            '30days',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFFE2E4E9)),
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
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
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
                                                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                                            child: Align(
                                                              alignment: Alignment.topLeft,
                                                              child: Text(
                                                                'Total Consultations',
                                                                style: GoogleFonts.getFont(
                                                                  'Inter',
                                                                  fontWeight: FontWeight.w400,
                                                                  fontSize: 12,
                                                                  height: 1.6,
                                                                  color: const Color(0xFF6B7280),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment.topLeft,
                                                            child: Container(
                                                              child: Text(
                                                                '50',
                                                                style: GoogleFonts.getFont(
                                                                  'Inter',
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 16,
                                                                  height: 1.5,
                                                                  letterSpacing: -0.2,
                                                                  color: const Color(0xFF0A0D14),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
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
                                                    child: Container(
                                                      padding: const EdgeInsets.fromLTRB(8, 8, 17.1, 8),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                                            child: Text(
                                                              'Total Prescriptions Issued',
                                                              style: GoogleFonts.getFont(
                                                                'Inter',
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12,
                                                                height: 1.6,
                                                                color: const Color(0xFF6B7280),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment.topLeft,
                                                            child: Container(
                                                              child: Text(
                                                                '456',
                                                                style: GoogleFonts.getFont(
                                                                  'Inter',
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 16,
                                                                  height: 1.5,
                                                                  letterSpacing: -0.2,
                                                                  color: const Color(0xFF0A0D14),
                                                                ),
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
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
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
                                                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                                          child: Align(
                                                            alignment: Alignment.topLeft,
                                                            child: Text(
                                                              'Total Revenue',
                                                              style: GoogleFonts.getFont(
                                                                'Inter',
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12,
                                                                height: 1.6,
                                                                color: const Color(0xFF6B7280),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment.topLeft,
                                                          child: Container(
                                                            child: Text(
                                                              '₦ 556,789',
                                                              style: GoogleFonts.getFont(
                                                                'Inter',
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 16,
                                                                height: 1.5,
                                                                letterSpacing: -0.2,
                                                                color: const Color(0xFF0A0D14),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
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
                                                  child: Container(
                                                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                                          child: Align(
                                                            alignment: Alignment.topLeft,
                                                            child: Text(
                                                              'Patient Demographic',
                                                              style: GoogleFonts.getFont(
                                                                'Inter',
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12,
                                                                height: 1.6,
                                                                color: const Color(0xFF6B7280),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment.topLeft,
                                                          child: Container(
                                                            child: Text(
                                                              'M/F - 60/63',
                                                              style: GoogleFonts.getFont(
                                                                'Inter',
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 16,
                                                                height: 1.5,
                                                                letterSpacing: -0.2,
                                                                color: const Color(0xFF0A0D14),
                                                              ),
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
                                        ],
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
                  );
}