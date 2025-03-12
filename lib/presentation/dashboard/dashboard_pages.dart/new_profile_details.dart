import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/utils/app_utils.dart';
import 'package:healthbubba/widgets/modals.dart';

import 'package:provider/provider.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/text_edit_view.dart';
import '../../../blocs/users/users.dart';
import '../../../model/view_model/user_view_model.dart';
import '../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../res/app_strings.dart';
import '../../../utils/validator.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/error_page.dart';

class NewProfileDetails extends StatelessWidget {
  const NewProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
        userRepository: UserRepositoryImpl(),
        viewModel: Provider.of<UserViewModel>(context, listen: false),
      ),
      child: ProfileDetails(),
    );
  }
}

class ProfileDetails extends StatefulWidget {
  @override
  State<ProfileDetails> createState() => _ConsultationFeeState();
}

class _ConsultationFeeState extends State<ProfileDetails> {
  List<String> duration = ['Minute', 'Hour'];

  late UserCubit _userCubit;
  final _formKey = GlobalKey<FormState>();

  var rateController = TextEditingController();
  var durationController = TextEditingController();
  var returningRateController = TextEditingController();

  String? _selectedItem;

  bool isSavedBefore = false;
  bool isReturningOn = false;
  bool isForeverOn = false;

  String fee = "";

  void _onRadioChanged(String? item) {
    setState(() {
      _selectedItem = item;
      _updateTextField();
    });
  }

  void _updateTextField() {
    durationController.text = _selectedItem ?? '';
  }

  @override
  void initState() {
    _userCubit = context.read<UserCubit>();

    _userCubit.getConsultationStatus();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is ConsultaionFeeLoaded) {
        if (state.fee.ok ?? false) {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.success,
                height: 25,
              ),
              title: AppStrings.successTitle,
              subtitle: state.fee.message?.message ?? '');

          Navigator.pop(context);
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.error,
                height: 25,
              ),
              title: 'Error!!!',
              subtitle: state.fee.message?.message ?? '');
        }
      } else if (state is CheckConsultaionStatusLoaded) {
        if (state.fee.ok ?? false) {}
      } else if (state is ConsultationStatusLoaded) {
        if (state.consultationFeeData.ok ?? false) {
          if (state.consultationFeeData.message?.data?.rate
                  .toString()
                  .isNotEmpty ??
              false) {
            setState(() {
              fee = state.consultationFeeData.message?.data?.rate.toString() ??
                  "";
              if (fee.isNotEmpty) {
                isSavedBefore = true;
              }
            });
          } else {
            setState(() {
              isSavedBefore = false;
            });
          }
        } else {}
      } else if (state is UserApiErr || state is UserNetworkErr) {}
    }, builder: (context, state) {
      if (state is UserApiErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.addConsultationFee(
                  rate: rateController.text.trim(),
                  duration: 'H',
                  // duration: durationController.text.trim(),
                  url: (isSavedBefore)
                      ? AppStrings.addConsultationUrl
                      : AppStrings.editConsultationUrl);
            });
      } else if (state is UserNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.addConsultationFee(
                  rate: rateController.text.trim(),
                  duration: 'H',
                  // duration: durationController.text.trim(),
                  url: (isSavedBefore)
                      ? AppStrings.addConsultationUrl
                      : AppStrings.editConsultationUrl);
            });
      }
      return Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Profile Details',
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
            body: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 23),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (!isSavedBefore)
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 16, 16, 15),
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
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0x12000000),
                                                    offset: Offset(0, 0),
                                                    blurRadius: 0,
                                                    spreadRadius: 1,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xFFF7F7F7)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Personal Details ',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16,
                                                              height: 1.6,
                                                              color: const Color(
                                                                  0xFF131316),
                                                            ),
                                                          ),
                                                          const ImageView.svg(
                                                            AppImages.edit,
                                                            height: 18,
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                 
                                                Container(
                                                  decoration: BoxDecoration(
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color:
                                                              Color(0x08000000),
                                                          offset: Offset(0, 0),
                                                          blurRadius: 0,
                                                          spreadRadius: 1,
                                                        ),
                                                        BoxShadow(
                                                          color:
                                                              Color(0x0F191C21),
                                                          offset: Offset(0, 1),
                                                          blurRadius: 2,
                                                          spreadRadius: 0,
                                                        ),
                                                        BoxShadow(
                                                          color:
                                                              Color(0x14000000),
                                                          offset: Offset(0, 0),
                                                          blurRadius: 2,
                                                          spreadRadius: 0,
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.white),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Title',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF6B7280),
                                                              ),
                                                            ),
                                                            Text(
                                                              'MR',
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF131316),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'First name',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF6B7280),
                                                              ),
                                                            ),
                                                            Text(
                                                              'Alexander',
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF131316),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Last name',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF6B7280),
                                                              ),
                                                            ),
                                                            Text(
                                                              'Ogunyemi',
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF131316),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Phone Number',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF6B7280),
                                                              ),
                                                            ),
                                                            Text(
                                                              '08116848839',
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF131316),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Location',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF6B7280),
                                                              ),
                                                            ),
                                                            Text(
                                                              'Ikeja, Lagos',
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF131316),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Experience',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF6B7280),
                                                              ),
                                                            ),
                                                            Text(
                                                              '14 years',
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF131316),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Clinic/Hospital Affiliation',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF6B7280),
                                                              ),
                                                            ),
                                                            Text(
                                                              'FMC, Yaba',
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF131316),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color(0x12000000),
                                                    offset: Offset(0, 0),
                                                    blurRadius: 0,
                                                    spreadRadius: 1,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xFFF7F7F7)),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Enable Returning Consultation Fee',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16,
                                                              height: 1.6,
                                                              color: const Color(
                                                                  0xFF131316),
                                                            ),
                                                          ),
                                                          Transform.scale(
                                                            scale: 0.85,
                                                            child:
                                                                CupertinoSwitch(
                                                              value:
                                                                  isReturningOn,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  isReturningOn =
                                                                      value;
                                                                });
                                                              },
                                                              activeColor:
                                                                  const Color(
                                                                      0xff3B82F6),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Offer a promotional fee to returning patients within a certain period from their First Consultation',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                          height: 1.4,
                                                          color: const Color(
                                                              0xFF6B7280),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                if (isReturningOn)
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color: Color(
                                                                0x08000000),
                                                            offset:
                                                                Offset(0, 0),
                                                            blurRadius: 0,
                                                            spreadRadius: 1,
                                                          ),
                                                          BoxShadow(
                                                            color: Color(
                                                                0x0F191C21),
                                                            offset:
                                                                Offset(0, 1),
                                                            blurRadius: 2,
                                                            spreadRadius: 0,
                                                          ),
                                                          BoxShadow(
                                                            color: Color(
                                                                0x14000000),
                                                            offset:
                                                                Offset(0, 0),
                                                            blurRadius: 2,
                                                            spreadRadius: 0,
                                                          ),
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Colors.white),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              14.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Rate',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                              height: 1.4,
                                                              color: const Color(
                                                                  0xFF131316),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          TextEditView(
                                                            controller:
                                                                returningRateController,
                                                            borderColor: Colors
                                                                .grey.shade200,
                                                            borderWidth: 0.5,
                                                            hintText:
                                                                'Enter rate in NGN',
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            validator: (value) {
                                                              return Validator
                                                                  .validate(
                                                                      value,
                                                                      'Rate');
                                                            },
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            'Each consultation lasts 30minutes',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 16,
                                                              height: 1.6,
                                                              color: const Color(
                                                                  0xFFD97706),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Divider(
                                                            color: Colors
                                                                .grey.shade200,
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Text(
                                                            'Valid for (Returning fee would be applied throughout this period):',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16,
                                                              height: 1.6,
                                                              color: const Color(
                                                                  0xFF131316),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 14,
                                                          ),
                                                          Text(
                                                            'Duration',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              height: 1.4,
                                                              color: const Color(
                                                                  0xFF131316),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          TextEditView(
                                                            controller:
                                                                durationController,
                                                            borderColor: Colors
                                                                .grey.shade200,
                                                            borderWidth: 0.5,
                                                            hintText: 'Select',
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down,
                                                              color: Colors.grey
                                                                  .shade700,
                                                            ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            validator: (value) {
                                                              return Validator
                                                                  .validate(
                                                                      value,
                                                                      'Rate');
                                                            },
                                                          ),
                                                          const SizedBox(
                                                            height: 8,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Forever',
                                                                style:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 16,
                                                                  height: 1.6,
                                                                  color: const Color(
                                                                      0xFF131316),
                                                                ),
                                                              ),
                                                              Transform.scale(
                                                                scale: 0.85,
                                                                child:
                                                                    CupertinoSwitch(
                                                                  value:
                                                                      isForeverOn,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      isForeverOn =
                                                                          value;
                                                                    });
                                                                  },
                                                                  activeColor:
                                                                      const Color(
                                                                          0xff3B82F6),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Container(
                                      //   margin: const EdgeInsets.fromLTRB(
                                      //       0, 0, 0, 16),
                                      //   child: Column(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.start,
                                      //     crossAxisAlignment:
                                      //         CrossAxisAlignment.start,
                                      //     children: [
                                      //       Container(
                                      //         margin: const EdgeInsets.fromLTRB(
                                      //             0, 0, 0, 8),
                                      //         child: Align(
                                      //           alignment: Alignment.topLeft,
                                      //           child: Text(
                                      //             'Duration',
                                      //             style: GoogleFonts.getFont(
                                      //               'Inter',
                                      //               fontWeight: FontWeight.w500,
                                      //               fontSize: 14,
                                      //               height: 1.4,
                                      //               color:
                                      //                   const Color(0xFF131316),
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //       TextEditView(
                                      //         controller: durationController,
                                      //         borderColor: Colors.grey.shade200,
                                      //         borderWidth: 0.5,
                                      //         readOnly: true,
                                      //         hintText: 'Select',
                                      //         suffixIcon: const Padding(
                                      //           padding: EdgeInsets.all(17.0),
                                      //           child: ImageView.svg(
                                      //             AppImages.dropDown,
                                      //             scale: 0.8,
                                      //           ),
                                      //         ),
                                      //         onTap: () {
                                      //           Modals.showDialogModal(context,
                                      //               page: durationModalContent(
                                      //                   context));
                                      //         },
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              if (isSavedBefore)
                                Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      margin: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x12000000),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color(0xFFF7F7F7)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(14),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Default Consultation fee',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        height: 1.6,
                                                        color: const Color(
                                                            0xFF131316),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(18),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const ImageView.svg(
                                                            AppImages.card,
                                                            height: 32,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Rate: N${AppUtils.convertPrice(fee)}",
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          16,
                                                                      height:
                                                                          1.4,
                                                                      color: const Color(
                                                                          0xFF131316),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 12,
                                                                  ),
                                                                  Text(
                                                                    "For 30mins",
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
                                                                      height:
                                                                          1.4,
                                                                      color: const Color(
                                                                          0xFF5E5F6E),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              isSavedBefore =
                                                                  false;
                                                            });
                                                          },
                                                          child: const ImageView
                                                              .svg(
                                                            AppImages.edit,
                                                            height: 18,
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      margin: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x12000000),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color(0xFFF7F7F7)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(14),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Returning Consultation Fee',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16,
                                                        height: 1.6,
                                                        color: const Color(
                                                            0xFF131316),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          Modals.showBottomSheetModal(
                                                              context,
                                                              heightFactor:
                                                                  0.35,
                                                              isDissmissible:
                                                                  true,
                                                              isScrollControlled:
                                                                  true,
                                                              page: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        18.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Returning Consultation Fee',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Inter',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            16,
                                                                        height:
                                                                            1.6,
                                                                        color: const Color(
                                                                            0xFF131316),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          16,
                                                                    ),
                                                                    Text(
                                                                      'Offer a promotional fee to returning patients within a certain period from their First Consultation',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Inter',
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontSize:
                                                                            16,
                                                                        height:
                                                                            1.6,
                                                                        color: const Color(
                                                                            0xFF6B7280),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          40,
                                                                    ),
                                                                    ButtonView(
                                                                        onPressed:
                                                                            () {},
                                                                        borderRadius:
                                                                            100,
                                                                        color: AppColors
                                                                            .lightSecondary,
                                                                        child:
                                                                            const Text(
                                                                          'Okay',
                                                                          style: TextStyle(
                                                                              color: AppColors.lightPrimary,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w500),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ));
                                                        },
                                                        child:
                                                            const ImageView.svg(
                                                          AppImages
                                                              .infoBorderIcon,
                                                          height: 25,
                                                        ))
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(18),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const ImageView.svg(
                                                            AppImages.card,
                                                            height: 32,
                                                          ),
                                                          const SizedBox(
                                                            width: 15,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Rate: N${AppUtils.convertPrice(fee)}",
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          16,
                                                                      height:
                                                                          1.4,
                                                                      color: const Color(
                                                                          0xFF131316),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 12,
                                                                  ),
                                                                  Text(
                                                                    "For 30mins",
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
                                                                      height:
                                                                          1.4,
                                                                      color: const Color(
                                                                          0xFF5E5F6E),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 12,
                                                                  ),
                                                                  Text(
                                                                    "Validity: Forever",
                                                                    style: GoogleFonts
                                                                        .getFont(
                                                                      'Inter',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          14,
                                                                      height:
                                                                          1.4,
                                                                      color: const Color(
                                                                          0xFF5E5F6E),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              isSavedBefore =
                                                                  false;
                                                            });
                                                          },
                                                          child: const ImageView
                                                              .svg(
                                                            AppImages.edit,
                                                            height: 18,
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // ButtonView(
                                    //     expanded: false,
                                    //     onPressed: () {

                                    //     },
                                    //     borderRadius: 100,
                                    //     color: AppColors.lightPrimary,
                                    //     borderWidth: 1,
                                    //     borderColor: Colors.grey.shade300,
                                    //     child: const Text(
                                    //       'Edit Consultation Fee',
                                    //       style: TextStyle(
                                    //           color: AppColors.lightSecondary,
                                    //           fontSize: 14,
                                    //           fontWeight: FontWeight.w500),
                                    //     )),
                                  ],
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: (isSavedBefore)
                ? const SizedBox.shrink()
                : Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border(
                        top: BorderSide(
                          color: Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x14000000),
                          offset: Offset(0, -4),
                          blurRadius: 8.8999996185,
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xFF093126),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x33212126),
                              offset: Offset(0, 1),
                              blurRadius: 1.5,
                            ),
                            BoxShadow(
                              color: Color(0xFF083025),
                              offset: Offset(0, 0),
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: SizedBox(
                          height: 50,
                          child: ButtonView(
                              onPressed: () {
                                if (rateController.text.trim().isNotEmpty) {
                                  if (isSavedBefore) {
                                    _userCubit.addConsultationFee(
                                        rate: rateController.text.trim(),
                                        duration: 'H',
                                        url: AppStrings.editConsultationUrl);
                                  } else {
                                    _userCubit.addConsultationFee(
                                        rate: rateController.text.trim(),
                                        duration: 'H',
                                        url: AppStrings.addConsultationUrl);
                                  }
                                } else {
                                  ToastService().showToast(context,
                                      leadingIcon: const ImageView.svg(
                                        AppImages.error,
                                        height: 25,
                                      ),
                                      title: 'Error!!!',
                                      subtitle: 'Enter Rate');
                                }
                                FocusScope.of(context).unfocus();
                              },
                              borderRadius: 100,
                              color: AppColors.lightSecondary,
                              child: Text(
                                (isSavedBefore) ? 'Update' : 'Save',
                                style: const TextStyle(
                                    color: AppColors.lightPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )),
                        ),
                      ),
                    ),
                  ),
          ),
          if (state is ConsultationFeeDataLoading ||
              state is ConsultaionFeeLoading) ...[
            Container(
              color: AppColors.indicatorBgColor,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.indicatorColor,
                ),
              ),
            ),
          ]
        ],
      );
    });
  }

  durationModalContent(BuildContext context) {
    return StatefulBuilder(builder: (BuildContext context, StateSetter state) {
      return Container(
        width: MediaQuery.sizeOf(context).width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300, width: 2),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: duration.length,
              itemBuilder: (context, index) {
                String dura = duration[index];
                bool isChecked = _selectedItem == dura;

                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    state(() {
                      _onRadioChanged(dura);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13.0, horizontal: 18),
                    child: Row(
                      children: [
                        CustomRadioButton(
                          bgColor: const Color(0xFF6667FA),
                          isChecked: isChecked,
                          onChanged: (checked) {
                            state(() {
                              Navigator.pop(context);

                              _onRadioChanged(dura);
                            });
                          },
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Expanded(
                          child: Text(
                            dura,
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              height: 1.5,
                              color: const Color(0xFF030712),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    });
  }
}

class CustomRadioButton extends StatefulWidget {
  final bool isChecked;
  final Function(bool) onChanged;
  final Color bgColor;

  const CustomRadioButton({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.bgColor,
  });

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onChanged(!widget.isChecked);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.isChecked ? widget.bgColor : Colors.transparent,
          border: Border.all(
            color: widget.isChecked ? widget.bgColor : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        width: 24,
        height: 24,
        child: widget.isChecked
            ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
