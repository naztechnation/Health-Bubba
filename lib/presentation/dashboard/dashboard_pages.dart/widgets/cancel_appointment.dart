


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/widgets/text_edit_view.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/image_view.dart';
import 'radio_button_widget.dart';

class CancelAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
       appBar: AppBar(
        title: const Center(
          child: Text(
            'Cancel Appointment',
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
        child: SingleChildScrollView(
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
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 12, 18.4, 12),
                      child: Text(
                        'Please let us know the reason for your cancellation so that we can better serve you. We care about your health!',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.6,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                  padding: const EdgeInsets.fromLTRB(16, 15, 0, 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       RadioButtonWidget()
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 310),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Others',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.4,
                              color: const Color(0xFF131316),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFFFFFFF),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFF40B93C),
                              offset: Offset(0, 0),
                              blurRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x409F9E9E),
                              offset: Offset(0, 1),
                              blurRadius: 1,
                            ),
                            BoxShadow(
                              color: Color(0x3690D68E),
                              offset: Offset(0, 0),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: TextEditView(controller: TextEditingController(),maxLines: 5, hintText: 'Please explain the reason you are cancelling',)
                      ),
                    ],
                  ),
                ),
              ),
               
            ],
          ),
        ),
      ),
      bottomNavigationBar:  Container(
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
          child: ButtonView(
                  onPressed: () {
                    
                  },
                  borderRadius: 100,
                  color: const Color(0xFFF70000),
                  child: const Text(
                    'Cancel Appointment',
                    style: TextStyle(
                        color: AppColors.lightPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ))
              
        ),
      ),
    );
  }
}