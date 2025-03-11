import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_colors.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';

import '../../../res/app_images.dart';
import '../../../widgets/button_view.dart';
import '../../../widgets/image_view.dart';
import 'upload_medical_sign_page.dart';

class UploadMedicalLicense extends StatelessWidget {
  const UploadMedicalLicense({super.key});

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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Divider(
              color: Colors.grey.shade300,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(14),
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x14020617),
                          offset: Offset(0, 0),
                          blurRadius: 0,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Color(0x0A020617),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: -2,
                        ),
                        BoxShadow(
                          color: Color(0x14020617),
                          offset: Offset(0, 6),
                          blurRadius: 6,
                          spreadRadius: -3,
                        ),
                        BoxShadow(
                          color: Color(0x05020617),
                          offset: Offset(0, 2),
                          blurRadius: 2,
                          spreadRadius: -1,
                        ),
                        BoxShadow(
                          color: Color(0x14020617),
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const ImageView.svg(AppImages.licenseIcon)),
                const SizedBox(
                  width: 20,
                ),
                const ImageView.svg(AppImages.andIcon),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    padding: const EdgeInsets.all(14),
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x14020617), // #02061714
                          offset: Offset(0, 0),
                          blurRadius: 0,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Color(0x0A020617), // #0206170A
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: -2,
                        ),
                        BoxShadow(
                          color: Color(0x14020617), // #02061714
                          offset: Offset(0, 6),
                          blurRadius: 6,
                          spreadRadius: -3,
                        ),
                        BoxShadow(
                          color: Color(0x05020617), // #02061705
                          offset: Offset(0, 2),
                          blurRadius: 2,
                          spreadRadius: -1,
                        ),
                        BoxShadow(
                          color: Color(0x14020617),
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const ImageView.svg(AppImages.signIcon)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  const ImageView.svg(
                    AppImages.check,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      'Ensures you are a certified medical professional and legally allowed to practice.',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.4,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  const ImageView.svg(
                    AppImages.check,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      'Helps the platform comply with regulatory bodies (e.g., medical boards, telemedicine laws)..',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.4,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  const ImageView.svg(
                    AppImages.check,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Text(
                      'The e-signature allows you to sign prescriptions, medical records, and reports digitally.',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.4,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ButtonView(
                  onPressed: () {
                    AppNavigator.pushAndStackPage(context, page: const UploadMedicalLicensePage());
                  },
                  borderRadius: 100,
                  color: AppColors.lightSecondary,
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        color: AppColors.lightPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
