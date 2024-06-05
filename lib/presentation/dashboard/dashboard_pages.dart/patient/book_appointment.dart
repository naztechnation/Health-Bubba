import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/app_images.dart';
import '../../../../widgets/image_view.dart';

class BookAppointentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Book a Time & Date',
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
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 134),
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
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Select Date',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        height: 1.7,
                                        color: const Color(0xFF0A0D14),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFFE8E8E8)),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: const Color(0xFFFFFFFF),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0xFFF2F2F2),
                                            offset: Offset(0, 1),
                                            blurRadius: 1,
                                          ),
                                        ],
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                             5, 3, 13.2, 3),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 8.7, 0),
                                              child: Text(
                                                'Jan, 2024',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xFF111827),
                                                ),
                                              ),
                                            ),
                                           const Padding(
                                              padding:  EdgeInsets.only(top: 5.0),
                                              child:   Icon(Icons.arrow_forward_ios, size: 13,),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(11, 11, 11, 11),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFE5E7EB)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          14.6, 6, 14.6, 6),
                                                  child: Text(
                                                    'M',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF9CA3AF),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16.2, 6, 16.2, 6),
                                                  child: Text(
                                                    'T',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF9CA3AF),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          14.1, 6, 14.1, 6),
                                                  child: Text(
                                                    'W',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF9CA3AF),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16.2, 6, 16.2, 6),
                                                  child: Text(
                                                    'T',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF9CA3AF),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16.6, 6, 16.6, 6),
                                                  child: Text(
                                                    'F',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF9CA3AF),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16.2, 6, 16.2, 6),
                                                  child: Text(
                                                    'S',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF9CA3AF),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16.2, 6, 16.2, 6),
                                                child: Text(
                                                  'S',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFF9CA3AF),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12.4, 6, 12.4, 6),
                                                  child: Text(
                                                    '26',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFFD1D5DB),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12.7, 6, 12.7, 6),
                                                  child: Text(
                                                    '27',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFFD1D5DB),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12.5, 6, 12.5, 6),
                                                  child: Text(
                                                    '28',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFFD1D5DB),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12.4, 6, 12.4, 6),
                                                  child: Text(
                                                    '29',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFFD1D5DB),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12, 6, 12, 6),
                                                  child: Text(
                                                    '30',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFFD1D5DB),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          17.4, 6, 17.4, 6),
                                                  child: Text(
                                                    '1',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16.4, 6, 16.4, 6),
                                                child: Text(
                                                  '2',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFF030712),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16.2, 6, 16.2, 6),
                                                  child: Text(
                                                    '3',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16.2, 6, 16.2, 6),
                                                  child: Text(
                                                    '4',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16.4, 6, 16.4, 6),
                                                  child: Text(
                                                    '5',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16.3, 6, 16.3, 6),
                                                  child: Text(
                                                    '6',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16.7, 6, 16.7, 6),
                                                  child: Text(
                                                    '7',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16.3, 6, 16.3, 6),
                                                  child: Text(
                                                    '8',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
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
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          16.3, 6, 16.3, 6),
                                                  child: Text(
                                                    '9',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
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
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          13.2, 6, 13.2, 6),
                                                  child: Text(
                                                    '10',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          14.3, 6, 14.3, 6),
                                                  child: Text(
                                                    '11',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF40A758),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          13.4, 6, 13.4, 6),
                                                  child: Text(
                                                    '12',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFFFFFFFF),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          13.2, 6, 13.2, 6),
                                                  child: Text(
                                                    '13',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Opacity(
                                                opacity: 0.5,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  child: Container(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        13.1, 6, 13.1, 6),
                                                    child: Text(
                                                      '14',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        height: 1.5,
                                                        color: const Color(
                                                            0xFF030712),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          13.3, 6, 13.3, 6),
                                                  child: Text(
                                                    '15',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        13.2, 6, 13.2, 6),
                                                child: Text(
                                                  '16',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFF030712),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
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
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          13.6, 6, 13.6, 6),
                                                  child: Text(
                                                    '17',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          13.3, 6, 13.3, 6),
                                                  child: Text(
                                                    '18',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          13.2, 6, 13.2, 6),
                                                  child: Text(
                                                    '19',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12.2, 6, 12.2, 6),
                                                  child: Text(
                                                    '20',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 20.6, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          13.4, 6, 13.4, 6),
                                                  child: Text(
                                                    '21',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 6, 20.6, 6),
                                              child: Text(
                                                '22',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                  height: 1.5,
                                                  color:
                                                      const Color(0xFF030712),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        12.3, 6, 12.3, 6),
                                                child: Text(
                                                  '23',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFF030712),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12.3, 6, 12.3, 6),
                                                  child: Text(
                                                    '24',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12.4, 6, 12.4, 6),
                                                  child: Text(
                                                    '25',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12.3, 6, 12.3, 6),
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Text(
                                                        '26',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13,
                                                          height: 1.5,
                                                          color: const Color(
                                                              0xFF030712),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right: -7.5,
                                                        top: -1,
                                                        child: Container(
                                                          width: 4,
                                                          height: 4,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFF40A758),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2),
                                                            ),
                                                            child: Container(
                                                              width: 4,
                                                              height: 4,
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
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12.7, 6, 12.7, 6),
                                                  child: Text(
                                                    '27',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12.5, 6, 12.5, 6),
                                                  child: Text(
                                                    '28',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 8, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          12.3, 6, 12.3, 6),
                                                  child: Text(
                                                    '29',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.5,
                                                      color: const Color(
                                                          0xFF030712),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        12, 6, 12, 6),
                                                child: Text(
                                                  '30',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFF030712),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 8, 0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        13.3, 6, 13.3, 6),
                                                child: Text(
                                                  '31',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFF030712),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 8, 0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        17.4, 6, 17.4, 6),
                                                child: Text(
                                                  '1',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFFD1D5DB),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 8, 0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16.4, 6, 16.4, 6),
                                                child: Text(
                                                  '2',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFFD1D5DB),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 8, 0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16.2, 6, 16.2, 6),
                                                child: Text(
                                                  '3',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFFD1D5DB),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 8, 0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16.2, 6, 16.2, 6),
                                                child: Text(
                                                  '4',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFFD1D5DB),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 8, 0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16.4, 6, 16.4, 6),
                                                child: Text(
                                                  '5',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFFD1D5DB),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      16.3, 6, 16.3, 6),
                                              child: Text(
                                                '6',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                  height: 1.5,
                                                  color:
                                                      const Color(0xFFD1D5DB),
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
                          padding: const EdgeInsets.fromLTRB(16, 16, 25.8, 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    child: Text(
                                      'Select Time Slot',
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
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 0, 15.6, 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 12, 0),
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
                                                      8, 4, 7.4, 4),
                                              child: Text(
                                                '8:00 AM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF5E5F6E),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 12, 0),
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
                                                      8, 4, 7.5, 4),
                                              child: Text(
                                                '8:30 AM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF5E5F6E),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 12, 0),
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
                                                      8, 4, 7.4, 4),
                                              child: Text(
                                                '9:30 AM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF5E5F6E),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
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
                                                '10:30 AM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF5E5F6E),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 12, 0),
                                            child: Opacity(
                                              opacity: 0.5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9999),
                                                  color:
                                                      const Color(0xFFFAFAFB),
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
                                                          8, 4, 8, 4),
                                                  child: Text(
                                                    '11:00 AM',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF5E5F6E),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 12, 0),
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
                                                      8, 4, 8.1, 4),
                                              child: Text(
                                                '11:30 AM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF5E5F6E),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 12, 0),
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
                                                  color: Color(0x33000000),
                                                  offset: Offset(0, 2),
                                                  blurRadius: 6.5,
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
                                                      8, 4, 8.5, 4),
                                              child: Text(
                                                '12:00 PM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
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
                                                      8, 4, 8, 4),
                                              child: Text(
                                                '12:30 PM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF5E5F6E),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 0, 30.6, 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 12, 0),
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
                                                      8, 4, 7.5, 4),
                                              child: Text(
                                                '1:00 PM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF5E5F6E),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 12, 0),
                                            child: Opacity(
                                              opacity: 0.5,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9999),
                                                  color:
                                                      const Color(0xFFFAFAFB),
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
                                                          8, 4, 7.5, 4),
                                                  child: Text(
                                                    '1:30 PM',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF5E5F6E),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 12, 0),
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
                                                      8, 4, 7.5, 4),
                                              child: Text(
                                                '2:00 PM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF5E5F6E),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
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
                                                      8, 4, 7.6, 4),
                                              child: Text(
                                                '2:30 PM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF5E5F6E),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 0, 22.6, 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 12, 0),
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
                                                      8, 4, 8.1, 4),
                                              child: Text(
                                                '3:00 PM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF5E5F6E),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 12, 0),
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
                                                      8, 4, 8.7, 4),
                                              child: Text(
                                                '3:30 PM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF5E5F6E),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 12, 0),
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
                                                      8, 4, 8, 4),
                                              child: Text(
                                                '4:00 PM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF5E5F6E),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
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
                                                      8, 4, 8, 4),
                                              child: Text(
                                                '4:30 PM',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF5E5F6E),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 4, 7.5, 4),
                                            child: Text(
                                              '5:00 PM',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF5E5F6E),
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
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 4, 7.5, 4),
                                            child: Text(
                                              '5:30 PM',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF5E5F6E),
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
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 4, 8.2, 4),
                                            child: Text(
                                              '6:00 PM',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF5E5F6E),
                                              ),
                                            ),
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
                    ],
                  ),
                ),
                Container(
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
                      child: Container(
                        width: double.infinity,
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
                            'Book Appointment',
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
          ),
        ),
      ),
    );
  }
}
