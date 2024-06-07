import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/checkbox.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/text_edit_view.dart';
import '../widgets/select_patient.dart';

class CreateNewMedication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create New Medication',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 23),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                                  'Medication name',
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
                            Divider(
                              color: Colors.grey.shade300,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 0),
                              child: TextEditView(
                                controller: TextEditingController(),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: ImageView.svg(
                                    AppImages.searchIcon,
                                    height: 12,
                                  ),
                                ),
                                hintText: 'Search Medications',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Divider(
                              color: Colors.grey.shade300,
                              height: 0,
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                                  'Medication For',
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
                            TextEditView(
                              controller: TextEditingController(),
                              borderColor: Colors.grey.shade200,
                              borderWidth: 0.5,
                              hintText: 'Select Patient',
                              readOnly: true,
                              onTap: () {
                                AppNavigator.pushAndStackPage(context,
                                    page: SelectPatient());
                              },
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(17.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                            ),
                                        const SizedBox(height: 12,),

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
                                padding:
                                    const EdgeInsets.fromLTRB(12, 4, 14, 4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: const SizedBox(
                                            width: 42.1,
                                            height: 43,
                                            child: ImageView.asset(
                                              AppImages.onboardingThree,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12,),
                                        Text(
                                          'Akeem Adewale',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color:
                                                const Color(0xFF0A0D14),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 12, 0, 0),
                                      width: 20,
                                      height: 20,
                                      child: const SizedBox(
                                        width: 20,
                                        height: 20,
                                       child: ImageView.svg(
                                              AppImages.remove,
                                               
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
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Category',
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
                                  TextEditView(
                                    controller: TextEditingController(),
                                    borderColor: Colors.grey.shade200,
                                    borderWidth: 0.5,
                                    hintText: 'Select',
                                    suffixIcon: const Padding(
                                      padding: EdgeInsets.all(17.0),
                                      child: ImageView.svg(
                                        AppImages.dropDown,
                                        scale: 0.8,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Route of Administration',
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
                                  TextEditView(
                                    controller: TextEditingController(),
                                    borderColor: Colors.grey.shade200,
                                    borderWidth: 0.5,
                                    hintText: 'Select',
                                    suffixIcon: const Padding(
                                      padding: EdgeInsets.all(17.0),
                                      child: ImageView.svg(
                                        AppImages.dropDown,
                                        scale: 0.8,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Dosage',
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
                                  TextEditView(
                                    controller: TextEditingController(),
                                    borderColor: Colors.grey.shade200,
                                    borderWidth: 0.5,
                                    hintText: 'e.g, 1 Tablet',
                                    suffixIcon: const Padding(
                                      padding: EdgeInsets.all(17.0),
                                      child: ImageView.svg(
                                        AppImages.dropDown,
                                        scale: 0.8,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 7, 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                    child: Align(
                                      alignment: Alignment.topLeft,
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
                                                'Frequency',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF131316),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 10, 0),
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
                                                          8, 4, 7.4, 4),
                                                  child: Text(
                                                    'Everyday',
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
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9999),
                                                  color:
                                                      const Color(0xFF2F3037),
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
                                                          8, 4, 8.5, 4),
                                                  child: Text(
                                                    'Specific days',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFFFFFFFF),
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
                                      ],
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          17.7, 16, 0, 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                1.3, 0, 1.3, 16),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomCheckbox(),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    'Monday',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 16),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomCheckbox(),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    'Tuesday',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 16),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomCheckbox(),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    'Wednesday',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 16),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomCheckbox(),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    'Thursday',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                1.3, 0, 1.3, 16),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomCheckbox(),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    'Friday',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                1.3, 0, 1.3, 16),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomCheckbox(),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    'Saturday',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                1.3, 0, 1.3, 0),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomCheckbox(),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  Text(
                                                    'Sunday',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
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
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: Align(
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
                                        child: Text(
                                          'Time of the day',
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
                                    Row(
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
                                                8, 4, 8.2, 4),
                                            child: Text(
                                              'Morning',
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
                                                8, 4, 7.7, 4),
                                            child: Text(
                                              'Noon',
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
                                              'Evening',
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
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 4, 8.8, 4),
                                            child: Text(
                                              'Night',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFFFFFFFF),
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
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: Align(
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
                                        child: Text(
                                          'To be Taken',
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 10, 0),
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
                                                8, 4, 7.8, 4),
                                            child: Text(
                                              'After Food ',
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
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 4, 8, 4),
                                            child: Text(
                                              'Before Food',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFFFFFFFF),
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Duration',
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
                                TextEditView(
                                  controller: TextEditingController(),
                                  borderColor: Colors.grey.shade200,
                                  borderWidth: 0.5,
                                  hintText: 'July 5-July 8',
                                  suffixIcon: const Padding(
                                    padding: EdgeInsets.all(17.0),
                                    child: ImageView.svg(
                                      AppImages.dropDown,
                                      scale: 0.8,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                                  'Add Notes for Patient (Optional)',
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
                            TextEditView(
                              controller: TextEditingController(),
                              borderColor: Colors.grey.shade200,
                              borderWidth: 0.5,
                              hintText: '',
                              maxLines: 4,
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
                  // AppNavigator.pushAndStackPage(context,
                  //     page: const BookAppointentPage(
                  //       isReBookAppointment: false,
                  //     ));
                },
                borderRadius: 100,
                color: AppColors.lightSecondary,
                child: const Text(
                  'Create New Medication',
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
