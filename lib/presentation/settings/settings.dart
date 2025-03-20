import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/auth/sign_in.dart';
import 'package:healthbubba/presentation/profile/work_information.dart';
import 'package:healthbubba/presentation/settings/settings_pages/help_support.dart';
import 'package:healthbubba/presentation/settings/settings_pages/notification_settings.dart';
import 'package:healthbubba/presentation/settings/settings_pages/password_manager.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../handlers/secure_handler.dart';
import '../../model/view_model/user_view_model.dart';
import '../../res/app_colors.dart';
import '../../widgets/decision_widgets.dart';
import '../../widgets/modals.dart';

import '../dashboard/dashboard_pages.dart/new_profile_details.dart';
import '../dashboard/dashboard_pages.dart/unverified_screen.dart';
import '../profile/profile_setup.dart';
import 'settings_pages/delete_account.dart';
import 'settings_pages/profile_details.dart';

class SettingsPage extends StatefulWidget {
  final String profileUrl;

  const SettingsPage({super.key, required this.profileUrl});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final Uri _url = Uri.parse('https://healthbubba.com/privacy-policy');

  String doctorState = "0";

  getVerifiedKey() async {
    doctorState = await StorageHandler.getDoctorState() ?? '0';

    setState(() {
      
    });
  }

  @override
  void initState() {
    getVerifiedKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<UserViewModel>(context, listen: true);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 150,
                          decoration: const BoxDecoration(),
                          child: const ImageView.asset(
                            AppImages.settingsBg,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 65,
                        )
                      ],
                    ),
                    Positioned(
                      top: 100,
                      child: SizedBox(
                        width: 91,
                        height: 91,
                        child: Hero(
                          tag: 'profilePicture',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(45.5),
                            child: Image.network(
                              widget.profileUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const ImageView.asset(
                                    AppImages.avatarIcon,
                                    fit: BoxFit.cover);
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const ImageView.asset(
                                    AppImages.avatarIcon,
                                    fit: BoxFit.cover);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 50,
                      left: 25,
                      child: ImageView.svg(
                        AppImages.bg,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        top: 58,
                        left: 36,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                              color: Colors.white,
                            ))),
                if(doctorState == "0")    Positioned(
                      top: 200,
                      child: Container(
                        margin: const EdgeInsets.only(right: 13),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xFFFECDD3), width: 1),
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xFFFFE4E6),
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
                          'Verification Required',
                          style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1.4,
                            color: const Color(0xFF9F1239),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
               if(doctorState == "0")  const SizedBox(
                  height: 40,
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
                          padding: const EdgeInsets.fromLTRB(16, 15, 16, 15),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFE2E4E9)),
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
                                          AppNavigator.pushAndStackPage(context,
                                              page: const NewProfileDetails(

                                              ));
                                          //TODO
                                          // AppNavigator.pushAndStackPage(context,
                                          //     page: const ProfileSetup(
                                          //       isEdit: true,
                                          //     ));
                                        }),
                                    settingsDetails(
                                        title: 'Work Information',
                                        icon: AppImages.workInfo,
                                        onTap: () {
                                          AppNavigator.pushAndStackPage(context,
                                              page: const WorkInformation(
                                                  isEdit: true));
                                        }),
                                    settingsDetails(
                                        title: 'Fees and Payments',
                                        icon: AppImages.paymentSettings,
                                        onTap: () {
                                          if (doctorState == '0') {
                                            AppNavigator.pushAndStackPage(
                                              context,
                                              page: const PendingVerification(),
                                            );
                                          } else {
                                            AppNavigator.pushAndStackPage(
                                                context,
                                                page: PaymentDetails());
                                          }
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
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFE2E4E9)),
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
                                        icon: AppImages.notificationSettings,
                                        onTap: () {
                                          AppNavigator.pushAndStackPage(context,
                                              page:
                                                  const NotificationSettings());
                                        }),
                                    settingsDetails(
                                        title: 'Get Help. Contact Support',
                                        icon: AppImages.getHelp,
                                        onTap: () {
                                          AppNavigator.pushAndStackPage(context,
                                              page: HelpSupport());
                                        }),
                                    settingsDetails(
                                        title: 'Privacy Policy',
                                        icon: AppImages.privacyPolicy,
                                        onTap: () async {
                                          _launchUrl();
                                        }),
                                    settingsDetails(
                                        title: 'Password Manager',
                                        icon: AppImages.passwordManager,
                                        onTap: () {
                                          AppNavigator.pushAndStackPage(context,
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
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xFFE2E4E9)),
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
                                                    'Are you sure you want to logout?',
                                                primaryText: 'Yes, continue',
                                                secondaryText: 'No, go back',
                                                primaryAction: () async {
                                                  ZegoUIKitPrebuiltCallInvitationService()
                                                      .uninit();
                                                  await StorageHandler
                                                      .clearCache();

                                                  profile.clearAllField();
                                                  StorageHandler
                                                      .saveOnboardState('true');
                                                  StorageHandler.saveIsLoggedIn(
                                                      '');
                                                  StorageHandler.saveUserTitle(
                                                      '');
                                                  StorageHandler
                                                      .saveMedicalQualification(
                                                          '');
                                                  StorageHandler
                                                      .saveMedicalLicenceNumber(
                                                          '');
                                                  StorageHandler.saveAffliate(
                                                      '');
                                                  StorageHandler.savePhone('');
                                                  StorageHandler.saveLocation(
                                                      '');
                                                  StorageHandler.saveYear('');
                                                  StorageHandler
                                                      .saveDoctorState('0');
                                                  StorageHandler
                                                      .saveUserFirstName('');
                                                  StorageHandler.saveLastName(
                                                      '');
                                                  StorageHandler
                                                      .saveUserPicture('');
                                                  StorageHandler.saveUserId('');

                                                  AppNavigator
                                                      .pushAndRemovePreviousPages(
                                                          context,
                                                          page:
                                                              const SignInScreen(
                                                            isFromMainPage:
                                                                true,
                                                          ));
                                                },
                                                primaryBgColor:
                                                    const Color(0xFFF70000),
                                                secondaryBgColor:
                                                    AppColors.lightPrimary,
                                                secondaryAction: () {
                                                  Navigator.pop(context);
                                                }),
                                          );
                                        }),
                                    GestureDetector(
                                      onTap: () {
                                        AppNavigator.pushAndStackPage(context,
                                            page: const DeleteAccount());
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
                                          padding: const EdgeInsets.fromLTRB(
                                              13.7, 10, 22, 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 1.7, 0, 1.7),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 16.7,
                                                      height: 16.7,
                                                      child: SizedBox(
                                                        width: 16.7,
                                                        height: 16.7,
                                                        child: ImageView.svg(
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
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 5),
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
                margin: const EdgeInsets.fromLTRB(0, 2, 0, 5),
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

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
