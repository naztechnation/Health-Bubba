import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/handlers/secure_handler.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';

import '../../../res/app_images.dart';
import '../../../widgets/image_view.dart';
import 'live_chat.dart';

class HelpSupport extends StatefulWidget {
  @override
  State<HelpSupport> createState() => _HelpSupportState();
}

class _HelpSupportState extends State<HelpSupport> {

  String email = '';
  String username = '';

  getUserDetails()async{
    email = await StorageHandler.getUserEmail();
    username = await StorageHandler.getFirstName();
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Help & Support',
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
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: Color(
                  0xFF40B93C,
                ),
              ),
              ListTile(
                leading: const SizedBox(
                    width: 17.9,
                    height: 17.9,
                    child: ImageView.svg(AppImages.phone)),
                title: Text(
                  'Contact Support',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF0A0D14),
                  ),
                ),
                subtitle: Text(
                  'Chat with out team of experts',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF5E5F6E),
                  ),
                ),
                trailing: Container(
                  margin: const EdgeInsets.fromLTRB(0, 7, 10, 0),
                  width: 4,
                  height: 10,
                  child: SizedBox(
                    width: 4,
                    height: 10,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                onTap: () {
                  AppNavigator.pushAndStackPage(context, page: LiveChat(username: username, email: email,));
                },
              ),
              Divider(
                color: Colors.grey.shade300,
                height: 0,
              ),
              ListTile(
                leading: const SizedBox(
                    width: 17.9,
                    height: 17.9,
                    child: ImageView.svg(AppImages.getHelp)),
                title: Text(
                  'Help Center',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF0A0D14),
                  ),
                ),
                subtitle: Text(
                  'Fast answers to frequently asked questions',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF5E5F6E),
                  ),
                ),
                trailing: Container(
                  margin: const EdgeInsets.fromLTRB(0, 7, 10, 0),
                  width: 4,
                  height: 10,
                  child: SizedBox(
                    width: 4,
                    height: 10,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
                height: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
