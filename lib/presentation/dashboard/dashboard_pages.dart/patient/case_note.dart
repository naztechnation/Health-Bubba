import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/text_edit_view.dart';

class CaseNote extends StatelessWidget {
  const CaseNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Case Note',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
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
        actions: const [
          Text(
            '         ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Divider(
            color: Colors.grey.shade300,
          ),
          Column(
            children: [
              caseNotes(1, context),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF7F7F7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
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
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Reason for consultation/Symptoms',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Whatever they have described should show up here',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                           Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Medical History',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Whatever they have described should show up here',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ), Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Diagnosis',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Whatever they have described should show up here.Whatever they have described should show up here.Whatever they have described should show up hereWhatever they have described should show up hereWhatever they have described should show up here',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ), Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Treatment Plan',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Whatever they have described should show up here',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ), Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Follow-up Instructions',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Whatever they have described should show up here',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ), Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Doctor’s Signature',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15),
                            decoration: BoxDecoration(
                              color: Colors.white, // Background color
                              borderRadius: BorderRadius.circular(
                                  12), // Adjust for rounded corners
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x12000000), // #00000012
                                  offset: Offset(0, 0),
                                  blurRadius: 1,
                                  spreadRadius: 0,
                                ),
                                BoxShadow(
                                  color: Color(0x1C000000), // #0000001C
                                  offset: Offset(0, 0),
                                  blurRadius: 0,
                                  spreadRadius: 1, // Mimics a 1px border effect
                                ),
                                BoxShadow(
                                  color: Color(0x1F000000), // #0000001F
                                  offset: Offset(0, 3), // Moves shadow 3px down
                                  blurRadius: 6,
                                  spreadRadius: -2, // Creates soft elevation
                                ),
                              ],
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Signature.img'),
                                  Text('64kb'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )
        ],
      )),
      
    );
  }

  Widget caseNotes(int index, context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFE5E7EB),
              width: 1,
            ),
          ),
        ),
        child: Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFE2E4E9)),
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFFF6F8FA),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3DE4E5E7),
                      offset: Offset(0, 1),
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: SizedBox(
                    width: double.infinity,
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xFFFFFFFF),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x0A000000),
                                      offset: Offset(0, 1),
                                      blurRadius: 1.5,
                                    ),
                                    BoxShadow(
                                      color: Color(0x0D2F3037),
                                      offset: Offset(0, 24),
                                      blurRadius: 34,
                                    ),
                                    BoxShadow(
                                      color: Color(0x0A222A35),
                                      offset: Offset(0, 4),
                                      blurRadius: 3,
                                    ),
                                    BoxShadow(
                                      color: Color(0x0D000000),
                                      offset: Offset(0, 1),
                                      blurRadius: 0.5,
                                    ),
                                  ],
                                ),
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 12),
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 2.5, 0, 2.5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // if (AppUtils.isWithinFiveMinutes(
                                                    //     upcomingAppointment.time ?? "",
                                                    //     "${AppUtils.getHumanReadableDate(upcomingAppointment.date ?? '')}, ${AppUtils.formatTimeOnly(dateTime: upcomingAppointment.time ?? '')}",
                                                    //     context)) {
                                                    //   ZegoUIKitPrebuiltCallInvitationService().init(
                                                    //     appID: AppStrings.zigoAppIdUrl,
                                                    //     appSign: AppStrings.zegoAppSign,
                                                    //     userID: userId,
                                                    //     userName: userName,
                                                    //     plugins: [ZegoUIKitSignalingPlugin()],
                                                    //   );

                                                    // AppNavigator.pushAndStackPage(context,
                                                    //     page: CallInviteScreen(
                                                    //       inviteeId: upcomingAppointment.patientId.toString(),
                                                    //       inviteeName:
                                                    //           upcomingAppointment.patientLastName.toString(),
                                                    //       appointmentId:
                                                    //           upcomingAppointment.appointmentId.toString(),
                                                    //     ));
                                                    // } else {
                                                    //   Modals.showToast(
                                                    //       "Appointment cannot be initiated at the moment",
                                                    //       context);
                                                    // }
                                                  },
                                                  child: const SizedBox(
                                                    width: 40.1,
                                                    height: 40.8,
                                                    child: ImageView.svg(
                                                        AppImages.videoIcon),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Video Consultation',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                        height: 1.7,
                                                        color: const Color(
                                                            0xFF6B7280),
                                                      ),
                                                    ),
                                                    Text(
                                                      'Ayoola Feranmi',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color: const Color(
                                                            0xFF0A0D14),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.6,
                                                      child: const Row(
                                                        children: [
                                                          // Text(
                                                          //   '${AppUtils.getHumanReadableDate(upcomingAppointment.date ?? '')}, ${AppUtils.formatTimeOnly(dateTime: upcomingAppointment.time ?? '')}',
                                                          //   style: GoogleFonts.getFont(
                                                          //     'Inter',
                                                          //     fontWeight: FontWeight.w500,
                                                          //     fontSize: 12,
                                                          //     color:
                                                          //         const Color(0xFF6C7079),
                                                          //   ),
                                                          // ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          // Flexible(
                                                          //   child: Text(
                                                          //     '  (${AppUtils.getTimeDifference(replaceTimeInDateTime(upcomingAppointment.date ?? '', upcomingAppointment.time ?? ''))})',
                                                          //     textAlign: TextAlign.end,
                                                          //     style: GoogleFonts.getFont(
                                                          //       'Inter',
                                                          //       fontWeight:
                                                          //           FontWeight.w400,
                                                          //       fontSize: 12,
                                                          //       color: const Color(
                                                          //           0xFF6B7280),
                                                          //     ),
                                                          //   ),
                                                          // )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Feb 14th, 19:03',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  height: 1.7,
                                                  color:
                                                      const Color(0xFF6B7280),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]))))));
  }
}
