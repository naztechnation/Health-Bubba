import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/app_images.dart';
import '../../../widgets/image_view.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
          title: const Text(
            'Privacy policy',
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
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: SingleChildScrollView(
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
                  margin: const EdgeInsets.fromLTRB(16, 0, 37.8, 0),
                  child: Text(
                    'Lorem ipsum dolor sit amet consectetur. Cras amet commodo habitant nec purus sed. Scelerisque scelerisque sed massa vitae placerat tristique. Scelerisque vestibulum nisi sociis sed tellus porttitor aliquam. Morbi augue sapien phasellus justo.Lorem ipsum dolor sit amet consectetur. Cras amet commodo habitant nec purus sed. Scelerisque scelerisque sed massa vitae placerat tristique. Scelerisque vestibulum nisi sociis sed tellus porttitor aliquam. Morbi augue sapien phasellus justo.Lorem ipsum dolor sit amet consectetur. Cras amet commodo habitant nec purus sed. Scelerisque scelerisque sed massa vitae placerat tristique. Scelerisque vestibulum nisi sociis sed tellus porttitor Scelerisque vestibulum nisi sociis sed tellus porttitor Lorem ipsum dolor sit amet consectetur. Cras amet commodo habitant nec purus sed. Scelerisque scelerisque sed massa vitae placerat tristique. Scelerisque vestibulum nisi sociis sed tellus porttitor aliquam. Morbi augue sapien phasellus justo.Lorem ipsum dolor sit amet consectetur. Cras amet commodo habitant nec purus sed. Scelerisque scelerisque sed massa vitae placerat tristique. Scelerisque vestibulum nisi sociis sed tellus porttitor aliquam. Morbi augue sapien phasellus justo.Lorem ipsum dolor sit amet consectetur. Cras amet commodo habitant nec purus sed. Scelerisque scelerisque sed massa vitae placerat tristique. Scelerisque vestibulum nisi sociis sed tellus porttitor Scelerisque vestibulum nisi sociis sed tellus porttitor Lorem ipsum dolor sit amet consectetur. Cras amet commodo habitant nec purus sed. Scelerisque ',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      height: 1.8,
                      color: const Color(0xFF6B7280),
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