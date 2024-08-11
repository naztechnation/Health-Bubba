import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard_pages.dart/patient/book_appointment.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../blocs/users/users.dart';
import '../../../../model/patients/patients_details.dart';
import '../../../../model/view_model/user_view_model.dart';
import '../../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../../res/app_colors.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/error_page.dart';
import '../../../../widgets/loading_screen.dart';

class PatientDetails extends StatelessWidget {
  final String patientId;

  const PatientDetails({
    super.key,
    required this.patientId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
        create: (BuildContext context) => UserCubit(
              userRepository: UserRepositoryImpl(),
              viewModel: Provider.of<UserViewModel>(context, listen: false),
            ),
        child: PatientDetailsScreen(
          patientsId: patientId,
        ));
  }
}

class PatientDetailsScreen extends StatefulWidget {
  final String patientsId;
  const PatientDetailsScreen({Key? key, required this.patientsId})
      : super(key: key);

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  late UserCubit _userCubit;
  List<Patients> patientDetails = [];

  @override
  void initState() {
    super.initState();
    _userCubit = context.read<UserCubit>();

    _userCubit.getPatientDetails(patientId: widget.patientsId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
        userRepository: UserRepositoryImpl(),
        viewModel: Provider.of<UserViewModel>(context, listen: false),
      ),
      child: PatientDetailsPage(
        patientsId: widget.patientsId,
      ),
    );
  }
}

class PatientDetailsPage extends StatefulWidget {
  final String patientsId;

  const PatientDetailsPage({super.key, required this.patientsId});

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  late UserCubit _userCubit;
  List<Patients> patientsLists = [];

  getPatientsLists() async {
    _userCubit.getPatientDetails(
      patientId: widget.patientsId,
    );
  }

  @override
  void initState() {
    _userCubit = context.read<UserCubit>();
    getPatientsLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is PatientsDetailsLoaded) {
        if (state.patientDetails.ok ?? false) {
          setState(() {
            patientsLists.addAll(state.patientDetails.data?.patients ?? []);
          });

          
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(AppImages.error),
              title: 'Error!!!',
              subtitle: state.patientDetails.message ?? '');
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
              _userCubit.getPatientDetails(
                patientId: widget.patientsId,
              );
            });
      } else if (state is UserNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.getPatientDetails(
                patientId: widget.patientsId,
              );
            });
      }
      return (state is PatientsDetailsLoading)
          ? LoadersPage(length: MediaQuery.sizeOf(context).height.toInt())
          : Stack(
              children: [
                Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: Center(
                      child: Text(
                        patientsLists.first.firstName ?? '',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    centerTitle: true,
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.only(left: 12.0, top: 19, bottom: 19),
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
                    actions: const [
                      Text(
                        '         ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  body: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 79),
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
                                                Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          0.3, 0, 0, 16),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    child: SizedBox(
                                                        width: 62.6,
                                                        height: 64,
                                                        child:
                                                            ImageView.network(
                                                          patientsLists
                                                              .first.picture,
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                ),
                                                Text(
                                                  patientsLists
                                                          .first.firstName ??
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
                                          16, 16, 16.7, 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 11, 6, 11),
                                                width: 20,
                                                height: 20,
                                                child: const SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: ImageView.svg(
                                                      AppImages.ageIcon),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 2),
                                                    child: Text(
                                                      'Age',
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
                                                  Text(
                                                    textAlign: TextAlign.center,
                                                    calculateAge(patientsLists
                                                                .first.dob ??
                                                            '') ??
                                                        '',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.7,
                                                      color: const Color(
                                                          0xFF6B7280),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 12.7, 6, 12.7),
                                                width: 20,
                                                height: 20,
                                                child: const SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: ImageView.svg(
                                                      AppImages.weightIcon),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 2),
                                                    child: Text(
                                                      'Weight',
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
                                                  Text(
                                                    '',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.7,
                                                      color: const Color(
                                                          0xFF6B7280),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 13.2, 6, 12.6),
                                                width: 20,
                                                height: 20,
                                                child: const SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: ImageView.svg(
                                                      AppImages.genderIcon),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 2),
                                                    child: Text(
                                                      'Gender+',
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
                                                  Text(
                                                    patientsLists.first.sex ??
                                                        '',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      height: 1.7,
                                                      color: const Color(
                                                          0xFF6B7280),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (patientsLists.first.currentMedications!
                                      .isNotEmpty) ...[
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
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 0, 8),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Current Medication',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    height: 1.4,
                                                    color:
                                                        const Color(0xFF6B7280),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: patientsLists
                                                    .first.currentMedications!
                                                    .map((medics) {
                                                  return Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 8),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .fromLTRB(
                                                                    0, 1, 8, 1),
                                                            child: Container(
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color(
                                                                    0xFFFFFFFF),
                                                              ),
                                                              child: Container(
                                                                width: 23,
                                                                height: 23,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        1.5,
                                                                        1.5,
                                                                        1.5,
                                                                        1.5),
                                                                child:
                                                                    const SizedBox(
                                                                  width: 20,
                                                                  height: 20,
                                                                  child:
                                                                      ImageView
                                                                          .svg(
                                                                    AppImages
                                                                        .tick,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            medics.medicationName ??
                                                                '',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 13,
                                                              height: 1.5,
                                                              color: const Color(
                                                                  0xFF131316),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }).toList()),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                  if (patientsLists
                                      .first.healthConditions!.isNotEmpty)
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
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 0, 8),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  'Current Health Conditions',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 14,
                                                    height: 1.4,
                                                    color:
                                                        const Color(0xFF6B7280),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: patientsLists
                                                    .first.healthConditions!
                                                    .map((health) {
                                                  return Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 0, 8),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .fromLTRB(
                                                                    0, 1, 8, 1),
                                                            child: Container(
                                                              decoration:
                                                                  const BoxDecoration(
                                                                color: Color(
                                                                    0xFFFFFFFF),
                                                              ),
                                                              child: Container(
                                                                width: 23,
                                                                height: 23,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        1.5,
                                                                        1.5,
                                                                        1.5,
                                                                        1.5),
                                                                child:
                                                                    const SizedBox(
                                                                  width: 20,
                                                                  height: 20,
                                                                  child:
                                                                      ImageView
                                                                          .svg(
                                                                    AppImages
                                                                        .tick,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            health.healthConditionName ??
                                                                '',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 13,
                                                              height: 1.5,
                                                              color: const Color(
                                                                  0xFF131316),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }).toList()),
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
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 8),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                'Appointments',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  height: 1.4,
                                                  color:
                                                      const Color(0xFF6B7280),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 8),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Next Appointment: ',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFF131316),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: (patientsLists.first
                                                                      .nextAppointmentDate ==
                                                                  'null' ||
                                                              patientsLists
                                                                      .first
                                                                      .nextAppointmentDate ==
                                                                  null ||
                                                              patientsLists
                                                                  .first
                                                                  .nextAppointmentDate
                                                                  .toString()
                                                                  .isEmpty)
                                                          ? 'none'
                                                          : formatDateTime(
                                                              patientsLists
                                                                  .first
                                                                  .nextAppointmentDate
                                                                  .toString()),
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        height: 1.3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 8),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: RichText(
                                                text: TextSpan(
                                                  text: 'Last Appointment: ',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFF131316),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: (patientsLists.first
                                                                      .lastAppointmentDate ==
                                                                  'null' ||
                                                              patientsLists
                                                                      .first
                                                                      .lastAppointmentDate ==
                                                                  null ||
                                                              patientsLists
                                                                  .first
                                                                  .lastAppointmentDate
                                                                  .toString()
                                                                  .isEmpty)
                                                          ? 'none'
                                                          : formatDateTime(
                                                              patientsLists
                                                                  .first
                                                                  .lastAppointmentDate
                                                                  .toString()),
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        height: 1.3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 8),
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: RichText(
                                                text: TextSpan(
                                                  text:
                                                      'Upcoming Appointments: ',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xFF131316),
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: (patientsLists.first
                                                                      .upcomingAppointmentsCount ==
                                                                  'null' ||
                                                              patientsLists
                                                                      .first
                                                                      .upcomingAppointmentsCount ==
                                                                  null ||
                                                              patientsLists
                                                                  .first
                                                                  .upcomingAppointmentsCount
                                                                  .toString()
                                                                  .isEmpty)
                                                          ? '0'
                                                          : patientsLists
                                                                  .first
                                                                  .upcomingAppointmentsCount.toString(),
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 13,
                                                        height: 1.3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: RichText(
                                              text: TextSpan(
                                                text:
                                                    'Number of Consultations: ',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13,
                                                  height: 1.5,
                                                  color:
                                                      const Color(0xFF131316),
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: (patientsLists.first
                                                                      .consultationCount ==
                                                                  'null' ||
                                                              patientsLists
                                                                      .first
                                                                      .consultationCount ==
                                                                  null ||
                                                              patientsLists
                                                                  .first
                                                                  .consultationCount
                                                                  .toString()
                                                                  .isEmpty)
                                                          ? '0'
                                                          : patientsLists
                                                                  .first
                                                                  .consultationCount.toString(),
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      height: 1.3,
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  bottomNavigationBar: Container(
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
                        child: ButtonView(
                            onPressed: () {
                              AppNavigator.pushAndStackPage(context,
                                  page: BookAppointentPage(
                                    isReBookAppointment: false,
                                    patientsId: widget.patientsId,
                                  ));
                            },
                            borderRadius: 100,
                            color: AppColors.lightSecondary,
                            child: const Text(
                              'Schedule an Appointment',
                              style: TextStyle(
                                  color: AppColors.lightPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),
                  ),
                ),
                if (state is PatientsDetailsLoading)
                  Container(
                    color: Colors.black.withOpacity(0.8),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.indicatorColor,
                      ),
                    ),
                  ),
              ],
            );
    });
  }

  String calculateAge(String birthdate) {
    if (birthdate.isEmpty) {
      return '';
    }

    try {
      DateTime birthDate = DateFormat('yyyy-MM-dd').parse(birthdate);
      DateTime today = DateTime.now();
      int age = today.year - birthDate.year;

      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }

      return age.toString();
    } catch (e) {
      return 'Invalid date format';
    }
  }

  String formatDateTime(String dateTimeString) {
    final DateTime dateTime = DateTime.parse(dateTimeString);
    final DateFormat formatter = DateFormat('MMMM d, yyyy, h:mm a');

    return formatter.format(dateTime.toLocal());
  }
}
