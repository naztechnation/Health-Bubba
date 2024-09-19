import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../blocs/users/users.dart';
import '../../../../model/user/medication_details.dart';
import '../../../../model/view_model/user_view_model.dart';
import '../../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/error_page.dart';
import '../../../../widgets/image_view.dart';
import '../../../../widgets/loading_screen.dart';

class MedicationDetailsPage extends StatelessWidget {
  final String medicatioId;

  const MedicationDetailsPage({
    super.key,
    required this.medicatioId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
        create: (BuildContext context) => UserCubit(
              userRepository: UserRepositoryImpl(),
              viewModel: Provider.of<UserViewModel>(context, listen: false),
            ),
        child: MedicationDetails(
          medicatioId: medicatioId,
        ));
  }
}

class MedicationDetails extends StatefulWidget {
  final String medicatioId;

  const MedicationDetails({super.key, required this.medicatioId});

  @override
  State<MedicationDetails> createState() => _MedicationDetailsState();
}

class _MedicationDetailsState extends State<MedicationDetails> {
  late UserCubit _userCubit;
  List<MedicationDetailsData> medicationDetails = [];

  @override
  void initState() {
    super.initState();
    _userCubit = context.read<UserCubit>();

    _userCubit.getMedicationDetails(medicationId: widget.medicatioId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is MedicationDetailsLoaded) {
        if (state.medicationDetails.ok ?? false) {
          medicationDetails = state.medicationDetails.data ?? [];
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.error),
              title: 'Error!!!',
              subtitle: state.medicationDetails.message ?? '');
        }
      } else if (state is UserApiErr || state is UserNetworkErr) {
        ToastService().showToast(context,
            leadingIcon: const ImageView.svg(AppImages.error),
            title: 'Error!!!',
            subtitle: "Network Error");
      }
    }, builder: (context, state) {
      if (state is UserApiErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.getMedicationDetails(medicationId: widget.medicatioId);
            });
      } else if (state is UserNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.getMedicationDetails(medicationId: widget.medicatioId);
            });
      }
      return (state is MedicationDetailsLoading)
          ? LoadersPage(length: MediaQuery.sizeOf(context).height.toInt())
          : Scaffold(
              backgroundColor: AppColors.lightPrimary,
              appBar: AppBar(
                title: Text(
                  medicationDetails.first.patientFirstName ?? '',
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600),
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
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFE5E7EB),
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Column(
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
                                          16, 0, 16, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Container(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 16, 0, 16),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(
                                                        0.7, 0, 0, 16),
                                                    child: SizedBox(
                                                      width: 60,
                                                      height: 60,
                                                      child: Hero(
                                                        tag: 'medicsPicture',
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      45.5),
                                                          child: Image.network(
                                                            medicationDetails
                                                                    .first
                                                                    .patientPicture ??
                                                                '',
                                                            fit: BoxFit.cover,
                                                            errorBuilder:
                                                                (context, error,
                                                                    stackTrace) {
                                                              return const ImageView
                                                                  .asset(
                                                                  AppImages
                                                                      .avatarIcon,
                                                                  fit: BoxFit
                                                                      .cover);
                                                            },
                                                            loadingBuilder:
                                                                (context, child,
                                                                    loadingProgress) {
                                                              if (loadingProgress ==
                                                                  null)
                                                                return child;
                                                              return const ImageView
                                                                  .asset(
                                                                  AppImages
                                                                      .avatarIcon,
                                                                  fit: BoxFit
                                                                      .cover);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  medicationDetails.first
                                                          .medicationName ??
                                                      '',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    height: 1.4,
                                                    color:
                                                        const Color(0xFF0A0D14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              16, 16, 12.5, 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 8),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Prescription details',
                                                    style: GoogleFonts.getFont(
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
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 12),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Medication name',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Inter',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                            height: 1.4,
                                                            color: const Color(
                                                                0xFF5E5F6E),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Expanded(
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Text(
                                                              medicationDetails
                                                                      .first
                                                                      .medicationName ??
                                                                  '',
                                                              textAlign:
                                                                  TextAlign.end,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 12,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF0A0D14),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(
                                                        0, 0, 3.8, 12),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 0, 10, 0),
                                                          child: Text(
                                                            'Dosage',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              height: 1.4,
                                                              color: const Color(
                                                                  0xFF5E5F6E),
                                                            ),
                                                          ),
                                                        ),
                                                        RichText(
                                                          textAlign:
                                                              TextAlign.end,
                                                          text: TextSpan(
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
                                                            children: [
                                                              TextSpan(
                                                                text: medicationDetails
                                                                        .first
                                                                        .dosage ??
                                                                    '',
                                                                style:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 14,
                                                                  height: 1.3,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    '1 Tablet',
                                                                style:
                                                                    GoogleFonts
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
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 12),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 0, 0, 0),
                                                          child: Text(
                                                            'Frequency',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              height: 1.4,
                                                              color: const Color(
                                                                  0xFF5E5F6E),
                                                            ),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        if (medicationDetails
                                                                .first.frequency
                                                                .toString()
                                                                .toLowerCase() ==
                                                            'Specific days'
                                                                .toLowerCase()) ...[
                                                          Expanded(
                                                            child: Text(
                                                              textAlign:
                                                                  TextAlign.end,
                                                              getMedicationDaysString(
                                                                  medicationDetails
                                                                          .first
                                                                          .medicationDays ??
                                                                      []),
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 13,
                                                                height: 1.4,
                                                                color: const Color(
                                                                    0xFF0A0D14),
                                                              ),
                                                            ),
                                                          ),
                                                        ] else ...[
                                                          Text(
                                                            textAlign:
                                                                TextAlign.end,
                                                            medicationDetails
                                                                    .first
                                                                    .frequency ??
                                                                '',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 13,
                                                              height: 1.4,
                                                              color: const Color(
                                                                  0xFF0A0D14),
                                                            ),
                                                          ),
                                                        ]
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 12),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 0, 0, 0),
                                                          child: Text(
                                                            'Time of the day',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              height: 1.4,
                                                              color: const Color(
                                                                  0xFF5E5F6E),
                                                            ),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        Expanded(
                                                          child: Text(
                                                            textAlign:
                                                                TextAlign.end,
                                                            getMedicationTimesString(
                                                                medicationDetails
                                                                        .first
                                                                        .medicationTimes ??
                                                                    []),
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 13,
                                                              height: 1.4,
                                                              color: const Color(
                                                                  0xFF0A0D14),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(
                                                        0, 0, 3.5, 12),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 0, 10, 0),
                                                          child: Text(
                                                            'Take with meal',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              height: 1.4,
                                                              color: const Color(
                                                                  0xFF5E5F6E),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          textAlign:
                                                              TextAlign.end,
                                                          medicationDetails
                                                                  .first
                                                                  .toBeTaken ??
                                                              '',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Inter',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14,
                                                            height: 1.4,
                                                            color: const Color(
                                                                0xFF0A0D14),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(
                                                        0, 0, 3.8, 12),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 0, 10, 0),
                                                          child: Text(
                                                            'Category',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              height: 1.4,
                                                              color: const Color(
                                                                  0xFF5E5F6E),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          textAlign:
                                                              TextAlign.end,
                                                          medicationDetails
                                                                  .first
                                                                  .category ??
                                                              '',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Inter',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14,
                                                            height: 1.4,
                                                            color: const Color(
                                                                0xFF0A0D14),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(
                                                        0, 0, 3.6, 12),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 0, 10, 0),
                                                          child: Text(
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
                                                                  0xFF5E5F6E),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          textAlign:
                                                              TextAlign.end,
                                                          getDurationDifference(
                                                              medicationDetails
                                                                      .first
                                                                      .durationStartTime ??
                                                                  '',
                                                              medicationDetails
                                                                      .first
                                                                      .durationEndTime ??
                                                                  ''),
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Inter',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14,
                                                            height: 1.4,
                                                            color: const Color(
                                                                0xFF0A0D14),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 4, 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 0, 10, 0),
                                                          child: Text(
                                                            'Route of administration',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 14,
                                                              height: 1.4,
                                                              color: const Color(
                                                                  0xFF5E5F6E),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          textAlign:
                                                              TextAlign.end,
                                                          medicationDetails
                                                                  .first
                                                                  .administrationRouteName ??
                                                              '',
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Inter',
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14,
                                                            height: 1.4,
                                                            color: const Color(
                                                                0xFF0A0D14),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
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
                                              16, 16, 19, 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 8),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Notes',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF6B7280),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                medicationDetails.first.notes ??
                                                    '',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF0A0D14),
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
                                              16, 18, 26, 17),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'View Previous Medication ',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF6B7280),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 15, 5),
                                                width: 4,
                                                height: 10,
                                                child: SizedBox(
                                                    width: 4,
                                                    height: 10,
                                                    child: Icon(
                                                      Icons.arrow_forward_ios,
                                                      color:
                                                          Colors.grey.shade400,
                                                      size: 16,
                                                    )),
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
                                              16, 16, 0, 15),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 8),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Current Medication',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF6B7280),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(0, 1, 8, 1),
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xFFFFFFFF),
                                                        ),
                                                        child: Container(
                                                          width: 18,
                                                          height: 18,
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  1.5,
                                                                  1.5,
                                                                  1.5,
                                                                  1.5),
                                                          child: const SizedBox(
                                                            width: 20,
                                                            height: 20,
                                                            child:
                                                                ImageView.svg(
                                                                    AppImages
                                                                        .tick),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      medicationDetails
                                                              .first.category ??
                                                          '',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 13,
                                                        height: 1.5,
                                                        color: const Color(
                                                            0xFF131316),
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
                                ],
                              ),
                            ),
                          ]),
                    ),
                  )));
    });
  }

  String getDurationDifference(String startTimeString, String endTimeString) {
    final DateTime startTime = DateTime.parse(startTimeString);
    final DateTime endTime = DateTime.parse(endTimeString);

    if (endTime.isBefore(startTime) || endTime.isAtSameMomentAs(startTime)) {
      return "elapsed";
    }

    final Duration difference = endTime.difference(startTime);
    int days = difference.inDays;

    final int weeks = days ~/ 7;
    days = days % 7;

    final int months = weeks ~/ 4;
    final int remainingWeeks = weeks % 4;

    String result = "";

    if (months > 0) {
      result += "$months month${months > 1 ? 's' : ''} ";
    }
    if (remainingWeeks > 0) {
      result += "$remainingWeeks week${remainingWeeks > 1 ? 's' : ''} ";
    }
    if (days > 0) {
      result += "$days day${days > 1 ? 's' : ''}";
    }

    return result.trim();
  }

  String getMedicationDaysString(List<MedicationDays> medicationDays) {
    List<String> days =
        medicationDays.map((medicationDay) => medicationDay.day ?? '').toList();
    return days.join(', ');
  }

  String getMedicationTimesString(List<MedicationTimes> medicationDays) {
    List<String> days = medicationDays
        .map((medicationDay) => medicationDay.time ?? '')
        .toList();
    return days.join(', ');
  }
}
