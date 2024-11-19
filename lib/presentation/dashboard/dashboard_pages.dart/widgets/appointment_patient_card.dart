import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/call_invitation.dart';
import 'package:healthbubba/utils/app_utils.dart';

import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../../../handlers/secure_handler.dart';
import '../../../../model/patients/appointment_lists.dart';
import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../res/app_strings.dart';
import '../../../../utils/navigator/page_navigator.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/modals.dart';
import 'reschedule.dart';

class AppointmentPatientCard extends StatelessWidget {
  final bool isScheduled;
  final bool isReBook;
  final String actionText;
  final Function onAccept;
  final Function onCancel;

  final AppointmentListsData upcomingAppointment;
  AppointmentPatientCard({
    super.key,
    required this.isScheduled,
    required this.isReBook,
    required this.actionText,
    required this.onAccept,
    required this.onCancel,
    required this.upcomingAppointment,
  });

  num doctorsId = 0;

  String userId = '';
  String userName = '';

  getUserDetails() async {
    userId = await StorageHandler.getUserId();
    userName = await StorageHandler.getFirstName();
    doctorsId = int.parse(userId);
  }

  @override
  Widget build(BuildContext context) {
    getUserDetails();
    return GestureDetector(
      onTap: () {
        AppNavigator.pushAndStackPage(context,
            page: ReschedulePage(
              isSchedule: false,
              appointment: upcomingAppointment,
              isDue: true, isCompleted: false,
            ));
      },
      child: Stack(
        children: [
          Container(
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
                    padding: const EdgeInsets.fromLTRB(3, 7, 3, 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(8, 0, 8, 10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '${AppUtils.formatDateOnly(dateTime: upcomingAppointment.date ?? '')} - ${AppUtils.formatTimeOnly(dateTime: upcomingAppointment.time ?? '')}',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 1.4,
                                      color: const Color(0xFF0A0D14),
                                    ),
                                  ),
                                ),
                              ),
                              // (!AppUtils.isPastDateTime(
                              //         upcomingAppointment.date ?? ''))
                              //     ? const SizedBox.shrink()
                              //     :
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                width: 4,
                                height: 10,
                                child: SizedBox(
                                  width: 4,
                                  height: 5,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey.shade600,
                                    size: 17,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 12),
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 45,
                                        width: 45,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Image.network(
                                            fit: BoxFit.cover,
                                            upcomingAppointment
                                                    .patientPicture ??
                                                '',
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const ImageView.asset(
                                                  AppImages.avatarIcon);
                                            },
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return const ImageView.asset(
                                                  AppImages.avatarIcon);
                                            },
                                          ),
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
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              height: 1.7,
                                              color: const Color(0xFF6B7280),
                                            ),
                                          ),
                                          Text(
                                            upcomingAppointment
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
                                          SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.6,
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${AppUtils.getHumanReadableDate(upcomingAppointment.date ?? '')}, ${AppUtils.formatTimeOnly(dateTime: upcomingAppointment.time ?? '')}',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color:
                                                        const Color(0xFF6C7079),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    '  (${AppUtils.getTimeDifference(replaceTimeInDateTime(upcomingAppointment.date ?? '', upcomingAppointment.time ?? ''))})',
                                                    textAlign: TextAlign.end,
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      color: const Color(
                                                          0xFF6B7280),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                (AppUtils.isPastDateTime(
                                        upcomingAppointment.date ?? ''))
                                    ? const SizedBox.shrink()
                                    : Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 11),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFE5E7EB),
                                          ),
                                          child: const SizedBox(
                                            width: 326,
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                // (AppUtils.isPastDateTime(
                                //         upcomingAppointment.date ?? ''))
                                //     ? const SizedBox.shrink()
                                //     :
                                if (isReBook)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            if (AppUtils.isWithinFiveMinutes(
                                                upcomingAppointment.date ??
                                                    '')) {
                                            } else {
                                              onCancel();
                                            }
                                          },
                                          child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              height: 42,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    100,
                                                  ),
                                                  color: AppColors.lightPrimary,
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 0.5)),
                                              child: Center(
                                                child: Opacity(
                                                  opacity: (!AppUtils
                                                          .isWithinFiveMinutes(
                                                              upcomingAppointment
                                                                      .date ??
                                                                  ''))
                                                      ? 1
                                                      : 0.3,
                                                  child: const Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .lightSecondary,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Opacity(
                                          opacity:
                                              (!AppUtils.isWithinFiveMinutes(
                                                      upcomingAppointment
                                                              .date ??
                                                          ''))
                                                  ? 1
                                                  : 0.5,
                                          child: ButtonView(
                                              expanded: false,
                                              onPressed: () {
                                                if (AppUtils
                                                    .isWithinFiveMinutes(
                                                        upcomingAppointment
                                                                .date ??
                                                            '')) {
                                                } else {
                                                  onAccept();
                                                }
                                              },
                                              borderRadius: 100,
                                              color: AppColors.lightSecondary,
                                              child: Text(
                                                actionText,
                                                style: const TextStyle(
                                                    color:
                                                        AppColors.lightPrimary,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 33,
            right: 30,
            child: Opacity(
              opacity: (!isWithinFiveMinutes(replaceTimeInDateTime(
                      upcomingAppointment.date ?? '',
                      upcomingAppointment.time ?? '')))
                  ? 0.3
                  : 1,
              child: GestureDetector(
                onTap: () {
                  if ((!isWithinFiveMinutes(replaceTimeInDateTime(
                      upcomingAppointment.date ?? '',
                      upcomingAppointment.time ?? '')))) {
                    Modals.showToast(
                        "Appointments can  not be initiated at the moment",
                        context);
                  } else {
                    ZegoUIKitPrebuiltCallInvitationService().init(
                      appID: AppStrings.zigoAppIdUrl,
                      appSign: AppStrings.zegoAppSign,
                      userID: userId,
                      userName: userName,
                      plugins: [ZegoUIKitSignalingPlugin()],
                    );

                    AppNavigator.pushAndStackPage(context,
                        page: CallInviteScreen(
                          inviteeId: upcomingAppointment.patientId.toString(),
                          inviteeName:
                              upcomingAppointment.patientLastName.toString(),
                          appointmentId:
                              upcomingAppointment.appointmentId.toString(),
                        ));
                  }
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 29.2, 0, 0),
                  child: const SizedBox(
                    width: 40.1,
                    height: 40.8,
                    child: ImageView.svg(AppImages.videoIcon),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isWithinFiveMinutes(String dateTimeString) {
    try {
      DateTime inputTime = DateTime.parse(dateTimeString).toUtc();

      DateTime currentTime = DateTime.now().toUtc();

      int differenceInMinutes = currentTime.difference(inputTime).inMinutes;

      return differenceInMinutes.abs() <= 38;
    } catch (e) {
      return false;
    }
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
}
