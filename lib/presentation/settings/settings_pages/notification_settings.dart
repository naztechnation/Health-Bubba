
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/app_images.dart';
import '../../../widgets/image_view.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {

  bool upcomingAlert = true;
  bool medicationReminder = false;
  bool orderAlert = false;
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
          title: const Text(
            'Notification Settings',
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
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border(
                    bottom: BorderSide (
                      color: Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 15, 6, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upcoming Appointment Alert',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 1.4,
                          color: const Color(0xFF0A0D14),
                        ),
                      ),
                      Transform.scale(
                              transformHitTests: false,
                              scale: .7,
                              child: CupertinoSwitch(
                                value: upcomingAlert,
                                onChanged: (bool value) {
                                  setState(() {
                                    upcomingAlert = value;
                                     
                                  });
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border(
                    bottom: BorderSide (
                      color: Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 15, 6, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Medications Reminder',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 1.4,
                          color: const Color(0xFF0A0D14),
                        ),
                      ),
                      Transform.scale(
                              transformHitTests: false,
                              scale: .7,
                              child: CupertinoSwitch(
                                value: medicationReminder,
                                onChanged: (bool value) {
                                  setState(() {
                                    medicationReminder = value;
                                     
                                  });
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border(
                    bottom: BorderSide (
                      color: Color(0xFFE5E7EB),
                      width: 1,
                    ),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 15, 6, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order/Delivery Alert',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 1.4,
                          color: const Color(0xFF0A0D14),
                        ),
                      ),
                      Transform.scale(
                              transformHitTests: false,
                              scale: .7,
                              child: CupertinoSwitch(
                                value: orderAlert,
                                onChanged: (bool value) {
                                  setState(() {
                                    orderAlert = value;
                                     
                                  });
                                },
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
    );
  }
}