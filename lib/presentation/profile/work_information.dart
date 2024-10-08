import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard.dart';
import 'package:healthbubba/presentation/profile/add_specialties.dart';
import 'package:healthbubba/presentation/profile/language_spoken.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/res/app_strings.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:healthbubba/widgets/modals.dart';
import 'package:provider/provider.dart';

import '../../blocs/accounts/account.dart';
import '../../model/user/selected_docs_availability.dart';
import '../../model/user/selected_languages.dart';
import '../../model/user/selected_qualifications.dart';
import '../../model/user/selected_user_specialties.dart';
import '../../model/view_model/account_view_model.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_colors.dart';
import '../../widgets/button_view.dart';
import '../../widgets/custom_toast.dart';
import '../../widgets/decision_widgets.dart';
import '../../widgets/loading_screen.dart';
import 'complete_setup.dart';
import 'widget/work_bio_textfield.dart';
import 'working_hours.dart';

class WorkInformation extends StatelessWidget {
  final bool isEdit;
  const WorkInformation({
    Key? key,
    required this.isEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (BuildContext context) => AccountCubit(
          accountRepository: AccountRepositoryImpl(),
          viewModel: Provider.of<AccountViewModel>(context, listen: false)),
      child: WorkInformationPage(isEdit: isEdit),
    );
  }
}

class WorkInformationPage extends StatefulWidget {
  final bool isEdit;

  const WorkInformationPage({super.key, required this.isEdit});

  @override
  State<WorkInformationPage> createState() => _WorkInformationPageState();
}

class _WorkInformationPageState extends State<WorkInformationPage> {
  late AccountCubit _accountCubit;

  String bioData = '';
  String imageUrl = '';

  List<SelectedLanguagesData> languages = [];
  List<SelectedUserSpecialtiesData> qualification = [];

  Map<String, List<Map<String, String>>> availabilities = {};

  List<int> isAvailable = [];

  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  getDoctorsDetails() async {
    _accountCubit = context.read<AccountCubit>();
    context.read<OnboardViewModel>().clearSpecialties();
    _accountCubit.selectedLanguages();
    _accountCubit.getSpecialties();
    _accountCubit.selectedQualification();
    _accountCubit.selectedAvailability();
    _accountCubit.userData();
  }

  @override
  void initState() {
    getDoctorsDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {
      if (state is SelectedLanguagesLoaded) {
        if (state.language.ok ?? false) {
          languages = state.language.message?.data ?? [];

          for (var lang in languages) {
            Provider.of<OnboardViewModel>(context, listen: false)
                .addLanguage(lang.languageName ?? '', lang.languageId ?? 0);
          }
        } else {}
      } else if (state is SelectedQualificationsLoaded) {
        if (state.qualificationsData.ok ?? false) {
          qualification = state.qualificationsData.message?.data ?? [];
          for (var qualification in qualification) {
            Provider.of<OnboardViewModel>(context, listen: false).addSpecialty(
              specialty: qualification.specialtyName ?? '',
              specialtiesId: qualification.specialtyId ?? 0,
            );
          }
        } else {}
      } else if (state is UpdateBioLoaded) {
        if (state.bio.ok ?? false) {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.success,
                height: 25,
              ),
              title: 'Success!!!',
              subtitle: state.bio.message ?? '');

          Provider.of<OnboardViewModel>(context, listen: false)
              .saveBio(bioData);
        } else {}
      } else if (state is UserDataLoaded) {
        if (state.userData.ok ?? false) {
          Provider.of<OnboardViewModel>(context, listen: false)
              .saveBio(state.userData.data?.first.bio ?? "");

          imageUrl = state.userData.data?.first.picture ?? "";
        } else {}
      } else if (state is UploadImageLoaded) {
        if (state.uploadImage.ok ?? false) {
          _accountCubit.userData();

          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.success,
                height: 25,
              ),
              title: 'Success!!!',
              subtitle: state.uploadImage.message ?? '');
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.error,
                height: 25,
              ),
              title: 'Error!!!',
              subtitle: state.uploadImage.error ?? '');
        }
      } else if (state is SelectedAvailabilitysLoaded) {
        if (state.availability.ok ?? false) {
          List<GetSelectedAvailabilityData> data =
              state.availability.data ?? [];

          for (var entry in data) {
            String day = entry.dayOfWeek ?? '';
            String startTime = entry.startTime ?? '';
            String endTime = entry.endTime ?? '';

            isAvailable.add(entry.availabilty ?? 0);

            if (!availabilities.containsKey(day)) {
              availabilities[day] = [];
            }
            availabilities[day]!
                .add({'start_time': startTime, 'end_time': endTime});

               
          }

//           for (int i = 0; i < isAvailable.length; i++) {
//   Modals.showToast('isAvailable[$i]: ${isAvailable[i]}', context);
// }

          
        } else {}
      } else if (state is AccountApiErr) {
      } else if (state is AccountNetworkErr) {}
    }, builder: (context, state) {
      return (state is UpdateBioLoading || state is UploadImageLoading)
          ? LoadersPage(
              length: MediaQuery.sizeOf(context).height.toInt(),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text(
                  'Work information',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                centerTitle: true,
                leading: GestureDetector(
                  onTap: () {
                    if (widget.isEdit) {
                      AppNavigator.pushAndStackPage(context,
                          page: const Dashboard());
                    } else {
                      Navigator.pop(context);
                    }
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
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17.0),
                          child: Text(
                            'Provide more details about you and the services you offer',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              height: 1.7,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                                height: 100,
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.only(bottom: 58, left: 0),
                                child: const ImageView.asset(
                                  AppImages.profileBg,
                                  height: 94,
                                  fit: BoxFit.cover,
                                )),
                            if (imageUrl == null ||
                                imageUrl == '' ||
                                imageUrl.isEmpty ||
                                imageUrl == 'null') ...[
                              Positioned(
                                top: 43.5,
                                left: 8,
                                right: 8,
                                child: GestureDetector(
                                  onTap: () {
                                    Provider.of<OnboardViewModel>(context,
                                            listen: false)
                                        .loadImage(context, () {
                                      _accountCubit.uploadImage(
                                          image: Provider.of<OnboardViewModel>(
                                                  context,
                                                  listen: false)
                                              .imageURl!);
                                    });
                                  },
                                  child: Container(
                                    width: 91,
                                    height: 91,
                                    padding: const EdgeInsets.fromLTRB(
                                        6.5, 6.5, 7.5, 7.5),
                                    margin:
                                        const EdgeInsets.fromLTRB(9, 0, 8.4, 8),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFFFFFFF),
                                      boxShadow: [
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
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 25,
                                          height: 25,
                                          padding: const EdgeInsets.fromLTRB(
                                              6.5, 6.5, 7.5, 7.5),
                                          margin: const EdgeInsets.fromLTRB(
                                              9, 0, 8.4, 0),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFFFFFFF),
                                            boxShadow: [
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
                                          child: const SizedBox(
                                            width: 9,
                                            height: 9,
                                            child:
                                                ImageView.svg(AppImages.edit),
                                          ),
                                        ),
                                        Text(
                                          'Upload',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            height: 1.7,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ] else ...[
                              Positioned(
                                top: 43.5,
                                left: 8,
                                right: 8,
                                child: GestureDetector(
                                  onTap: () {
                                    Provider.of<OnboardViewModel>(context,
                                            listen: false)
                                        .loadImage(context, () {
                                      _accountCubit.uploadImage(
                                          image: Provider.of<OnboardViewModel>(
                                                  context,
                                                  listen: false)
                                              .imageURl!);
                                    });
                                  },
                                  child: Align(
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 91,
                                          height: 91,
                                          margin: const EdgeInsets.fromLTRB(
                                              9, 0, 8.4, 8),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                          child: (imageUrl.isEmpty ||
                                                  imageUrl == '')
                                              ? const ImageView.asset(
                                                  AppImages.avatarIcon,
                                                  fit: BoxFit.cover)
                                              : ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: Image.network(
                                                    imageUrl,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return const ImageView
                                                          .asset(
                                                          AppImages.avatarIcon,
                                                          fit: BoxFit.cover);
                                                    },
                                                    loadingBuilder: (context,
                                                        child,
                                                        loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) return child;
                                                      return const ImageView
                                                          .asset(
                                                          AppImages.avatarIcon,
                                                          fit: BoxFit.cover);
                                                    },
                                                  ),
                                                ),
                                        ),
                                        Positioned(
                                          top: 35,
                                          right: -6,
                                          child: Container(
                                            width: 25,
                                            height: 25,
                                            padding: const EdgeInsets.fromLTRB(
                                                6.5, 6.5, 7.5, 7.5),
                                            margin: const EdgeInsets.fromLTRB(
                                                9, 0, 8.4, 0),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFFFFFFF),
                                              boxShadow: [
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
                                            child: const SizedBox(
                                              width: 9,
                                              height: 9,
                                              child:
                                                  ImageView.svg(AppImages.edit),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFFFFF),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const ImageView.svg(AppImages.person),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Text(
                                          (Provider.of<OnboardViewModel>(
                                                          context,
                                                          listen: false)
                                                      .workBio ==
                                                  '')
                                              ? 'Add a Bio ( Summary of your professional background and experience).'
                                              : Provider.of<OnboardViewModel>(
                                                      context,
                                                      listen: false)
                                                  .workBio,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 200,
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Modals.showBottomSheetModal(context,
                                              isDissmissible: true,
                                              heightFactor: 0.67,
                                              isScrollControlled: true,
                                              page: BioWidget(
                                                  contex: context,
                                                  bio: Provider.of<
                                                              OnboardViewModel>(
                                                          context,
                                                          listen: false)
                                                      .workBio,
                                                  onTap: (bio) {
                                                    setState(() {
                                                      bioData = bio;
                                                    });
                                                    _accountCubit.updateBio(
                                                        bio: bio);
                                                  }));
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Container(
                                            width: 31.5,
                                            height: 31.5,
                                            padding: const EdgeInsets.fromLTRB(
                                                6.5, 6.5, 7.5, 7.5),
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFFFFFFF),
                                              boxShadow: [
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
                                            child: const SizedBox(
                                              width: 7,
                                              height: 7,
                                              child:
                                                  ImageView.svg(AppImages.edit),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFFFFF),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: (Provider.of<OnboardViewModel>(
                                                        context,
                                                        listen: false)
                                                    .schedule
                                                    .isEmpty)
                                                ? 2
                                                : 20),
                                        child: const ImageView.svg(
                                            AppImages.clock),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          flex: 8,
                                          child: (availabilities.isEmpty)
                                              ? Text(
                                                  'Working hours or availabiilty',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    height: 1.4,
                                                    color:
                                                        const Color(0xFF6B7280),
                                                  ),
                                                )
                                              : Consumer<OnboardViewModel>(
                                                  builder: (context,
                                                      scheduleProvider, child) {
                                                    return ListView.builder(
                                                      itemCount:
                                                          daysOfWeek.length,
                                                      shrinkWrap: true,
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 0),
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (context, index) {
                                                        String day =
                                                            daysOfWeek[index];
                                                        List<
                                                                Map<String,
                                                                    String>>?
                                                            daySlots =
                                                            availabilities[day];

                                                        return ListTile(
                                                          title: Text(
                                                            day,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14,
                                                              color: Color(
                                                                  0xFF0A0D14),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          trailing:
                                                              daySlots != null
                                                                  ? Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          daySlots
                                                                              .map((slot) {
                                                                        return Expanded(
                                                                          child:
                                                                              Text(
                                                                            '${slot['start_time']} - ${slot['end_time']}',
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 13,
                                                                              color: Color(0xFF0A0D14),
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }).toList(),
                                                                    )
                                                                  :   Text(
                                                                   //  (isAvailable[1] == 1) ? 'Opened':
                                                                     'Closed',
                                                                      style:
                                                                        const  TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Color(
                                                                            0xFF6B7280),
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                    ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                )),
                                      GestureDetector(
                                        onTap: () {
                                          AppNavigator.pushAndStackPage(context,
                                              page: ScheduleWidget(
                                                  isEdit: widget.isEdit));
                                        },
                                        child: Container(
                                          width: 31.5,
                                          height: 31.5,
                                          padding: const EdgeInsets.fromLTRB(
                                              6.5, 6.5, 7.5, 7.5),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFFFFFFF),
                                            boxShadow: [
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
                                          child: const SizedBox(
                                            width: 7,
                                            height: 7,
                                            child:
                                                ImageView.svg(AppImages.edit),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(16.2, 15, 16, 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 2.5, 12.2, 0),
                                      child: const ImageView.svg(
                                          AppImages.language),
                                    ),
                                    Expanded(
                                      child: (Provider.of<OnboardViewModel>(
                                                  context,
                                                  listen: false)
                                              .selectedLanguages
                                              .isEmpty)
                                          ? Text(
                                              'Languages spoken',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF6B7280),
                                              ),
                                            )
                                          : Consumer<OnboardViewModel>(
                                              builder:
                                                  (context, provider, child) {
                                                return Wrap(
                                                  children:
                                                      List<Widget>.generate(
                                                    provider.selectedLanguages
                                                        .length,
                                                    (index) {
                                                      final language = provider
                                                              .selectedLanguages[
                                                          index];
                                                      final isLast = index ==
                                                          provider.selectedLanguages
                                                                  .length -
                                                              1;
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 8.0),
                                                        child: Text(
                                                          '${language.language}${isLast ? '' : ', '}',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        AppNavigator.pushAndStackPage(context,
                                            page: LanguageSelector(
                                                isEdit: widget.isEdit));
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Container(
                                          width: 31.5,
                                          height: 31.5,
                                          padding: const EdgeInsets.fromLTRB(
                                              6.5, 6.5, 7.5, 7.5),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFFFFFFF),
                                            boxShadow: [
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
                                          child: const SizedBox(
                                            width: 7,
                                            height: 7,
                                            child:
                                                ImageView.svg(AppImages.edit),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(16.2, 15, 16, 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 2.5, 12.2, 0),
                                      child: const ImageView.svg(
                                          AppImages.specialties),
                                    ),
                                    Expanded(
                                      child: (Provider.of<OnboardViewModel>(
                                                  context,
                                                  listen: false)
                                              .selectedSpecialties
                                              .isEmpty)
                                          ? Text(
                                              'Specialties or areas of focus',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                height: 1.4,
                                                color: const Color(0xFF6B7280),
                                              ),
                                            )
                                          : Consumer<OnboardViewModel>(
                                              builder:
                                                  (context, provider, child) {
                                                // Filter out any empty or null specialties
                                                final filteredSpecialties =
                                                    provider
                                                        .selectedSpecialties
                                                        .where((specialty) =>
                                                            specialty
                                                                .isNotEmpty)
                                                        .toList();

                                                return Wrap(
                                                  children:
                                                      List<Widget>.generate(
                                                    filteredSpecialties.length,
                                                    (index) {
                                                      final specialties =
                                                          filteredSpecialties[
                                                              index];
                                                      final isLast = index ==
                                                          filteredSpecialties
                                                                  .length -
                                                              1;
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 8.0),
                                                        child: Text(
                                                          '$specialties${isLast ? '' : ', '}',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        AppNavigator.pushAndStackPage(context,
                                            page: SpecialtyListPage(
                                                isEdit: widget.isEdit));
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Container(
                                          width: 31.5,
                                          height: 31.5,
                                          padding: const EdgeInsets.fromLTRB(
                                              6.5, 6.5, 7.5, 7.5),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFFFFFFF),
                                            boxShadow: [
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
                                          child: const SizedBox(
                                            width: 7,
                                            height: 7,
                                            child:
                                                ImageView.svg(AppImages.edit),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children: [
                              ButtonView(
                                  onPressed: () {
                                    Modals.showDialogModal(
                                      context,
                                      page: destructiveActions(
                                          context: context,
                                          message:
                                              'Are you sure you want to continue with this action?',
                                          primaryText: 'Continue',
                                          secondaryText: 'Cancel',
                                          primaryAction: () {
                                            if (widget.isEdit) {
                                              AppNavigator.pushAndStackPage(
                                                  context,
                                                  page: const Dashboard());
                                            } else {
                                              AppNavigator.pushAndStackPage(
                                                  context,
                                                  page:
                                                      const CompleteSetUpScreen());
                                            }
                                          },
                                          primaryBgColor:
                                              const Color(0xFF093126),
                                          secondaryBgColor:
                                              AppColors.lightPrimary,
                                          secondaryAction: () {
                                            Navigator.pop(context);
                                          }),
                                    );
                                  },
                                  borderRadius: 100,
                                  color: AppColors.lightSecondary,
                                  child: const Text(
                                    'Complete Profile',
                                    style: TextStyle(
                                        color: AppColors.lightPrimary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )),
                              const SizedBox(
                                height: 14,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Modals.showDialogModal(
                                    context,
                                    page: destructiveActions(
                                        context: context,
                                        message:
                                            'Are you sure you want to continue with this action?',
                                        primaryText: 'Continue',
                                        secondaryText: 'Cancel',
                                        primaryAction: () {
                                          AppNavigator.pushAndReplacePage(
                                              context,
                                              page: const Dashboard());
                                        },
                                        primaryBgColor: const Color(0xFF093126),
                                        secondaryBgColor:
                                            AppColors.lightPrimary,
                                        secondaryAction: () {
                                          Navigator.pop(context);
                                        }),
                                  );
                                },
                                child: Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 42,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                        color: AppColors.lightPrimary,
                                        border: Border.all(
                                            color: Colors.grey, width: 0.5)),
                                    child: const Center(
                                      child: Text(
                                        'Skip to dashboard',
                                        style: TextStyle(
                                            color: AppColors.lightSecondary,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ]),
                ),
              ));
    });
  }
}
