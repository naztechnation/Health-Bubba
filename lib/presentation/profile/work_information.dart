import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard.dart';
import 'package:healthbubba/presentation/profile/add_specialties.dart';
import 'package:healthbubba/presentation/profile/language_spoken.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:healthbubba/widgets/modals.dart';
import 'package:provider/provider.dart';

import '../../blocs/accounts/account.dart';
import '../../model/user/selected_languages.dart';
import '../../model/view_model/account_view_model.dart';
import '../../model/view_model/onboard_view_model.dart';
import '../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../res/app_colors.dart';
import '../../widgets/button_view.dart'; 
import 'complete_setup.dart';
import 'widget/work_bio_textfield.dart';
import 'working_hours.dart';


class WorkInformation extends StatelessWidget {
  const WorkInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (BuildContext context) => AccountCubit(
          accountRepository: AccountRepositoryImpl(),
          viewModel: Provider.of<AccountViewModel>(context, listen: false)),
      child: WorkInformationPage(),
    );
  }
}
class WorkInformationPage extends StatefulWidget {
  const WorkInformationPage({super.key});

  @override
  State<WorkInformationPage> createState() => _WorkInformationPageState();
}

class _WorkInformationPageState extends State<WorkInformationPage> {

  late AccountCubit _accountCubit;

  List<SelectedLanguagesData> languages = [];

  getLanguages() async {
    _accountCubit = context.read<AccountCubit>();

    _accountCubit.selectedLanguages();
    _accountCubit.selectedQualification();
    _accountCubit.selectedAvailability();
  }

  @override
  void initState() {
    getLanguages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final onboard = Provider.of<OnboardViewModel>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Work information',
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
      body: BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {
      if (state is SelectedLanguagesLoaded) {
        if (state.language.ok ?? false) {
          languages = state.language.message?.data ?? [];

          for(var lang in languages){
            onboard.addLanguage(lang.languageName  ?? '');
          }
          setState(() {});
        } else {}
      }  
    }, builder: (context, state) {
      if (state is AccountApiErr) {
        
      } else if (state is AccountNetworkErr) {
         
      }

      return   Container(
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
                          margin: const EdgeInsets.only(bottom: 58, left: 0),
                          width: MediaQuery.sizeOf(context).width,
                          child: const ImageView.asset(
                            AppImages.profileBg,
                            height: 94,
                          )),
                      if (onboard.imageURl == null) ...[
                        Positioned(
                          top: 43.5,
                          left: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap: () {
                              onboard.loadImage(context);
                            },
                            child: Container(
                              width: 91,
                              height: 91,
                              padding:
                                  const EdgeInsets.fromLTRB(6.5, 6.5, 7.5, 7.5),
                              margin: const EdgeInsets.fromLTRB(9, 0, 8.4, 8),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    padding: const EdgeInsets.fromLTRB(
                                        6.5, 6.5, 7.5, 7.5),
                                    margin:
                                        const EdgeInsets.fromLTRB(9, 0, 8.4, 0),
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
                                      child: ImageView.svg(AppImages.edit),
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
                              onboard.loadImage(context);
                            },
                            child: Align(
                              child: Stack(
                                children: [
                                  Container(
                                    width: 91,
                                    height: 91,
                                    margin:
                                        const EdgeInsets.fromLTRB(9, 0, 8.4, 8),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: ImageView.file(
                                          onboard.imageURl,
                                          fit: BoxFit.cover,
                                          width: 91,
                                          height: 91,
                                        )),
                                  ),
                                  Positioned(
                                    top: 35,
                                    right: -6,
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      padding: const EdgeInsets.fromLTRB(
                                          6.5, 6.5, 7.5, 7.5),
                                      margin:
                                          const EdgeInsets.fromLTRB(9, 0, 8.4, 0),
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
                                        child: ImageView.svg(AppImages.edit),
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
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ImageView.svg(AppImages.person),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: Text(
                                    (onboard.workBio == '')
                                        ? 'Add a Bio ( Summary of your professional background and experience).'
                                        : onboard.workBio,
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
                                        page: BioWidget(contex: context));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 18.0),
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
                                        child: ImageView.svg(AppImages.edit),
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
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Padding(
                                      padding: EdgeInsets.only(
                                          top: (onboard.schedule.isEmpty)
                                              ? 2
                                              : 20),
                                      child: const ImageView.svg(AppImages.clock),
                                    ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 8,
                                  child: (onboard.schedule.isEmpty)
                                            ? Text(
                                                'Working hours or availabiilty',
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
                                                builder: (context,
                                                    scheduleProvider, child) {
                                                  final schedule =
                                                      scheduleProvider.schedule;
                                                  return ListView.builder(
                                                    itemCount: schedule.length,
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemBuilder:
                                                        (context, index) {
                                                      final daySchedule =
                                                          schedule[index];
        
                                                      return ListTile(
                                                        title: Text(
                                                          daySchedule.day,
                                                          style: const TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Color(0xFF0A0D14),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        trailing: daySchedule
                                                                    .isOpen &&
                                                                daySchedule
                                                                    .timeSlots
                                                                    .isNotEmpty
                                                            ? Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children:
                                                                    daySchedule
                                                                        .timeSlots
                                                                        .map(
                                                                            (slot) {
                                                                  final start =
                                                                      slot[
                                                                          'start']!;
                                                                  final end =
                                                                      slot[
                                                                          'end']!;
                                                                  return Text(
                                                                    '${start.format(context)} - ${end.format(context)}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      color: Color(
                                                                          0xFF0A0D14),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                  );
                                                                }).toList(),
                                                              )
                                                            : const Text(
                                                                'Closed',
                                                                style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Color(
                                                                      0xFF6B7280),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
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
                              page: ScheduleWidget());
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
                                      child: ImageView.svg(AppImages.edit),
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
                          padding: const EdgeInsets.fromLTRB(16.2, 15, 16, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(0, 2.5, 12.2, 0),
                                child: const ImageView.svg(AppImages.language),
                              ),
                              Expanded(
                                child: (onboard.selectedLanguages.isEmpty)
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
                                        builder: (context, provider, child) {
                                          return Wrap(
                                            children: List<Widget>.generate(
                                              provider.selectedLanguages.length,
                                              (index) {
                                                final language = provider
                                                    .selectedLanguages[index];
                                                final isLast = index ==
                                                    provider.selectedLanguages
                                                            .length -
                                                        1;
                                                return Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Text(
                                                    '$language${isLast ? '' : ', '}',
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                      page: const LanguageSelector());
                                },
                                child:   Padding(
                                  padding:const EdgeInsets.only(right: 8.0),
                                  child:Container(
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
                                        child: ImageView.svg(AppImages.edit),
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
                          padding: const EdgeInsets.fromLTRB(16.2, 15, 16, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(0, 2.5, 12.2, 0),
                                child: const ImageView.svg(AppImages.specialties),
                              ),
                              Expanded(
                                child: (onboard.selectedSpecialties.isEmpty)
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
                                        builder: (context, provider, child) {
                                          return Wrap(
                                            children: List<Widget>.generate(
                                              provider.selectedSpecialties.length,
                                              (index) {
                                                final specialties = provider
                                                    .selectedSpecialties[index];
                                                final isLast = index ==
                                                    provider.selectedSpecialties
                                                            .length -
                                                        1;
                                                return Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Text(
                                                    '$specialties${isLast ? '' : ', '}',
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                      page: SpecialtyListPage());
                                },
                                child:  Padding(
                                  padding:const EdgeInsets.only(right: 8.0),
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
                                        child: ImageView.svg(AppImages.edit),
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
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        ButtonView(
                            onPressed: () {
                             AppNavigator.pushAndStackPage(context,
                              page: const CompleteSetUpScreen());
                              // AppNavigator.pushAndStackPage(context,
                              // page:     ErrorPage(statusCode: '503', onTap: () {  },));
        
                             
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
                            AppNavigator.pushAndReplacePage(context,
                                page: const Dashboard());
                          },
                          child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 42,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    100,
                                  ),
                                  color: AppColors.lightPrimary,
                                  border:
                                      Border.all(color: Colors.grey, width: 0.5)),
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
        );
   } ),
    );
  }
}
