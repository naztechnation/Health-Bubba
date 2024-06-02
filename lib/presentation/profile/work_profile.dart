import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:healthbubba/widgets/modals.dart';

import '../../res/app_colors.dart';
import '../../widgets/button_view.dart';

class WorkInformation extends StatelessWidget {
  const WorkInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 12, 15, 11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 7, 3, 35),
                        child: const SizedBox(
                          width: 15,
                          height: 15,
                          child: ImageView.svg(AppImages.backBtn),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 2.3, 8),
                              child: Text(
                                'Work information',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  height: 1.5,
                                  color: const Color(0xFF0A0D14),
                                ),
                              ),
                            ),
                            Text(
                              'Provide more details about you and the services you offer',
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
                Stack(
                  children: [
                    Material(
                      elevation: 3,
                      type: MaterialType.card,
                      child: Container(
                          height: 94,
                          margin: const EdgeInsets.only(bottom: 58),
                          width: MediaQuery.sizeOf(context).width,
                          child: const ImageView.asset(
                            AppImages.profileBg,
                            height: 94,
                          )),
                    ),
                    Positioned(
                      top: 43.5,
                      left: 8,
                      right: 8,
                      child: Container(
                        width: 91,
                        height: 91,
                        padding: const EdgeInsets.fromLTRB(6.5, 6.5, 7.5, 7.5),
                        margin: const EdgeInsets.fromLTRB(9, 0, 8.4, 8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              padding:
                                  const EdgeInsets.fromLTRB(6.5, 6.5, 7.5, 7.5),
                              margin: const EdgeInsets.fromLTRB(9, 0, 8.4, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11.5),
                                color: const Color(0xFFFFFFFF),
                              ),
                              child: const SizedBox(
                                width: 9,
                                height: 9,
                                child: ImageView.svg(AppImages.edit),
                              ),
                            ),
                            Text(
                              'Upload',
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
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const ImageView.svg(AppImages.person),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 8,
                                child: SizedBox(
                                  //width: 320,
                                  child: Text(
                                    'Add a Bio ( Summary of your professional background and experience).',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      height: 1.4,
                                      color: const Color(0xFF6B7280),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Modals.showBottomSheetModal(context, 
                                  // page: page)
                                },
                                child: const SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: ImageView.svg(AppImages.edit),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const ImageView.svg(AppImages.clock),
                              const SizedBox(
                                width: 2,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  'Working hours or availabiilty',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1.4,
                                    color: const Color(0xFF6B7280),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: ImageView.svg(AppImages.edit),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20.2, 15, 16, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 2.5, 12.2, 0),
                                    child:
                                        const ImageView.svg(AppImages.language),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: Text(
                                      'Languages spoken',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
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
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: ImageView.svg(AppImages.edit),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20.2, 15, 16, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 2.5, 12.2, 0),
                                    child: const ImageView.svg(
                                        AppImages.specialties),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: Text(
                                      'Specialties or areas of focus',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
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
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: ImageView.svg(AppImages.edit),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      ButtonView(
                          onPressed: () {},
                          borderRadius: 100,
                          color: AppColors.lightSecondary,
                          child: const Text(
                            'Complete Profile',
                            style: TextStyle(
                                color: AppColors.lightPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 14,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  100,
                                ),
                                color: AppColors.lightPrimary,
                                border:
                                    Border.all(color: Colors.grey, width: 0.5)),
                            child: const Center(
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    color: AppColors.lightSecondary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }


}
