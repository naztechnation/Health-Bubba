import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:healthbubba/utils/navigator/page_navigator.dart';

import '../../../res/app_colors.dart';
import '../../../res/app_images.dart';

import '../../../widgets/button_view.dart';
import '../../../widgets/image_view.dart';
import 'add_medical_license.dart';

class EditMedicalLicense extends StatelessWidget {
  const EditMedicalLicense({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
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
        margin: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
          'Work Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
            Divider(
              color: Colors.grey.shade300,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              padding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x12000000),
                      offset: Offset(0, 0),
                      blurRadius: 0,
                      spreadRadius: 1,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF7F7F7)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200,
                              ),
                              child: const ImageView.svg(
                                AppImages.file,
                                height: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text(
                              'MBCH',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Medical License MBCH.pdf',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              color: const Color(0xFF1D2939),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Valid till: ',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: const Color(0xFF1D2939),
                                  fontWeight: FontWeight.w300,
                                ),
                                children: [
                                  TextSpan(
                                    text: '8-09-2026',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 13),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFFFDE68A),
                                    width: 1),
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xFFFEF3C7),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFFF0F0F0),
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
                              child: Text(
                                'Under Review',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF92400E),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    )
                  ]),
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                AppNavigator.pushAndStackPage(context, page: AddMedicalLicense());
              },
              child: Container(
                margin: const EdgeInsets.only(right: 13),
                padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300, width: 0.5),
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFFFFFFF),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFF0F0F0),
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
                child: Text(
                  'Add another license',
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
            const SizedBox(
              height: 25,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: DottedBorder(
                radius: const Radius.circular(20),
                color: Colors.grey.shade400,
                strokeWidth: 1,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x12000000),
                          offset: Offset(0, 0),
                          blurRadius: 0,
                          spreadRadius: 1,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFF7F7F7)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Upload e-signature',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: DottedBorder(
                          color: Colors.grey,
                          strokeWidth: 1,
                          dashPattern: const [5, 5],
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xFFFFFFFF),
                              ),
                              child: Align(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: Container(
                                    height: 32,
                                    width: 32,
                                    margin: const EdgeInsets.only(left: 13),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade100,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: ImageView.svg(AppImages.file),
                                    ),
                                  ),
                                  title: Text(
                                    'E-signature.pdf',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 1.4,
                                      color: const Color(0xFF131316),
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Uploaded Nov 24. 2023',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      height: 1.4,
                                      color: const Color(0xFF131316),
                                    ),
                                  ), 
                                  trailing:  Container(
                              margin: const EdgeInsets.only(right: 13),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0x9F9F9F80),
                                    width: 1),
                                borderRadius: BorderRadius.circular(8),
                                color: const Color(0xfffffffff),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0xFFF0F0F0),
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
                              child: Text(
                                'Change',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color:   Colors.black,
                                ),
                              ),
                            ),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
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
                        child: SizedBox(
                          height: 50,
                          child: ButtonView(
                              onPressed: () {
                                
                                FocusScope.of(context).unfocus();
                              },
                              borderRadius: 100,
                              color: AppColors.lightSecondary,
                              child: const Text(
                                 'Update Changes',
                                style: TextStyle(
                                    color: AppColors.lightPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                      ),
                    ),
                  ),
    );
  }
}
