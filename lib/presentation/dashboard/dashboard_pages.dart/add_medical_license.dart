import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/app_colors.dart';
import '../../../res/app_images.dart';
import '../../../utils/validator.dart';

import '../../../widgets/button_view.dart';
import '../../../widgets/image_view.dart';
import '../../../widgets/modals.dart';
import '../../../widgets/text_edit_view.dart';

class AddMedicalLicense extends StatelessWidget {
  AddMedicalLicense({super.key});

  var qualificationsController = TextEditingController();

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
            Container(
              margin: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Medical Qualification',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.4,
                      color: const Color(0xFF131316),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextEditView(
                    controller: qualificationsController,
                    borderColor: Colors.grey.shade200,
                    borderWidth: 0.5,
                    hintText: 'MBBS',
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey.shade700,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      return Validator.validate(value, 'Qualifications');
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade200),
                      color: const Color(0xFFF7F7F7),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x08000000),
                                offset: Offset(0, 0),
                                blurRadius: 0,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: Color(0x0F191C21),
                                offset: Offset(0, 1),
                                blurRadius: 2,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: Color(0x14000000),
                                offset: Offset(0, 0),
                                blurRadius: 2,
                                spreadRadius: 0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Upload Medical License',
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xFFFFFFFF),
                                      ),
                                      child: Align(
                                        child: ListTile(
                                          contentPadding:
                                              const EdgeInsets.all(0),
                                          leading: Container(
                                            height: 32,
                                            width: 32,
                                            margin:
                                                const EdgeInsets.only(left: 13),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.shade100,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: ImageView.svg(
                                                  AppImages.upload),
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
                                            margin: const EdgeInsets.only(
                                                right: 13),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 8),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade300,
                                                  width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                                              'Upload Doc',
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
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Expiry Date of Medical License',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: qualificationsController,
                                borderColor: Colors.grey.shade200,
                                borderWidth: 0.5,
                                hintText: 'Select',
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: ImageView.svg(
                                      AppImages.appointmentOutline),
                                ),
                                suffixIcon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.grey.shade700,
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  return Validator.validate(value, 'Rate');
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: const Radius.circular(20)),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            padding: const EdgeInsets.symmetric(
                                vertical: 14, horizontal: 20),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF7F7F7),
                            ),
                            child: Text(
                              'You will be required to re-upload & update your medical license when expired to keep using Healthbubba Platform',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                height: 1.6,
                                color: const Color(0xFFD97706),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ButtonView(
              onPressed: () {
                Modals.showBottomSheetModal(context,
                    heightFactor: 0.5,
                    isDissmissible: true,
                    isScrollControlled: true,
                    page: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
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
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ImageView.svg(AppImages.check, height: 10,),
                    )),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Successfully saved!',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 1.6,
                              color: const Color(0xFF131316),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Your submission is received and your verification is under review',
                            
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Inter',
                              
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.6,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ButtonView(
                              onPressed: () {},
                              borderRadius: 100,
                              color: AppColors.lightSecondary,
                              child: const Text(
                                'Okay',
                                style: TextStyle(
                                    color: AppColors.lightPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )),
                        ],
                      ),
                    ));
              },
              borderRadius: 100,
              color: AppColors.lightSecondary,
              child: const Text(
                'Save',
                style: TextStyle(
                    color: AppColors.lightPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )),
        ),
      ),
    );
  }
}
