import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/app_images.dart';
import '../../../utils/navigator/page_navigator.dart';
import '../../../widgets/image_view.dart';
import 'widgets/cancelled.dart';
import 'widgets/completed_appointnment.dart';
import 'widgets/search_page.dart';
import 'widgets/upcoming_appointments.dart';

class AppointmentTabView extends StatefulWidget {
  const AppointmentTabView({super.key});

  @override
  State<AppointmentTabView> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<AppointmentTabView> {
  bool upComing = true;
  bool completed = false;
  bool cancelled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(
          ' ',
          style: GoogleFonts.getFont(
            'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
            color: const Color(0xFF0A0D14),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Appointments',
          style: GoogleFonts.getFont(
            'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            height: 1.5,
            color: const Color(0xFF0A0D14),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              AppNavigator.pushAndStackPage(context, page: SearchPage());
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 4.5, 20, 4.5),
              width: 22,
              height: 22,
              child: const SizedBox(
                width: 18,
                height: 18,
                child: ImageView.svg(
                  AppImages.searchIcon,
                  scale: 4,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFEFF1F5),
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        upComing = true;
                        cancelled = false;
                        completed = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: upComing
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: const Color(0xFFFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x0D000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            )
                          : null,
                      child: Text('Upcoming',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,

                              color: upComing ? Colors.black : Colors.grey)),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 1,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xFFA09CAB),
                        borderRadius: BorderRadius.circular(11)),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        upComing = false;
                        cancelled = false;
                        completed = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: completed
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: const Color(0xFFFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x0D000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            )
                          : null,
                      child: Text('Completed',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,

                              color: completed ? Colors.black : Colors.grey)),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 1,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                        color: const Color(0xFFA09CAB),
                        borderRadius: BorderRadius.circular(11)),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        upComing = false;
                        cancelled = true;
                        completed = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: cancelled
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: const Color(0xFFFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x0D000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            )
                          : null,
                      child: Text('Cancelled',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: cancelled ? Colors.black : Colors.grey)),
                    ),
                  ),
                ],
              ),
            ),
          ),
         Expanded(
           child: SingleChildScrollView(
             child: Column(children: [
               if (upComing)
                UpcomingPage()
              else if (completed)
                CompletedPage()
              else if (cancelled)
                CancelledPage()
             ],),
           ),
         )
        ],
      ),
    );
  }
}
