import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
 
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/frame_2018776730.jpeg',
                          ),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 68),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: SizedBox(
                                      width: 281.3,
                                      child: Text(
                                        '9:41',
                                        style: GoogleFonts.getFont(
                                          'Roboto Condensed',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          height: 1.3,
                                          letterSpacing: -0.2,
                                          color: const Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(0, 4.3, 0, 4.3),
                                    child: SizedBox(
                                      width: 66.7,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(0, 0, 5, 0.7),
                                            child: SizedBox(
                                              width: 17,
                                              height: 10.7,
                                              child: SvgPicture.asset(
                                                'assets/vectors/Unknown',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(0, 0, 5, 0.3),
                                            child: SizedBox(
                                              width: 15.3,
                                              height: 11,
                                              child: SvgPicture.asset(
                                                'assets/vectors/Unknown',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 24.3,
                                            height: 11.3,
                                            child: SvgPicture.asset(
                                              'assets/vectors/Unknown',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 20.625,
                                    sigmaY: 20.625,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0x0D000000),
                                      borderRadius: BorderRadius.circular(16.5),
                                    ),
                                    child: SizedBox(
                                      width: 33,
                                      height: 33,
                                      child: Positioned(
                                        left: 14,
                                        bottom: 11,
                                        child: SizedBox(
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
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 48),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            border: Border(
                              top: BorderSide (
                                color: Color(0xFFE5E7EB),
                                width: 1,
                              ),
                              bottom: BorderSide (
                                color: Color(0xFFE5E7EB),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
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
                                              'Personal',
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
                                          padding: const EdgeInsets.fromLTRB(12, 10, 22, 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 127.2,
                                                height: 20,
                                                child: Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child: SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child: SvgPicture.asset(
                                                          'assets/vectors/Unknown',
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 0,
                                                      bottom: 0,
                                                      child: SizedBox(
                                                        height: 20,
                                                        child: Text(
                                                          'Profile Details',
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
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                                          padding: const EdgeInsets.fromLTRB(14.7, 10, 22, 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 146.2,
                                                height: 20,
                                                child: Container(
                                                  padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      SizedBox(
                                                        width: 14.6,
                                                        height: 15,
                                                        child: SizedBox(
                                                          width: 14.6,
                                                          height: 15,
                                                          child: SvgPicture.asset(
                                                            'assets/vectors/Unknown',
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: 0,
                                                        bottom: 0,
                                                        child: SizedBox(
                                                          height: 20,
                                                          child: Text(
                                                            'Work Information',
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                                          padding: const EdgeInsets.fromLTRB(12, 10, 22, 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 152.5,
                                                height: 20,
                                                child: Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child: SvgPicture.asset(
                                                        'assets/vectors/Unknown',
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 0,
                                                      bottom: 0,
                                                      child: SizedBox(
                                                        height: 20,
                                                        child: Text(
                                                          'Payment Settings',
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
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                                        margin: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            child: Text(
                                              'Notifications, Help & Security',
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
                                          padding: const EdgeInsets.fromLTRB(15.3, 10, 22, 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 167.6,
                                                height: 20,
                                                child: Container(
                                                  padding: const EdgeInsets.fromLTRB(0, 1.7, 0, 1.7),
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      SizedBox(
                                                        width: 13.3,
                                                        height: 16.7,
                                                        child: SizedBox(
                                                          width: 13.3,
                                                          height: 16.7,
                                                          child: SvgPicture.asset(
                                                            'assets/vectors/Unknown',
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: 0,
                                                        bottom: 0,
                                                        child: SizedBox(
                                                          height: 20,
                                                          child: Text(
                                                            'Notification Settings',
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                                          padding: const EdgeInsets.fromLTRB(12, 10, 22, 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 211.6,
                                                height: 20,
                                                child: Stack(
                                                  children: [
                                                    SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child: SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child: SvgPicture.asset(
                                                          'assets/vectors/Unknown',
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 0,
                                                      bottom: 0,
                                                      child: SizedBox(
                                                        height: 20,
                                                        child: Text(
                                                          'Get Help. Contact Support',
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
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                                          padding: const EdgeInsets.fromLTRB(14.5, 10, 22, 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 125.3,
                                                height: 20,
                                                child: Container(
                                                  padding: const EdgeInsets.fromLTRB(0, 1.7, 0, 1.7),
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      SizedBox(
                                                        width: 15,
                                                        height: 16.7,
                                                        child: SizedBox(
                                                          width: 15,
                                                          height: 16.7,
                                                          child: SvgPicture.asset(
                                                            'assets/vectors/Unknown',
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: 0,
                                                        bottom: 0,
                                                        child: SizedBox(
                                                          height: 20,
                                                          child: Text(
                                                            'Privacy Policy',
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                                          padding: const EdgeInsets.fromLTRB(15.3, 10, 22, 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 159.5,
                                                height: 20,
                                                child: Container(
                                                  padding: const EdgeInsets.fromLTRB(0, 1.7, 0, 1.7),
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      SizedBox(
                                                        width: 13.3,
                                                        height: 16.7,
                                                        child: SizedBox(
                                                          width: 13.3,
                                                          height: 16.7,
                                                          child: SvgPicture.asset(
                                                            'assets/vectors/Unknown',
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: 0,
                                                        bottom: 0,
                                                        child: SizedBox(
                                                          height: 20,
                                                          child: Text(
                                                            'Password Manager',
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                                        margin: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            child: Text(
                                              'Sign Out or Deactivate',
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
                                          padding: const EdgeInsets.fromLTRB(13.7, 10, 22, 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 91.1,
                                                height: 20,
                                                child: Container(
                                                  padding: const EdgeInsets.fromLTRB(0, 3.3, 0, 3.3),
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      SizedBox(
                                                        width: 16.7,
                                                        height: 13.3,
                                                        child: SizedBox(
                                                          width: 16.7,
                                                          height: 13.3,
                                                          child: SvgPicture.asset(
                                                            'assets/vectors/Unknown',
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: 0,
                                                        bottom: 0,
                                                        child: SizedBox(
                                                          height: 20,
                                                          child: Text(
                                                            'Sign Out',
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                                          padding: const EdgeInsets.fromLTRB(13.7, 10, 22, 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 140,
                                                height: 20,
                                                child: Container(
                                                  padding: const EdgeInsets.fromLTRB(0, 1.7, 0, 1.7),
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      SizedBox(
                                                        width: 16.7,
                                                        height: 16.7,
                                                        child: SizedBox(
                                                          width: 16.7,
                                                          height: 16.7,
                                                          child: SvgPicture.asset(
                                                            'assets/vectors/Unknown',
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: 0,
                                                        bottom: 0,
                                                        child: SizedBox(
                                                          height: 20,
                                                          child: Text(
                                                            'Delete Account',
                                                            style: GoogleFonts.getFont(
                                                              'Inter',
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 14,
                                                              height: 1.4,
                                                              color: const Color(0xFFFF0000),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                      color: Color(0xFFF6F8FA),
                      border: Border(
                        bottom: BorderSide (
                          color: Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0.9, 16, 0, 15),
                      child: Text(
                        'v1.0.0',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 1.7,
                          color: const Color(0xFF0A0D14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 146,
              top: 101,
              child: Container(
                width: 91,
                height: 91,
                padding: const EdgeInsets.fromLTRB(4, 4.5, 4, 3.5),
                child: SizedBox(
                  width: 83,
                  height: 83,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(41.5),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/ellipse_231.png',
                        ),
                      ),
                    ),
                    child: const SizedBox(
                      width: 83,
                      height: 83,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}