import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/model/patients/appointment_lists.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../../../call_invitation.dart';
import '../../../../res/app_strings.dart';
import '../../../../utils/app_utils.dart';
import '../upcoming_page.dart';
import 'reschedule.dart';

appointmentCard(List<AppointmentListsData> appointmentListsData, num doctorsId,
    BuildContext context, String username, String userId) {
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
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
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
        child: Container(
          padding: const EdgeInsets.fromLTRB(3, 7, 3, 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  AppNavigator.pushAndStackPage(context,
                      page: UpcomingAppointmentScreen(
                        upcomingAppointment: appointmentListsData,
                      ));
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upcoming Appointment',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 1.4,
                          color: const Color(0xFF0A0D14),
                        ),
                      ),
                      Text(
                        'View all (${appointmentListsData.length})',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.4,
                          color: const Color(0xFF0A0D14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                  itemCount: appointmentListsData.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                       onTap: () {
                          AppNavigator.pushAndStackPage(context,
                              page: ReschedulePage(
                                isSchedule: true,
                                appointment: appointmentListsData[index],
                                isDue: true,
                              ));
                        },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
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
                          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 210.1,
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                                  child: Row(
                                    children: [
                                      const ImageView.svg(AppImages.avatar),
                                      const SizedBox(
                                        width: 13,
                                      ),
                                      SizedBox(
                                        width: 139.1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Video Consultation',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                height: 1.7,
                                                color: const Color(0xFF6B7280),
                                              ),
                                            ),
                                            Text(
                                              appointmentListsData[index]
                                                      .patientFirstName ??
                                                  '',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF0A0D14),
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  height: 1.7,
                                                  color: const Color(0xFF6B7280),
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${AppUtils.getHumanReadableDate(appointmentListsData[index].date ?? '')}, ${AppUtils.formatTimeOnly(dateTime: appointmentListsData[index].time ?? '')}',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12,
                                                      height: 1.3,
                                                      color:
                                                          const Color(0xFF6C7079),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        '  (${AppUtils.getTimeDifference(replaceTimeInDateTime(appointmentListsData[index].date ?? '', appointmentListsData[index].time ?? ''))})',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.7,
                                                      color:
                                                          const Color(0xFF6B7280),
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
                              GestureDetector(
                                onTap: () {
                                  ZegoUIKitPrebuiltCallInvitationService().init(
                                    appID: AppStrings.zigoAppIdUrl,
                                    appSign: AppStrings.zegoAppSign,
                                    userID: userId,
                                    userName: username,
                                    plugins: [ZegoUIKitSignalingPlugin()],
                                  );
                        
                                  AppNavigator.pushAndStackPage(context,
                                      page: CallInviteScreen(
                                        inviteeId: appointmentListsData[index]
                                            .patientId
                                            .toString(),
                                        inviteeName: appointmentListsData[index]
                                            .patientLastName
                                            .toString(),
                                        appointmentId: appointmentListsData[index]
                                            .appointmentId
                                            .toString(),
                                      ));
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 29.2, 0, 0),
                                  child: const SizedBox(
                                    width: 40.1,
                                    height: 40.8,
                                    child: ImageView.svg(AppImages.videoIcon),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
            ],
          ),
        ),
      ),
    ),
  );
}

String replaceTimeInDateTime(String dateTimeString, String newTime) {
  if (!dateTimeString.contains('T') || !dateTimeString.endsWith('Z')) {
    return dateTimeString;
  }

  List<String> parts = dateTimeString.split('T');
  if (parts.length != 2) {}

  String datePart = parts[0];

  String newDateTimeString = '${datePart}T${newTime}Z';

  return newDateTimeString;
}
