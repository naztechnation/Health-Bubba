import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/handlers/secure_handler.dart';
import 'package:healthbubba/presentation/dashboard/notifications.dart';
import 'package:healthbubba/presentation/profile/work_information.dart';
import 'package:healthbubba/presentation/settings/settings.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../../blocs/users/users.dart';
import '../../../model/patients/appointment_lists.dart';
import '../../../model/patients/get_profile_status.dart';
import '../../../model/user/doctors_analytics.dart';
import '../../../model/view_model/onboard_view_model.dart';
import '../../../model/view_model/user_view_model.dart';
import '../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_strings.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/error_page.dart';
import '../../settings/settings_pages/consultaion_fee.dart';
import 'appointment_tabs.dart';
import 'medication/medication_page.dart';
import 'patient/patient_page.dart';
import 'unverified_screen.dart';
import 'widgets/analytics.dart';
import 'widgets/appointment_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
          userRepository: UserRepositoryImpl(),
          viewModel: Provider.of<UserViewModel>(context, listen: false)),
      child: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late UserCubit _userCubit;

  String imageUrl = "";
  String name = "";
  String lastName = "";
  String userId = "";
  String title = "";
  String doctorState = "0";

  String totalConsultation = '0';
  String totalPrescription = '0';
  String totalRevenue = '0';
  String patientDemography = '0/0';

  List<AppointmentListsData> upcomingAppointment = [];
  num doctorsId = 0;

  getUserData() async {
    _userCubit = context.read<UserCubit>();

    imageUrl = await StorageHandler.getUserPicture();
    name = await StorageHandler.getFirstName();
    lastName = await StorageHandler.getLastName();

    title = await StorageHandler.getUserTitle();
    userId = await StorageHandler.getUserId();
    userId = await StorageHandler.getUserId();
    doctorState = await StorageHandler.getDoctorState() ?? '0';
    await _userCubit.getProfileStatus();
    await _userCubit.doctorsAnalyticsAccount(days: '1');

    await _userCubit.userData();
    await _userCubit.getAppointmentList();
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  bool bioStatus = false;
  bool availabilityStatus = false;
  bool languageStatus = false;
  bool specialtiesStatus = false;
  bool consultationStatus = false;

  int _completedCount() {
    int count = 0;
    if (bioStatus) count++;
    if (availabilityStatus) count++;
    if (languageStatus) count++;
    if (specialtiesStatus) count++;
    if (consultationStatus) count++;
    return count;
  }

  @override
  Widget build(BuildContext context) {
    updateUserStatus(
        profileStatus:
            Provider.of<UserViewModel>(context, listen: true).status);
    updateAnalytics(
        analytics: Provider.of<UserViewModel>(context, listen: true).analytics);
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is UserDataLoaded) {
        if (state.userData.ok ?? false) {
          Provider.of<OnboardViewModel>(context, listen: false)
              .saveBio(state.userData.data?.first.bio ?? "");

          imageUrl = state.userData.data?.first.picture ?? "";
          name = state.userData.data?.first.firstName ?? '';
          title = state.userData.data?.first.title ?? '';

          doctorState = state.userData.data?.first.isDoctorVerified.toString() ?? '0';

          StorageHandler.saveUserTitle(state.userData.data?.first.title ?? '');
          StorageHandler.saveDoctorState(
              state.userData.data?.first.isDoctorVerified.toString() ?? '0');
          StorageHandler.saveUserFirstName(
              state.userData.data?.first.firstName ?? '');
          StorageHandler.saveUserPicture(
              "${AppStrings.imageBaseUrl}${state.userData.data?.first.picture ?? ''}");
          StorageHandler.saveUserId(
              state.userData.data?.first.id.toString() ?? '');
          ZegoUIKitPrebuiltCallInvitationService().init(
            appID: AppStrings.zigoAppIdUrl,
            appSign: AppStrings.zegoAppSign,
            userID: state.userData.data?.first.id.toString() ?? '',
            userName: state.userData.data?.first.lastName ?? '',
            plugins: [ZegoUIKitSignalingPlugin()],
          );
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.error,
                height: 25,
              ),
              title: 'Error!!!',
              subtitle: state.userData.message ?? '');
        }
      } else if (state is AppointmentListLoaded) {
        if (state.appointmentLists.ok ?? false) {
          upcomingAppointment =
              _userCubit.viewModel.appointmentsWithinOneHour.reversed.toList();
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.error,
                height: 25,
              ),
              title: 'Error!!!',
              subtitle: state.appointmentLists.message?.message ?? '');
        }
      } else if (state is AnalyticsLoaded) {
      } else if (state is ProfileStatusLoaded) {
      } else if (state is CheckConsultaionStatusLoaded) {
        if (state.fee.ok ?? false) {
          setState(() {
            consultationStatus = true;
          });
        } else {
          setState(() {
            consultationStatus = false;
          });
        }
      } else if (state is CheckSpecialtyStatusLoaded) {
        if (state.specialty.ok ?? false) {
          setState(() {
            specialtiesStatus = true;
          });
        } else {
          setState(() {
            specialtiesStatus = false;
          });
        }
      } else if (state is CheckLanguageStatusLoaded) {
        if (state.language.ok ?? false) {
          setState(() {
            languageStatus = true;
          });
        } else {
          setState(() {
            languageStatus = false;
          });
        }
      } else if (state is UserApiErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(
              AppImages.error,
              height: 25,
            ),
            title: 'Error!!!',
            subtitle: "Network Error");
      } else if (state is UserNetworkErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(
              AppImages.error,
              height: 25,
            ),
            title: 'Error!!!',
            subtitle: "Network Error");
      }
    }, builder: (context, state) {
      if (state is UserApiErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () async {
              await _userCubit.getProfileStatus();
              await _userCubit.doctorsAnalyticsAccount(days: '1');

              await _userCubit.userData();
              await _userCubit.getAppointmentList();
            });
      } else if (state is UserNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () async {
              await _userCubit.getProfileStatus();
              await _userCubit.doctorsAnalyticsAccount(days: '1');

              await _userCubit.userData();
              await _userCubit.getAppointmentList();
            });
      }
      return Scaffold(
        body: RefreshIndicator(
          onRefresh: _refreshPage,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        SafeArea(
                          child: Container(
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
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 8),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            child: Text(
                                              (name != null && name.isNotEmpty)
                                                  ? 'Hi, $title $name'
                                                  : 'Hi',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                height: 1.3,
                                                color: const Color(0xFF0A0D14),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (doctorState == '0') ...[
                                        GestureDetector(
                                          onTap: () {
                                            // AppNavigator.pushAndReplacePage(context, page: const PendingVerification());
                                          },
                                          child: Container(
                                            height: 30,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 4),
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFFDCFB6),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text('Pending Verification',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFFE86620),
                                                )),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ] else ...[
                                        if (_completedCount() == 5) ...[
                                          Text('What do you want to do today?',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF6B7280),
                                              )),
                                          const SizedBox(
                                            height: 8,
                                          )
                                        ] else ...[
                                          Text(
                                            'Finish setting up your account',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF6B7280),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          )
                                        ]
                                      ],
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 0, 0, 14.3),
                                    child: SizedBox(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              AppNavigator.pushAndStackPage(
                                                  context,
                                                  page: const Notifications());
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 16, 1.7),
                                              width: 32,
                                              height: 32,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xFFE5E7EB)),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color:
                                                      const Color(0xFFFFFFFF),
                                                ),
                                                child: Container(
                                                  width: 32,
                                                  height: 32,
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          3, 3, 3, 3),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFF1F3F5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Container(
                                                      width: 24,
                                                      height: 24,
                                                      padding: const EdgeInsets
                                                          .fromLTRB(2, 2, 2, 2),
                                                      child: const SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child: ImageView.svg(
                                                            AppImages
                                                                .notifyIcon),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                AppNavigator.pushAndStackPage(
                                                    context,
                                                    page: SettingsPage(
                                                      profileUrl: imageUrl,
                                                    ));
                                              },
                                              child: SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: Hero(
                                                      tag: 'profilePicture',
                                                      child: Image.network(
                                                        imageUrl,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                            error, stackTrace) {
                                                          return const ImageView
                                                              .asset(
                                                              AppImages
                                                                  .avatarIcon,
                                                              fit:
                                                                  BoxFit.cover);
                                                        },
                                                        loadingBuilder: (context,
                                                            child,
                                                            loadingProgress) {
                                                          if (loadingProgress ==
                                                              null)
                                                            return child;
                                                          return const ImageView
                                                              .asset(
                                                              AppImages
                                                                  .avatarIcon,
                                                              fit:
                                                                  BoxFit.cover);
                                                        },
                                                      ),
                                                    )),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  if (_completedCount() ==
                                                      5) ...[
                                                    const SizedBox.shrink()
                                                  ] else ...[
                                                    const SizedBox(
                                                      height: 14,
                                                    ),
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(
                                                          10, 0, 0, 8),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: const Color(
                                                                    0xFFE5E7EB)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100),
                                                            color: const Color(
                                                                0xFFFFFFFF),
                                                          ),
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .fromLTRB(
                                                                    7.4,
                                                                    0,
                                                                    7.4,
                                                                    0),
                                                            child: Text(
                                                              '${_completedCount()}/5 completed',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                                height: 1.7,
                                                                color: const Color(
                                                                    0xFF4B5563),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 6,
                                                    ),
                                                  ],
                                                  if (_completedCount() ==
                                                      5) ...[
                                                    const SizedBox.shrink()
                                                  ] else ...[
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(
                                                          10, 0, 10, 8),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xFFE2E4E9)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                        color: const Color(
                                                            0xFFF6F8FA),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color: Color(
                                                                0x3DE4E5E7),
                                                            offset:
                                                                Offset(0, 1),
                                                            blurRadius: 1,
                                                          ),
                                                        ],
                                                      ),
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  3, 3, 3, 3),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  AppNavigator
                                                                      .pushAndStackPage(
                                                                          context,
                                                                          page:
                                                                              const WorkInformation(
                                                                            isEdit:
                                                                                true,
                                                                          ));
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    color: const Color(
                                                                        0xFFFFFFFF),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A000000),
                                                                        offset: Offset(
                                                                            0,
                                                                            1),
                                                                        blurRadius:
                                                                            1.5,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0D2F3037),
                                                                        offset: Offset(
                                                                            0,
                                                                            24),
                                                                        blurRadius:
                                                                            34,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A222A35),
                                                                        offset: Offset(
                                                                            0,
                                                                            4),
                                                                        blurRadius:
                                                                            3,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0D000000),
                                                                        offset: Offset(
                                                                            0,
                                                                            1),
                                                                        blurRadius:
                                                                            0.5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .fromLTRB(
                                                                            12,
                                                                            10,
                                                                            22,
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              margin: const EdgeInsets.fromLTRB(0, 0, 8.3, 0),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(99),
                                                                                color: const Color(0xFFFFFFFF),
                                                                                boxShadow: const [
                                                                                  BoxShadow(
                                                                                    color: Color(0x14123769),
                                                                                    offset: Offset(0, 2),
                                                                                    blurRadius: 2,
                                                                                  ),
                                                                                  BoxShadow(
                                                                                    color: Color(0x0A123769),
                                                                                    offset: Offset(0, 1),
                                                                                    blurRadius: 0.5,
                                                                                  ),
                                                                                  BoxShadow(
                                                                                    color: Color(0x14123769),
                                                                                    offset: Offset(0, 0),
                                                                                    blurRadius: 0,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              child: Container(
                                                                                width: 20,
                                                                                height: 20,
                                                                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                                                                child: SizedBox(
                                                                                  width: 10,
                                                                                  height: 10,
                                                                                  child: ImageView.svg(
                                                                                    AppImages.check,
                                                                                    color: (bioStatus) ? Colors.green : Colors.grey.shade300,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: const EdgeInsets.fromLTRB(0, 1.5, 0, 1.5),
                                                                              child: Text(
                                                                                'Add a Bio to your profile',
                                                                                style: GoogleFonts.getFont(
                                                                                  'Inter',
                                                                                  fontWeight: FontWeight.w400,
                                                                                  fontSize: 14,
                                                                                  decoration: (bioStatus) ? TextDecoration.lineThrough : TextDecoration.none,
                                                                                  color: const Color(0xFF15141D),
                                                                                  decorationColor: const Color(0xFF15141D),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          margin: const EdgeInsets
                                                                              .fromLTRB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              5),
                                                                          width:
                                                                              4,
                                                                          height:
                                                                              10,
                                                                          child:
                                                                              const Icon(
                                                                            Icons.arrow_forward_ios,
                                                                            size:
                                                                                16,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  AppNavigator.pushAndStackPage(
                                                                      context,
                                                                      page: const WorkInformation(
                                                                          isEdit:
                                                                              true));
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    color: const Color(
                                                                        0xFFFFFFFF),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A000000),
                                                                        offset: Offset(
                                                                            0,
                                                                            1),
                                                                        blurRadius:
                                                                            1.5,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0D2F3037),
                                                                        offset: Offset(
                                                                            0,
                                                                            24),
                                                                        blurRadius:
                                                                            34,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A222A35),
                                                                        offset: Offset(
                                                                            0,
                                                                            4),
                                                                        blurRadius:
                                                                            3,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0D000000),
                                                                        offset: Offset(
                                                                            0,
                                                                            1),
                                                                        blurRadius:
                                                                            0.5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .fromLTRB(
                                                                            12,
                                                                            10,
                                                                            22,
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              margin: const EdgeInsets.fromLTRB(0, 0, 4.4, 0),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(99),
                                                                                color: const Color(0xFFFFFFFF),
                                                                                boxShadow: const [
                                                                                  BoxShadow(
                                                                                    color: Color(0x14123769),
                                                                                    offset: Offset(0, 2),
                                                                                    blurRadius: 2,
                                                                                  ),
                                                                                  BoxShadow(
                                                                                    color: Color(0x0A123769),
                                                                                    offset: Offset(0, 1),
                                                                                    blurRadius: 0.5,
                                                                                  ),
                                                                                  BoxShadow(
                                                                                    color: Color(0x14123769),
                                                                                    offset: Offset(0, 0),
                                                                                    blurRadius: 0,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              child: Container(
                                                                                width: 20,
                                                                                height: 20,
                                                                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                                                                child: SizedBox(
                                                                                  width: 10,
                                                                                  height: 10,
                                                                                  child: ImageView.svg(
                                                                                    AppImages.check,
                                                                                    color: (availabilityStatus) ? Colors.green : Colors.grey.shade300,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: const EdgeInsets.fromLTRB(0, 1.5, 0, 1.5),
                                                                              child: Text(
                                                                                'Configure availability',
                                                                                style: GoogleFonts.getFont(
                                                                                  'Inter',
                                                                                  fontWeight: FontWeight.w400,
                                                                                  fontSize: 14,
                                                                                  decoration: (availabilityStatus) ? TextDecoration.lineThrough : TextDecoration.none,
                                                                                  color: const Color(0xFF15141D),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          margin: const EdgeInsets
                                                                              .fromLTRB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              5),
                                                                          width:
                                                                              4,
                                                                          height:
                                                                              10,
                                                                          child:
                                                                              const SizedBox(
                                                                            width:
                                                                                4,
                                                                            height:
                                                                                10,
                                                                            child:
                                                                                Icon(
                                                                              Icons.arrow_forward_ios,
                                                                              size: 16,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  AppNavigator.pushAndStackPage(
                                                                      context,
                                                                      page: const WorkInformation(
                                                                          isEdit:
                                                                              true));
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    color: const Color(
                                                                        0xFFFFFFFF),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A000000),
                                                                        offset: Offset(
                                                                            0,
                                                                            1),
                                                                        blurRadius:
                                                                            1.5,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0D2F3037),
                                                                        offset: Offset(
                                                                            0,
                                                                            24),
                                                                        blurRadius:
                                                                            34,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A222A35),
                                                                        offset: Offset(
                                                                            0,
                                                                            4),
                                                                        blurRadius:
                                                                            3,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0D000000),
                                                                        offset: Offset(
                                                                            0,
                                                                            1),
                                                                        blurRadius:
                                                                            0.5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .fromLTRB(
                                                                            12,
                                                                            10,
                                                                            22,
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              margin: const EdgeInsets.fromLTRB(0, 0, 8.5, 0),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(99),
                                                                                color: const Color(0xFFFFFFFF),
                                                                                boxShadow: const [
                                                                                  BoxShadow(
                                                                                    color: Color(0x14123769),
                                                                                    offset: Offset(0, 2),
                                                                                    blurRadius: 2,
                                                                                  ),
                                                                                  BoxShadow(
                                                                                    color: Color(0x0A123769),
                                                                                    offset: Offset(0, 1),
                                                                                    blurRadius: 0.5,
                                                                                  ),
                                                                                  BoxShadow(
                                                                                    color: Color(0x14123769),
                                                                                    offset: Offset(0, 0),
                                                                                    blurRadius: 0,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              child: Container(
                                                                                width: 20,
                                                                                height: 20,
                                                                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                                                                child: SizedBox(
                                                                                  width: 10,
                                                                                  height: 10,
                                                                                  child: ImageView.svg(
                                                                                    AppImages.check,
                                                                                    color: (languageStatus) ? Colors.green : Colors.grey.shade300,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: const EdgeInsets.fromLTRB(0, 1.5, 0, 1.5),
                                                                              width: MediaQuery.sizeOf(context).width * 0.7,
                                                                              child: Text(
                                                                                'Specify Languages for communication',
                                                                                overflow: TextOverflow.ellipsis,
                                                                                maxLines: 1,
                                                                                style: GoogleFonts.getFont(
                                                                                  'Inter',
                                                                                  fontWeight: FontWeight.w400,
                                                                                  decoration: (languageStatus) ? TextDecoration.lineThrough : TextDecoration.none,
                                                                                  fontSize: 14,
                                                                                  color: const Color(0xFF15141D),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          margin: const EdgeInsets
                                                                              .fromLTRB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              5),
                                                                          width:
                                                                              4,
                                                                          height:
                                                                              10,
                                                                          child:
                                                                              const SizedBox(
                                                                            width:
                                                                                4,
                                                                            height:
                                                                                10,
                                                                            child:
                                                                                Icon(
                                                                              Icons.arrow_forward_ios,
                                                                              size: 16,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  AppNavigator.pushAndStackPage(
                                                                      context,
                                                                      page: const WorkInformation(
                                                                          isEdit:
                                                                              true));
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      8),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    color: const Color(
                                                                        0xFFFFFFFF),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A000000),
                                                                        offset: Offset(
                                                                            0,
                                                                            1),
                                                                        blurRadius:
                                                                            1.5,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0D2F3037),
                                                                        offset: Offset(
                                                                            0,
                                                                            24),
                                                                        blurRadius:
                                                                            34,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A222A35),
                                                                        offset: Offset(
                                                                            0,
                                                                            4),
                                                                        blurRadius:
                                                                            3,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0D000000),
                                                                        offset: Offset(
                                                                            0,
                                                                            1),
                                                                        blurRadius:
                                                                            0.5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .fromLTRB(
                                                                            12,
                                                                            10,
                                                                            22,
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              margin: const EdgeInsets.fromLTRB(0, 0, 8.2, 0),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(99),
                                                                                color: const Color(0xFFFFFFFF),
                                                                                boxShadow: const [
                                                                                  BoxShadow(
                                                                                    color: Color(0x14123769),
                                                                                    offset: Offset(0, 2),
                                                                                    blurRadius: 2,
                                                                                  ),
                                                                                  BoxShadow(
                                                                                    color: Color(0x0A123769),
                                                                                    offset: Offset(0, 1),
                                                                                    blurRadius: 0.5,
                                                                                  ),
                                                                                  BoxShadow(
                                                                                    color: Color(0x14123769),
                                                                                    offset: Offset(0, 0),
                                                                                    blurRadius: 0,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              child: Container(
                                                                                width: 20,
                                                                                height: 20,
                                                                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                                                                child: SizedBox(
                                                                                  width: 10,
                                                                                  height: 10,
                                                                                  child: ImageView.svg(
                                                                                    AppImages.check,
                                                                                    color: (specialtiesStatus) ? Colors.green : Colors.grey.shade300,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: const EdgeInsets.fromLTRB(0, 1.5, 0, 1.5),
                                                                              child: Text(
                                                                                'Add Specialties or area of focus',
                                                                                style: GoogleFonts.getFont(
                                                                                  'Inter',
                                                                                  fontWeight: FontWeight.w400,
                                                                                  decoration: (specialtiesStatus) ? TextDecoration.lineThrough : TextDecoration.none,
                                                                                  fontSize: 14,
                                                                                  color: const Color(0xFF15141D),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          margin: const EdgeInsets
                                                                              .fromLTRB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              5),
                                                                          width:
                                                                              4,
                                                                          height:
                                                                              10,
                                                                          child:
                                                                              const SizedBox(
                                                                            width:
                                                                                4,
                                                                            height:
                                                                                10,
                                                                            child:
                                                                                Icon(
                                                                              Icons.arrow_forward_ios,
                                                                              size: 16,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  AppNavigator
                                                                      .pushAndStackPage(
                                                                          context,
                                                                          page:
                                                                              const ConsultationFeePage());
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12),
                                                                    color: const Color(
                                                                        0xFFFFFFFF),
                                                                    boxShadow: const [
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A000000),
                                                                        offset: Offset(
                                                                            0,
                                                                            1),
                                                                        blurRadius:
                                                                            1.5,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0D2F3037),
                                                                        offset: Offset(
                                                                            0,
                                                                            24),
                                                                        blurRadius:
                                                                            34,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0A222A35),
                                                                        offset: Offset(
                                                                            0,
                                                                            4),
                                                                        blurRadius:
                                                                            3,
                                                                      ),
                                                                      BoxShadow(
                                                                        color: Color(
                                                                            0x0D000000),
                                                                        offset: Offset(
                                                                            0,
                                                                            1),
                                                                        blurRadius:
                                                                            0.5,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .fromLTRB(
                                                                            12,
                                                                            10,
                                                                            22,
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Container(
                                                                              margin: const EdgeInsets.fromLTRB(0, 0, 8.4, 0),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(99),
                                                                                color: const Color(0xFFFFFFFF),
                                                                                boxShadow: const [
                                                                                  BoxShadow(
                                                                                    color: Color(0x14123769),
                                                                                    offset: Offset(0, 2),
                                                                                    blurRadius: 2,
                                                                                  ),
                                                                                  BoxShadow(
                                                                                    color: Color(0x0A123769),
                                                                                    offset: Offset(0, 1),
                                                                                    blurRadius: 0.5,
                                                                                  ),
                                                                                  BoxShadow(
                                                                                    color: Color(0x14123769),
                                                                                    offset: Offset(0, 0),
                                                                                    blurRadius: 0,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              child: Container(
                                                                                width: 20,
                                                                                height: 20,
                                                                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                                                                child: SizedBox(
                                                                                  width: 10,
                                                                                  height: 10,
                                                                                  child: ImageView.svg(
                                                                                    AppImages.check,
                                                                                    color: (consultationStatus) ? Colors.green : Colors.grey.shade300,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              margin: const EdgeInsets.fromLTRB(0, 1.5, 0, 1.5),
                                                                              child: Text(
                                                                                'Set consultation fee ',
                                                                                style: GoogleFonts.getFont(
                                                                                  'Inter',
                                                                                  fontWeight: FontWeight.w400,
                                                                                  fontSize: 14,
                                                                                  decoration: (consultationStatus) ? TextDecoration.lineThrough : TextDecoration.none,
                                                                                  color: const Color(0xFF15141D),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Container(
                                                                          margin: const EdgeInsets
                                                                              .fromLTRB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              5),
                                                                          width:
                                                                              4,
                                                                          height:
                                                                              10,
                                                                          child:
                                                                              const SizedBox(
                                                                            width:
                                                                                4,
                                                                            height:
                                                                                10,
                                                                            child:
                                                                                Icon(
                                                                              Icons.arrow_forward_ios,
                                                                              size: 16,
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
                                                  ],
                                                ]),
                                          ),
                                        ],
                                      ),
                                      if (_completedCount() == 5) ...[
                                        const SizedBox.shrink()
                                      ] else ...[
                                        const SizedBox(
                                          height: 10,
                                        )
                                      ],
                                      if (upcomingAppointment.isNotEmpty) ...[
                                        const SizedBox(
                                          height: 14,
                                        ),
                                        appointmentCard(
                                            upcomingAppointment,
                                            doctorsId,
                                            context,
                                            lastName,
                                            userId),
                                      ],
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              if (doctorState == '0') {
                                                AppNavigator.pushAndStackPage(
                                                    context,
                                                    page:
                                                        const PendingVerification());
                                              } else {
                                                AppNavigator.pushAndStackPage(
                                                    context,
                                                    page: AppointmentTabView(
                                                      isDashboard: false,
                                                    ));
                                              }
                                            },
                                            child: Container(
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
                                                    const EdgeInsets.fromLTRB(
                                                        16, 12, 26, 11),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 1, 0, 1),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: 45,
                                                            height: 46,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border: Border.all(
                                                                    color: const Color(
                                                                        0xffE5E7EB),
                                                                    width: 1)),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              child:
                                                                  const ImageView
                                                                      .asset(
                                                                AppImages
                                                                    .scheduleAppointment,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 12,
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    Alignment
                                                                        .topLeft,
                                                                child: Text(
                                                                  'Schedule Appointment',
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        14,
                                                                    height: 1.4,
                                                                    color: const Color(
                                                                        0xFF0A0D14),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 20,
                                                                child: Text(
                                                                  'Book appointment on behalf of a patient',
                                                                  style: GoogleFonts
                                                                      .getFont(
                                                                    'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12,
                                                                    height: 1.7,
                                                                    color: const Color(
                                                                        0xFF6B7280),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(
                                                          0, 7, 0, 31),
                                                      width: 4,
                                                      height: 10,
                                                      child: const SizedBox(
                                                        width: 4,
                                                        height: 10,
                                                        child: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (doctorState == '0') {
                                                AppNavigator.pushAndStackPage(
                                                    context,
                                                    page:
                                                        const PendingVerification());
                                              } else {
                                                AppNavigator.pushAndStackPage(
                                                    context,
                                                    page: const MedicationPage(
                                                        false));
                                              }
                                            },
                                            child: Container(
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
                                                    const EdgeInsets.fromLTRB(
                                                        16, 12, 26, 11),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(0, 1, 0, 1),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 45,
                                                            height: 46,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border: Border.all(
                                                                    color: const Color(
                                                                        0xffE5E7EB),
                                                                    width: 1)),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              child:
                                                                  const ImageView
                                                                      .asset(
                                                                AppImages
                                                                    .createPrescriptionn,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 12,
                                                          ),
                                                          SizedBox(
                                                            height: 48,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  child:
                                                                      SizedBox(
                                                                    height: 20,
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          20,
                                                                      child:
                                                                          Text(
                                                                        'Create a New Prescription',
                                                                        style: GoogleFonts
                                                                            .getFont(
                                                                          'Inter',
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              14,
                                                                          height:
                                                                              1.4,
                                                                          color:
                                                                              const Color(0xFF0A0D14),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 20,
                                                                  child: Text(
                                                                    'Manage and provide patient prescriptions',
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          12,
                                                                      height:
                                                                          1.7,
                                                                      color: const Color(
                                                                          0xFF6B7280),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(
                                                          0, 7, 0, 31),
                                                      width: 4,
                                                      height: 10,
                                                      child: const SizedBox(
                                                        width: 4,
                                                        height: 10,
                                                        child: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (doctorState == '0') {
                                                AppNavigator.pushAndStackPage(
                                                    context,
                                                    page:
                                                        const PendingVerification());
                                              } else {
                                                AppNavigator.pushAndStackPage(
                                                    context,
                                                    page: const PatientPage(
                                                      isDashboard: false,
                                                    ));
                                              }
                                            },
                                            child: Container(
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
                                                    const EdgeInsets.fromLTRB(
                                                        16, 0, 26, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(
                                                          0, 0, 44.6, 0),
                                                      child: SizedBox(
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 11, 0, 11),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: 45,
                                                                height: 46,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(0),
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    border: Border.all(
                                                                        color: const Color(
                                                                            0xffE5E7EB),
                                                                        width:
                                                                            1)),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                  child:
                                                                      const ImageView
                                                                          .asset(
                                                                    AppImages
                                                                        .viewPatient,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 12,
                                                              ),
                                                              SizedBox(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.6,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child:
                                                                          Text(
                                                                        'View Patient Profiles',
                                                                        style: GoogleFonts
                                                                            .getFont(
                                                                          'Inter',
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              14,
                                                                          height:
                                                                              1.4,
                                                                          color:
                                                                              const Color(0xFF0A0D14),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Access comprehensive patient profiles for streamlined virtual consultations.',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Inter',
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        fontSize:
                                                                            12,
                                                                        height:
                                                                            1.7,
                                                                        color: const Color(
                                                                            0xFF6B7280),
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
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(
                                                          0, 7, 0, 51),
                                                      width: 4,
                                                      height: 10,
                                                      child: const SizedBox(
                                                        width: 4,
                                                        height: 10,
                                                        child: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          size: 16,
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
                                    ],
                                  ),
                                ),
                                if (totalConsultation == '0' &&
                                    totalPrescription == '0' &&
                                    totalRevenue == '0' &&
                                    patientDemography == '0/0') ...[
                                  const EmptyAnalytics(),
                                ] else ...[
                                  AnalyticsData(
                                    totalConsultation: totalConsultation,
                                    totalPrescription: totalPrescription,
                                    totalRevenue: totalRevenue,
                                    patientDemography: patientDemography,
                                    onTap: (String value) async {
                                      // await _userCubit.viewModel
                                      //     .clearAnalytics();
                                      await _userCubit.doctorsAnalyticsAccount(
                                          days: value);
                                    },
                                  )
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (((_userCubit.viewModel.analytics == null)
                      ? state is AnalyticsLoading
                      : false) ||
                  ((_userCubit.viewModel.status == null)
                      ? state is ProfileStatusLoading
                      : false))
                Container(
                  color: AppColors.indicatorBgColor,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.indicatorColor,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }

  updateUserStatus({required GetProfileStatus? profileStatus}) {
    if (profileStatus?.ok ?? false) {
      if (profileStatus?.data?.availability ?? false) {
        availabilityStatus = true;
      } else {
        availabilityStatus = false;
      }
      if (profileStatus?.data?.language ?? false) {
        languageStatus = true;
      } else {
        languageStatus = false;
      }
      if (profileStatus?.data?.specialty ?? false) {
        specialtiesStatus = true;
      } else {
        specialtiesStatus = false;
      }
      if (profileStatus?.data?.bio ?? false) {
        bioStatus = true;
      } else {
        bioStatus = false;
      }
      if (profileStatus?.data?.consultationFee ?? false) {
        consultationStatus = true;
      } else {
        consultationStatus = false;
      }
    } else {
      availabilityStatus = false;
      consultationStatus = false;
      specialtiesStatus = false;
      languageStatus = false;
      bioStatus = false;
    }
  }

  updateAnalytics({required DoctorsAnalytics? analytics}) {
    if (analytics?.ok ?? false) {
      totalConsultation = analytics?.data?.consultations.toString() ?? '0';
      totalPrescription = analytics?.data?.prescriptions.toString() ?? '0';
      totalRevenue = analytics?.data?.revenue.toString() ?? '0';
      patientDemography =
          "${analytics?.data?.male.toString()}/${analytics?.data?.female.toString()}" ??
              '0/0';
    }
  }

  Future<void> _refreshPage() async {
    // await _userCubit.viewModel.clearProfileStatus();
    // await _userCubit.viewModel.clearAnalytics();
    await _userCubit.getProfileStatus();
    await _userCubit.doctorsAnalyticsAccount(days: '1');

    await _userCubit.userData();
    await _userCubit.getAppointmentList();
  }
}
