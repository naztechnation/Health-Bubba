import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/auth/sign_in.dart';
import 'package:healthbubba/presentation/profile/work_information.dart';
import 'package:healthbubba/presentation/settings/settings_pages/help_support.dart';
import 'package:healthbubba/presentation/settings/settings_pages/notification_settings.dart';
import 'package:healthbubba/presentation/settings/settings_pages/password_manager.dart';
import 'package:healthbubba/presentation/settings/settings_pages/privacy_policy.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';

import '../../handlers/secure_handler.dart';
import '../../widgets/decision_widgets.dart';
import '../../widgets/modals.dart';
import 'settings_pages/bank_account_update.dart';
import 'settings_pages/delete_account.dart';
import 'settings_pages/profile_details.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          margin: const EdgeInsets.only(bottom: 50),
                          decoration: const BoxDecoration(
                            // image: DecorationImage(
                            //   image: AssetImage(
                            //     AppImages.settingsBg,
                            //   ),
                            // ),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(16, 16, 16, 68),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 11),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 4.3, 0, 4.3),
                                        child: SizedBox(
                                          width: 0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 5, 0.3),
                                                child: SizedBox(
                                                  width: 15.3,
                                                  height: 11,
                                                  child: SvgPicture.asset(
                                                    'assets/vectors/Unknown',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 24.3,
                                                height: 11.3,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/Unknown',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 20.625,
                                        sigmaY: 20.625,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0x0D000000),
                                          borderRadius:
                                              BorderRadius.circular(16.5),
                                        ),
                                        child: SizedBox(
                                          width: 33,
                                          height: 33,
                                          child: Positioned(
                                            left: 14,
                                            bottom: 11,
                                            child: SizedBox(
                                              width: 4,
                                              height: 10,
                                              child: SizedBox(
                                                width: 4,
                                                height: 10,
                                                child: SvgPicture.asset(
                                                  'assets/vectors/Unknown',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 160,
                          top: 101,
                          child: Container(
                            width: 100,
                            height: 100,
                            padding: const EdgeInsets.fromLTRB(4, 4.5, 4, 3.5),
                            child: SizedBox(
                              width: 83,
                              height: 83,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(41.5),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      AppImages.onboardingTwo,
                                    ),
                                  ),
                                ),
                                child: const SizedBox(
                                  width: 83,
                                  height: 83,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 56,
                            left: 25,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 16,
                                  color: Colors.white,
                                )))
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 48),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              border: Border(
                                top: BorderSide(
                                  color: Color(0xFFE5E7EB),
                                  width: 1,
                                ),
                                bottom: BorderSide(
                                  color: Color(0xFFE5E7EB),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 15, 16, 15),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFE2E4E9)),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(3, 7, 3, 3),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              8, 0, 8, 10),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Personal',
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
                                        settingsDetails(
                                            title: 'Profile Details',
                                            icon: AppImages.profileDetails,
                                            onTap: () {
                                              AppNavigator.pushAndStackPage(
                                                  context,
                                                  page: PaymentDetails());
                                            }),
                                        settingsDetails(
                                            title: 'Work Information',
                                            icon: AppImages.workInfo,
                                            onTap: () {
                                              AppNavigator.pushAndStackPage(
                                                  context,
                                                  page:
                                                      const WorkInformation());
                                            }),
                                        settingsDetails(
                                            title: 'Payment Settings',
                                            icon: AppImages.paymentSettings,
                                            onTap: () {
                                              AppNavigator.pushAndStackPage(
                                                  context,
                                                  page: BankAccountUpdate());
                                            }),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                              padding:
                                  const EdgeInsets.fromLTRB(16, 16, 16, 15),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFE2E4E9)),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(3, 7, 3, 3),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              8, 0, 8, 10),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Notifications, Help & Security',
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
                                        settingsDetails(
                                            title: 'Notification Settings',
                                            icon:
                                                AppImages.notificationSettings,
                                            onTap: () {
                                              AppNavigator.pushAndStackPage(
                                                  context,
                                                  page:
                                                      const NotificationSettings());
                                            }),
                                        settingsDetails(
                                            title: 'Get Help. Contact Support',
                                            icon: AppImages.getHelp,
                                            onTap: () {
                                              AppNavigator.pushAndStackPage(
                                                  context,
                                                  page: HelpSupport());
                                            }),
                                        settingsDetails(
                                            title: 'Privacy Policy',
                                            icon: AppImages.privacyPolicy,
                                            onTap: () {
                                              AppNavigator.pushAndStackPage(
                                                  context,
                                                  page: PrivacyPolicy());
                                            }),
                                        settingsDetails(
                                            title: 'Password Manager',
                                            icon: AppImages.passwordManager,
                                            onTap: () {
                                              AppNavigator.pushAndStackPage(
                                                  context,
                                                  page: PasswordManagerPage());
                                            }),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                              padding:
                                  const EdgeInsets.fromLTRB(16, 16, 16, 15),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xFFE2E4E9)),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(3, 7, 3, 3),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              8, 0, 8, 10),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Sign Out or Deactivate',
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
                                        settingsDetails(
                                            title: 'Sign Out',
                                            icon: AppImages.signOut,
                                            onTap: () {
                                              Modals.showDialogModal(
                                                context,
                                                page: destructiveActions(
                                                    context: context,
                                                    message:
                                                        'Are you sure you want to logout your account.',
                                                    primaryText: 'Continue',
                                                    secondaryText: 'Cancel',
                                                    primaryAction: () async {
                                                      await StorageHandler
                                                          .clearCache();
                                                      StorageHandler
                                                          .saveOnboardState(
                                                              'true');

                                                      AppNavigator
                                                          .pushAndReplacePage(
                                                              context,
                                                              page:
                                                                  SignInScreen());
                                                    },
                                                    primaryBgColor:
                                                        const Color(0xFFF70000),
                                                    secondaryAction: () {
                                                      Navigator.pop(context);
                                                    }),
                                              );
                                            }),
                                        GestureDetector(
                                          onTap: () {
                                            AppNavigator.pushAndStackPage(
                                                context,
                                                page: DeleteAccount());
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
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
                                                  const EdgeInsets.fromLTRB(
                                                      13.7, 10, 22, 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        0, 1.7, 0, 1.7),
                                                    child: Row(
                                                      children: [
                                                        const SizedBox(
                                                          width: 16.7,
                                                          height: 16.7,
                                                          child: SizedBox(
                                                            width: 16.7,
                                                            height: 16.7,
                                                            child:
                                                                ImageView.svg(
                                                              AppImages.remove,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 7,
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                          child: Text(
                                                            'Delete Account',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              height: 1.4,
                                                              color: const Color(
                                                                  0xFFFF0000),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 5, 0, 5),
                                                    width: 4,
                                                    height: 10,
                                                    child: SizedBox(
                                                      width: 4,
                                                      height: 10,
                                                      child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: 16,
                                                        color: Colors
                                                            .grey.shade300,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xFFF6F8FA),
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFE5E7EB),
              width: 1,
            ),
          ),
        ),
        child: Center(
          child: Text(
            'v1.0.0',
            style: GoogleFonts.getFont(
              'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              height: 1.7,
              color: const Color(0xFF0A0D14),
            ),
          ),
        ),
      ),
    );
  }

  settingsDetails({
    required String title,
    required String icon,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
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
          padding: const EdgeInsets.fromLTRB(12, 10, 22, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: ImageView.svg(icon),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      title,
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
              Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                width: 4,
                height: 10,
                child: SizedBox(
                  width: 4,
                  height: 10,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey.shade300,
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
