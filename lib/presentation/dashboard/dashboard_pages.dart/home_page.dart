import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/handlers/secure_handler.dart';
import 'package:healthbubba/presentation/settings/settings.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:provider/provider.dart';

import '../../../blocs/accounts/account.dart';
import '../../../model/view_model/account_view_model.dart';
import '../../../model/view_model/onboard_view_model.dart';
import '../../../requests/repositories/account_repo/account_repository_impl.dart';
import '../../../res/app_strings.dart';
import '../../../widgets/choice_widget.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/loading_screen.dart';
import 'widgets/appointment_card.dart';


class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
      create: (BuildContext context) => AccountCubit(
          accountRepository: AccountRepositoryImpl(),
          viewModel: Provider.of<AccountViewModel>(context, listen: false)),
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
  late AccountCubit _accountCubit;

  String imageUrl = "";
  String name = "";
  String title = "";

  getUserData() async {
    _accountCubit = context.read<AccountCubit>();

_accountCubit.userData();
    imageUrl = await StorageHandler.getUserPicture();
    name = await StorageHandler.getFirstName();
    title = await StorageHandler.getUserTitle();

   
    
  }

   @override
  void initState() {
    getUserData();
    super.initState();
  }

  String _selectedDay = "1 Day";

  void _handleDaySelected(String selectedDay) {
    setState(() {
      _selectedDay = selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit, AccountStates>(
        listener: (context, state) {
        if (state is UserDataLoaded) {
        if (state.userData.ok ?? false) {
          Provider.of<OnboardViewModel>(context, listen: false)
              .saveBio(state.userData.data?.bio ?? "");

          imageUrl = "${AppStrings.imageBaseUrl}${state.userData.data?.picture ?? ""}";
          name = state.userData.data?.firstName ?? '';
          setState(() {
            
          });
 
                      //  StorageHandler.saveUserTitle(state.userData.data?. ?? '');
                       StorageHandler.saveUserFirstName(state.userData.data?.firstName ?? '');
                       StorageHandler.saveUserPicture("${AppStrings.imageBaseUrl}${state.userData.data?.picture ?? ''}");
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.error),
              title: 'Error!!!',
              subtitle: state.userData.message ?? '');
        }
      }     else if (state is AccountApiErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(AppImages.error),
            title: 'Error!!!',
            subtitle: "Network Error");
      } else if (state is AccountNetworkErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(AppImages.error),
            title: 'Error!!!',
            subtitle: "Network Error");
      }
    }, builder: (context, state) {
      return 
      // (state is UpdateBioLoading || state is UploadImageLoading)
      //     ? LoadersPage(
      //         length: MediaQuery.sizeOf(context).height.toInt(),
      //       )
      //     :
           Scaffold(
        body: Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                   (name != null  || name != '') ?  'Hi, $title $name' : 'Hi',
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
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 14.3),
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 16, 1.7),
                                      width: 32,
                                      height: 32,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFFE5E7EB)),
                                          borderRadius: BorderRadius.circular(8),
                                          color: const Color(0xFFFFFFFF),
                                        ),
                                        child: Container(
                                          width: 32,
                                          height: 32,
                                          padding: const EdgeInsets.fromLTRB(
                                              3, 3, 3, 3),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF1F3F5),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Container(
                                              width: 24,
                                              height: 24,
                                              padding: const EdgeInsets.fromLTRB(
                                                  2, 2, 2, 2),
                                              child: const SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: ImageView.svg(
                                                    AppImages.notifyIcon),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        AppNavigator.pushAndStackPage(context,
                                            page: SettingsPage());
                                      },
                                      child: (imageUrl != null  || imageUrl != '') ? SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child:   Image.network(
                                              fit: BoxFit.cover,
                                                imageUrl)),
                                      ): SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: const ImageView.asset(
                                                AppImages.avatarIcon)),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 16, 16, 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 0, 8),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xFFE5E7EB)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                  ),
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                            7.4, 0, 7.4, 0),
                                                    child: Text(
                                                      '1/4 completed',
                                                      style: GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                            Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        const Color(0xFFE2E4E9)),
                                                borderRadius:
                                                    BorderRadius.circular(16),
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
                                                      const EdgeInsets.fromLTRB(
                                                          3, 3, 3, 3),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .fromLTRB(0, 0, 0, 8),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: const Color(
                                                              0xFFFFFFFF),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0A000000),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius: 1.5,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0D2F3037),
                                                              offset:
                                                                  Offset(0, 24),
                                                              blurRadius: 34,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0A222A35),
                                                              offset:
                                                                  Offset(0, 4),
                                                              blurRadius: 3,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0D000000),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius: 0.5,
                                                            ),
                                                          ],
                                                        ),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  12, 10, 22, 10),
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
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        8.3,
                                                                        0),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      color: const Color(
                                                                          0xFFFFFFFF),
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x14123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              2),
                                                                          blurRadius:
                                                                              2,
                                                                        ),
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x0A123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              1),
                                                                          blurRadius:
                                                                              0.5,
                                                                        ),
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x14123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              0),
                                                                          blurRadius:
                                                                              0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: 20,
                                                                      height: 20,
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .fromLTRB(
                                                                              5,
                                                                              5,
                                                                              5,
                                                                              5),
                                                                      child:
                                                                          const SizedBox(
                                                                        width: 10,
                                                                        height:
                                                                            10,
                                                                        child: ImageView.svg(
                                                                            AppImages
                                                                                .check),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        1.5,
                                                                        0,
                                                                        1.5),
                                                                    child: Text(
                                                                      'Add a Bio to your profile',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Inter',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            14,
                                                                        decoration:
                                                                            TextDecoration
                                                                                .lineThrough,
                                                                        color: const Color(
                                                                            0xFF15141D),
                                                                        decorationColor:
                                                                            const Color(
                                                                                0xFF15141D),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        5),
                                                                width: 4,
                                                                height: 10,
                                                                child: const Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  size: 16,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .fromLTRB(0, 0, 0, 8),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: const Color(
                                                              0xFFFFFFFF),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0A000000),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius: 1.5,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0D2F3037),
                                                              offset:
                                                                  Offset(0, 24),
                                                              blurRadius: 34,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0A222A35),
                                                              offset:
                                                                  Offset(0, 4),
                                                              blurRadius: 3,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0D000000),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius: 0.5,
                                                            ),
                                                          ],
                                                        ),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  12, 10, 22, 10),
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
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        4.4,
                                                                        0),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      color: const Color(
                                                                          0xFFFFFFFF),
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x14123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              2),
                                                                          blurRadius:
                                                                              2,
                                                                        ),
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x0A123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              1),
                                                                          blurRadius:
                                                                              0.5,
                                                                        ),
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x14123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              0),
                                                                          blurRadius:
                                                                              0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: 20,
                                                                      height: 20,
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .fromLTRB(
                                                                              5,
                                                                              5,
                                                                              5,
                                                                              5),
                                                                      child:
                                                                          SizedBox(
                                                                        width: 10,
                                                                        height:
                                                                            10,
                                                                        child: ImageView
                                                                            .svg(
                                                                          AppImages
                                                                              .check,
                                                                          color: Colors
                                                                              .grey
                                                                              .shade300,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        1.5,
                                                                        0,
                                                                        1.5),
                                                                    child: Text(
                                                                      'Configure availability',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Inter',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            14,
                                                                        color: const Color(
                                                                            0xFF15141D),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        5),
                                                                width: 4,
                                                                height: 10,
                                                                child:
                                                                    const SizedBox(
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
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .fromLTRB(0, 0, 0, 8),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: const Color(
                                                              0xFFFFFFFF),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0A000000),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius: 1.5,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0D2F3037),
                                                              offset:
                                                                  Offset(0, 24),
                                                              blurRadius: 34,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0A222A35),
                                                              offset:
                                                                  Offset(0, 4),
                                                              blurRadius: 3,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0D000000),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius: 0.5,
                                                            ),
                                                          ],
                                                        ),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  12, 10, 22, 10),
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
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        8.5,
                                                                        0),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      color: const Color(
                                                                          0xFFFFFFFF),
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x14123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              2),
                                                                          blurRadius:
                                                                              2,
                                                                        ),
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x0A123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              1),
                                                                          blurRadius:
                                                                              0.5,
                                                                        ),
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x14123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              0),
                                                                          blurRadius:
                                                                              0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: 20,
                                                                      height: 20,
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .fromLTRB(
                                                                              5,
                                                                              5,
                                                                              5,
                                                                              5),
                                                                      child:
                                                                          SizedBox(
                                                                        width: 10,
                                                                        height:
                                                                            10,
                                                                        child: ImageView
                                                                            .svg(
                                                                          AppImages
                                                                              .check,
                                                                          color: Colors
                                                                              .grey
                                                                              .shade300,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        1.5,
                                                                        0,
                                                                        1.5),
                                                                    width: MediaQuery.sizeOf(
                                                                                context)
                                                                            .width *
                                                                        0.7,
                                                                    child: Text(
                                                                      'Specify Languages for communication',
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines: 1,
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Inter',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            14,
                                                                        color: const Color(
                                                                            0xFF15141D),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        5),
                                                                width: 4,
                                                                height: 10,
                                                                child:
                                                                    const SizedBox(
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
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .fromLTRB(0, 0, 0, 8),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: const Color(
                                                              0xFFFFFFFF),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0A000000),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius: 1.5,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0D2F3037),
                                                              offset:
                                                                  Offset(0, 24),
                                                              blurRadius: 34,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0A222A35),
                                                              offset:
                                                                  Offset(0, 4),
                                                              blurRadius: 3,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0D000000),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius: 0.5,
                                                            ),
                                                          ],
                                                        ),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  12, 10, 22, 10),
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
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        8.2,
                                                                        0),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      color: const Color(
                                                                          0xFFFFFFFF),
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x14123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              2),
                                                                          blurRadius:
                                                                              2,
                                                                        ),
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x0A123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              1),
                                                                          blurRadius:
                                                                              0.5,
                                                                        ),
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x14123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              0),
                                                                          blurRadius:
                                                                              0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: 20,
                                                                      height: 20,
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .fromLTRB(
                                                                              5,
                                                                              5,
                                                                              5,
                                                                              5),
                                                                      child:
                                                                          SizedBox(
                                                                        width: 10,
                                                                        height:
                                                                            10,
                                                                        child: ImageView
                                                                            .svg(
                                                                          AppImages
                                                                              .check,
                                                                          color: Colors
                                                                              .grey
                                                                              .shade300,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        1.5,
                                                                        0,
                                                                        1.5),
                                                                    child: Text(
                                                                      'Add Specialties or area of focus',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Inter',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            14,
                                                                        color: const Color(
                                                                            0xFF15141D),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        5),
                                                                width: 4,
                                                                height: 10,
                                                                child:
                                                                    const SizedBox(
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
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          color: const Color(
                                                              0xFFFFFFFF),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0A000000),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius: 1.5,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0D2F3037),
                                                              offset:
                                                                  Offset(0, 24),
                                                              blurRadius: 34,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0A222A35),
                                                              offset:
                                                                  Offset(0, 4),
                                                              blurRadius: 3,
                                                            ),
                                                            BoxShadow(
                                                              color: Color(
                                                                  0x0D000000),
                                                              offset:
                                                                  Offset(0, 1),
                                                              blurRadius: 0.5,
                                                            ),
                                                          ],
                                                        ),
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  12, 10, 22, 10),
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
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        0,
                                                                        8.4,
                                                                        0),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              99),
                                                                      color: const Color(
                                                                          0xFFFFFFFF),
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x14123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              2),
                                                                          blurRadius:
                                                                              2,
                                                                        ),
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x0A123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              1),
                                                                          blurRadius:
                                                                              0.5,
                                                                        ),
                                                                        BoxShadow(
                                                                          color: Color(
                                                                              0x14123769),
                                                                          offset: Offset(
                                                                              0,
                                                                              0),
                                                                          blurRadius:
                                                                              0,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: 20,
                                                                      height: 20,
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .fromLTRB(
                                                                              5,
                                                                              5,
                                                                              5,
                                                                              5),
                                                                      child:
                                                                          SizedBox(
                                                                        width: 10,
                                                                        height:
                                                                            10,
                                                                        child: ImageView
                                                                            .svg(
                                                                          AppImages
                                                                              .check,
                                                                          color: Colors
                                                                              .grey
                                                                              .shade300,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        1.5,
                                                                        0,
                                                                        1.5),
                                                                    child: Text(
                                                                      'Set consultation fee ',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Inter',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontSize:
                                                                            14,
                                                                        color: const Color(
                                                                            0xFF15141D),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        5),
                                                                width: 4,
                                                                height: 10,
                                                                child:
                                                                    const SizedBox(
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
                                                    ],
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
                                appointmentCard(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 12, 26, 11),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.fromLTRB(
                                                  0, 1, 0, 1),
                                              child: Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 45,
                                                    height: 46,
                                                    child: ImageView.asset(
                                                        AppImages
                                                            .scheduleAppointment),
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
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          'Schedule Appointment',
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
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                        child: Text(
                                                          'Book appointment on behalf of a patient',
                                                          style:
                                                              GoogleFonts.getFont(
                                                            'Inter',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12,
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
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 7, 0, 31),
                                              width: 4,
                                              height: 10,
                                              child: const SizedBox(
                                                width: 4,
                                                height: 10,
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 16,
                                                ),
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
                                          bottom: BorderSide(
                                            color: Color(0xFFE5E7EB),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 12, 26, 11),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.fromLTRB(
                                                  0, 1, 0, 1),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    width: 45,
                                                    height: 46,
                                                    child: ImageView.asset(
                                                        AppImages
                                                            .createPrescriptionn),
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  SizedBox(
                                                    height: 48,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: SizedBox(
                                                            height: 20,
                                                            child: SizedBox(
                                                              height: 20,
                                                              child: Text(
                                                                'Create a New Prescription',
                                                                style: GoogleFonts
                                                                    .getFont(
                                                                  'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 14,
                                                                  height: 1.4,
                                                                  color: const Color(
                                                                      0xFF0A0D14),
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
                                                                  FontWeight.w400,
                                                              fontSize: 12,
                                                              height: 1.7,
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
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 7, 0, 31),
                                              width: 4,
                                              height: 10,
                                              child: const SizedBox(
                                                width: 4,
                                                height: 10,
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 16,
                                                ),
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
                                          bottom: BorderSide(
                                            color: Color(0xFFE5E7EB),
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 26, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 44.6, 0),
                                              child: SizedBox(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 11, 0, 11),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const SizedBox(
                                                        width: 45,
                                                        height: 46,
                                                        child: ImageView.asset(
                                                            AppImages
                                                                .viewPatient),
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
                                                              alignment: Alignment
                                                                  .topLeft,
                                                              child: Text(
                                                                'View Patient Profiles',
                                                                style: GoogleFonts
                                                                    .getFont(
                                                                  'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 14,
                                                                  height: 1.4,
                                                                  color: const Color(
                                                                      0xFF0A0D14),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              'Access comprehensive patient profiles for streamlined virtual consultations.',
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                                height: 1.7,
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
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 7, 0, 51),
                                              width: 4,
                                              height: 10,
                                              child: const SizedBox(
                                                width: 4,
                                                height: 10,
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0.2, 0, 0.2, 16),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Analytics',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: const Color(0xFF15141D),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ChoiceSelector(
                                        days: const ["1 Day", "7 Days", "30 Days"],
                                        onSelected: _handleDaySelected,
                                      ),
                                      const SizedBox(height: 20,),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFFE2E4E9)),
                                          borderRadius: BorderRadius.circular(12),
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
                                          padding: const EdgeInsets.fromLTRB(
                                              3, 3, 3, 3),
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
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 16, 10, 0),
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                            height: 80,
                                                            width: 80,
                                                            child: ImageView.svg(
                                                                AppImages
                                                                    .noData)),
                                                        Container(
                                                          margin: const EdgeInsets
                                                              .fromLTRB(
                                                              0, 0, 0, 15),
                                                          child: Text(
                                                            'No Data Available Yet. ',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              fontSize: 14,
                                                              height: 1.7,
                                                              color: const Color(
                                                                  0xFF0A0D14),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          'Once you start using the app for consultations and prescriptions, your analytics will be displayed here',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              GoogleFonts.getFont(
                                                            'Inter',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 12,
                                                            height: 1.7,
                                                            color: const Color(
                                                                0xFF6B7280),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 30,
                                                        )
                                                      ],
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
                                ],
                              ),
                            ),
                          ),
                          const AnalyticsData()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  });
  }
}
