

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/app_images.dart';
import '../../../../widgets/image_view.dart';

patientCard({required BuildContext context}){
  return Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                
              ),
              child: Container(
                width: double.infinity,padding: const EdgeInsets.fromLTRB(16, 3, 16, 3),
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
                              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                              child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                
                                children: [
                                  Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        width: 42.1,
                                        height: 43,
                                        child: ImageView.svg(AppImages.avatar),
                                      ),
                                      const SizedBox(width: 12,),
                                      SizedBox(
                                        width: MediaQuery.sizeOf(context).width * 0.55,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Akeem Adewales',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF0A0D14),
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
                                      ),
                                      
                                    ],
                                  ),
                                 const Padding(
                                    padding:  EdgeInsets.only(right: 8.0),
                                    child:   SizedBox(
                                             width: 4,
                                                            height: 10,
                                                            child:   Icon(
                                                              Icons.arrow_forward_ios,
                                                              size: 16,
                                                              color:   Color(0xFF6B7280),
                                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                         // here
                          
                          
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
}