
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/text_edit_view.dart';

class ConsultationFeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Consultation Fee',
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
                       
                        const Divider(
              color: Color(
                0xFF40B93C,
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
                                        'Rate',
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
                                    hintText: 'Enter rate in NGN',
                                     
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
                  'Save',
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
