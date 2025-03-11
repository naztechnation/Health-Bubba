import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:healthbubba/res/app_colors.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';

import '../../../res/app_images.dart';
import '../../../widgets/button_view.dart';
import '../../../widgets/image_view.dart';
import 'add_medical_license.dart';

class UploadMedicalLicensePage extends StatelessWidget {
  const UploadMedicalLicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Upload Medical License and e-signature',
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
          children: [
            Divider(
              color: Colors.grey.shade300,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                AppNavigator.pushAndStackPage(context, 
                page: AddMedicalLicense());
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
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
                child: const Column(children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ImageView.svg(
                                AppImages.personIcon,
                                height: 25,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                'Add Medical License',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          ImageView.svg(AppImages.arrowBackIcon),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Please add your valid medical license to complete your profile',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF6B7280),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ]),
              ),
            ),
            const SizedBox(
              height: 20,
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
                        height: 8,
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
                                      child: ImageView.svg(AppImages.upload),
                                    ),
                                  ),
                                  title: Text(
                                    'Click to Upload',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 1.4,
                                      color: const Color(0xFF131316),
                                    ),
                                  ),
                                  trailing: Container(
                                    margin: const EdgeInsets.only(right: 13),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 0.5),
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
                                      'Upload',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        height: 1.4,
                                        color: const Color(0xFF131316),
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
    );
  }
}
