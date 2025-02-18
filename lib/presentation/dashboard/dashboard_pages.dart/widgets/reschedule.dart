import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard_pages.dart/patient/book_appointment.dart';
import 'package:healthbubba/presentation/dashboard/dashboard_pages.dart/widgets/cancel_appointment.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../../../blocs/users/users.dart';
import '../../../../call_invitation.dart';
import '../../../../handlers/secure_handler.dart';
import '../../../../model/patients/appointment_lists.dart';
import '../../../../model/view_model/user_view_model.dart';
import '../../../../requests/repositories/user_repo/user_repository_impl.dart';
import '../../../../res/app_colors.dart';
import '../../../../res/app_strings.dart';
import '../../../../utils/app_utils.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../../widgets/error_page.dart';
import '../../../../widgets/loading_screen.dart';
import '../../../../widgets/modals.dart';
import 'patient_images.dart';

class ReschedulePage extends StatelessWidget {
  final bool isSchedule;
  final bool isCancel;
  final bool isDue;
  final bool isTime;
  final AppointmentListsData appointment;
  const ReschedulePage(
      {super.key,
      required this.isSchedule,
      required this.appointment,
        this.isCancel = true,
      required this.isDue,
      required this.isTime});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (BuildContext context) => UserCubit(
        userRepository: UserRepositoryImpl(),
        viewModel: Provider.of<UserViewModel>(context, listen: false),
      ),
      child: Reschedule(
        isSchedule: isSchedule,
        appointment: appointment,
        isDue: isDue,
        isTime: isTime, isCancel: isCancel,
      ),
    );
  }
}

class Reschedule extends StatefulWidget {
  final bool isSchedule;
  final bool isDue;
  final bool isTime;
  final bool isCancel;

  final AppointmentListsData appointment;

  const Reschedule(
      {super.key,
      required this.isSchedule,
      required this.appointment,
      required this.isDue,
      required this.isTime, required this.isCancel});

  @override
  State<Reschedule> createState() => _RescheduleState();
}

class _RescheduleState extends State<Reschedule> {
  late UserCubit _userCubit;
  // AppointmentDetailsData? appointmentDetails;

  String userId = '';
  String userName = '';

  getUserDetails() async {
    userId = await StorageHandler.getUserId();
    userName = await StorageHandler.getFirstName();
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
    _userCubit = context.read<UserCubit>();

    // _userCubit.getAppointmentDetails(
    //     appointmentId: widget.appointment.appointmentId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(listener: (context, state) {
      if (state is AppointmentDetailsLoaded) {
        if (state.appointmentDetails.ok ?? false) {
          // appointmentDetails = state.appointmentDetails.message?.data;
        } else {
          ToastService().showToast(context,
              leadingIcon: const ImageView.svg(
                AppImages.error,
                height: 25,
              ),
              title: 'Error!!!',
              subtitle: state.appointmentDetails.message?.message ?? '');
        }
      } else if (state is UserApiErr || state is UserNetworkErr) {
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
            onTap: () {
              _userCubit.getAppointmentDetails(
                  appointmentId: widget.appointment.appointmentId.toString());
            });
      } else if (state is UserNetworkErr) {
        return ErrorPage(
            statusCode: state.message ?? '',
            onTap: () {
              _userCubit.getAppointmentDetails(
                  appointmentId: widget.appointment.appointmentId.toString());
            });
      }
      return (state is AppointmentDetailsLoading)
          ? LoadersPage(length: MediaQuery.sizeOf(context).height.toInt())
          : Scaffold(
              appBar: AppBar(
                title: Center(
                  child: Text(
                    (widget.isSchedule)
                        ? 'Appointment'
                        :   'Patient Information',
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
                actions: const [
                  Text(
                    '         ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFFFFF),
                                      borderRadius: BorderRadius.circular(12),
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
                                              margin: const EdgeInsets.fromLTRB(
                                                  0.3, 0, 0, 16),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(40),
                                                child: SizedBox(
                                                  width: 62.6,
                                                  height: 64,
                                                  child: Image.network(
                                                    fit: BoxFit.cover,
                                                    widget.appointment
                                                            .patientPicture ??
                                                        '',
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return const ImageView
                                                          .asset(
                                                          AppImages.avatarIcon);
                                                    },
                                                    loadingBuilder: (context,
                                                        child,
                                                        loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) {
                                                        return const ImageView
                                                            .asset(AppImages
                                                                .avatarIcon);
                                                      }
                                                      return const ImageView
                                                          .asset(
                                                          AppImages.avatarIcon);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              widget.appointment
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
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            if (!widget.isSchedule)
                                              Column(
                                                children: [
                                                  Text(
                                                    widget.appointment
                                                            .patientEmail ??
                                                        '',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    ' ',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color: const Color(
                                                          0xFF0A0D14),
                                                    ),
                                                  ),
                                                ],
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
                                            margin: const EdgeInsets.fromLTRB(
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
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 2),
                                                child: Text(
                                                  'Age',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    height: 1.4,
                                                    color:
                                                        const Color(0xFF0A0D14),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                calculateAge(widget.appointment
                                                        .patientDob ??
                                                    'N/B'),
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10,
                                                  height: 1.7,
                                                  color:
                                                      const Color(0xFF6B7280),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 12.7, 6, 12.7),
                                    width: 20,
                                    height: 20,
                                    child: const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child:
                                          ImageView.svg(AppImages.weightIcon),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 2),
                                        child: Text(
                                          'Weight',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            (widget.appointment.patientWeight == null)
                                                ? 'N/B'
                                                : widget.appointment.patientWeight.toString() ,
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              height: 1.7,
                                              color: const Color(0xFF6B7280),
                                            ),
                                          ),
                                           Text(
                                            (widget.appointment.patientWeight == null)
                                                ? ''
                                                : (widget.appointment.patientWeightUnit == null) ? "KG" :widget.appointment.patientWeightUnit.toString() ,
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              height: 1.7,
                                              color: const Color(0xFF6B7280),
                                            ),
                                          ),
                                        ],
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
                                            margin: const EdgeInsets.fromLTRB(
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
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 2),
                                                child: Text(
                                                  'Gender',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    height: 1.4,
                                                    color:
                                                        const Color(0xFF0A0D14),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                 AppUtils.toTitleCase( widget.appointment
                                                          .patientSex ??
                                                      'N/B'),
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10,
                                                    height: 1.7,
                                                    color:
                                                        const Color(0xFF6B7280),
                                                  ),
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
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Appointed Time',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        height: 1.4,
                                        color: const Color(0xFF0A0D14),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Date',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                        Text(
                                          AppUtils.formatDateOnly(
                                              dateTime:
                                                  widget.appointment.date ??
                                                      ''),
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Time',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                        Text(
                                          AppUtils.formatTimeOnly(
                                              dateTime:
                                                  widget.appointment.time ??
                                                      ''),
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Booking For',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                        Text(
                                          AppUtils.toTitleCase(widget.appointment.bookingFor ??
                                                      ''),
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Complaint',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        height: 1.4,
                                        color: const Color(0xFF0A0D14),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      widget.appointment.complain ?? '',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        height: 1.4,
                                        color: const Color(0xFF0A0D14),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      color: Colors.grey.shade300,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              if (widget.isSchedule &&
                                  widget.appointment.images!.isNotEmpty)
                                GestureDetector(
                                  onTap: () {
                                    AppNavigator.pushAndStackPage(context,
                                        page: PatientImages(
                                          patientImages:
                                              widget.appointment.images ?? [],
                                        ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Attachments',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Stack(
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  fit: BoxFit.cover,
                                                  widget.appointment
                                                          .patientPicture ??
                                                      '',
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return const Center(
                                                      child: ImageView.svg(
                                                        fit: BoxFit.cover,
                                                        AppImages.gallery,
                                                      ),
                                                    );
                                                  },
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return const Center(
                                                          child: ImageView.svg(
                                                        fit: BoxFit.cover,
                                                        AppImages.gallery,
                                                      ));
                                                    }
                                                    return const Center(
                                                      child: ImageView.svg(
                                                        fit: BoxFit.cover,
                                                        AppImages.gallery,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                top: 15,
                                                left: 0,
                                                right: 0,
                                                child: Text(
                                                  '+${widget.appointment.images?.length}',
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ))
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Divider(
                                          color: Colors.grey.shade300,
                                        ),
                                        const SizedBox(
                                          height: 10,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 0, 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              color: const Color(0xFF6B7280),
                                            ),
                                          ),
                                        ),
                                      ),
                                      (widget.appointment.healthConditions ==
                                                  null ||
                                              widget.appointment
                                                      .healthConditions ==
                                                  '')
                                          ? Text(
                                              'None',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                height: 1.5,
                                                color: const Color(0xFF131316),
                                              ),
                                            )
                                          : Align(
                                              alignment: Alignment.topLeft,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 23,
                                                    height: 23,
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 1, 8, 1),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color(0xFFFFFFFF),
                                                    ),
                                                    padding: const EdgeInsets
                                                        .fromLTRB(
                                                        1.5, 1.5, 1.5, 1.5),
                                                    child: const SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child: ImageView.svg(
                                                        AppImages.tick,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    widget.appointment
                                                            .healthConditions ??
                                                        '',
                                                    style: GoogleFonts.getFont(
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
                              // (appointmentDetails?.healthConditions == null)
                              //     ? const SizedBox.shrink()
                              //     : Container(
                              //         decoration: const BoxDecoration(
                              //           color: Color(0xFFFFFFFF),
                              //           border: Border(
                              //             bottom: BorderSide(
                              //               color: Color(0xFFE5E7EB),
                              //               width: 1,
                              //             ),
                              //           ),
                              //         ),
                              //         child: Container(
                              //           padding: const EdgeInsets.fromLTRB(
                              //               16, 16, 0, 15),
                              //           child: Column(
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.start,
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.start,
                              //             children: [
                              //               Container(
                              //                 margin: const EdgeInsets.fromLTRB(
                              //                     0, 0, 0, 8),
                              //                 child: Align(
                              //                   alignment: Alignment.topLeft,
                              //                   child: Text(
                              //                     'Current Health Conditions',
                              //                     style: GoogleFonts.getFont(
                              //                       'Inter',
                              //                       fontWeight: FontWeight.w400,
                              //                       fontSize: 14,
                              //                       height: 1.4,
                              //                       color:
                              //                           const Color(0xFF6B7280),
                              //                     ),
                              //                   ),
                              //                 ),
                              //               ),
                              //               Align(
                              //                 alignment: Alignment.topLeft,
                              //                 child: Column(
                              //                   mainAxisAlignment:
                              //                       MainAxisAlignment.start,
                              //                   crossAxisAlignment:
                              //                       CrossAxisAlignment.start,
                              //                   children: [
                              //                     Container(
                              //                       margin: const EdgeInsets
                              //                           .fromLTRB(0, 0, 0, 8),
                              //                       child: Align(
                              //                         alignment:
                              //                             Alignment.topLeft,
                              //                         child: Row(
                              //                           mainAxisAlignment:
                              //                               MainAxisAlignment
                              //                                   .start,
                              //                           crossAxisAlignment:
                              //                               CrossAxisAlignment
                              //                                   .start,
                              //                           children: [
                              //                             Container(
                              //                               margin:
                              //                                   const EdgeInsets
                              //                                       .fromLTRB(
                              //                                       0, 1, 8, 1),
                              //                               child: Container(
                              //                                 decoration:
                              //                                     const BoxDecoration(
                              //                                   color: Color(
                              //                                       0xFFFFFFFF),
                              //                                 ),
                              //                                 child: Container(
                              //                                   width: 23,
                              //                                   height: 23,
                              //                                   padding:
                              //                                       const EdgeInsets
                              //                                           .fromLTRB(
                              //                                           1.5,
                              //                                           1.5,
                              //                                           1.5,
                              //                                           1.5),
                              //                                   child:
                              //                                       const SizedBox(
                              //                                     width: 20,
                              //                                     height: 20,
                              //                                     child:
                              //                                         ImageView
                              //                                             .svg(
                              //                                       AppImages
                              //                                           .tick,
                              //                                     ),
                              //                                   ),
                              //                                 ),
                              //                               ),
                              //                             ),
                              //                             Text(
                              //                               'Vitamin Deficiency',
                              //                               style: GoogleFonts
                              //                                   .getFont(
                              //                                 'Inter',
                              //                                 fontWeight:
                              //                                     FontWeight
                              //                                         .w400,
                              //                                 fontSize: 13,
                              //                                 height: 1.5,
                              //                                 color: const Color(
                              //                                     0xFF131316),
                              //                               ),
                              //                             ),
                              //                           ],
                              //                         ),
                              //                       ),
                              //                     ),
                              //                     Container(
                              //                       margin: const EdgeInsets
                              //                           .fromLTRB(0, 0, 0, 8),
                              //                       child: Align(
                              //                         alignment:
                              //                             Alignment.topLeft,
                              //                         child: Row(
                              //                           mainAxisAlignment:
                              //                               MainAxisAlignment
                              //                                   .start,
                              //                           crossAxisAlignment:
                              //                               CrossAxisAlignment
                              //                                   .start,
                              //                           children: [
                              //                             Container(
                              //                               margin:
                              //                                   const EdgeInsets
                              //                                       .fromLTRB(
                              //                                       0, 1, 8, 1),
                              //                               child: Container(
                              //                                 decoration:
                              //                                     const BoxDecoration(
                              //                                   color: Color(
                              //                                       0xFFFFFFFF),
                              //                                 ),
                              //                                 child: Container(
                              //                                   width: 23,
                              //                                   height: 23,
                              //                                   padding:
                              //                                       const EdgeInsets
                              //                                           .fromLTRB(
                              //                                           1.5,
                              //                                           1.5,
                              //                                           1.5,
                              //                                           1.5),
                              //                                   child:
                              //                                       const SizedBox(
                              //                                     width: 20,
                              //                                     height: 20,
                              //                                     child:
                              //                                         ImageView
                              //                                             .svg(
                              //                                       AppImages
                              //                                           .tick,
                              //                                     ),
                              //                                   ),
                              //                                 ),
                              //                               ),
                              //                             ),
                              //                             Text(
                              //                               'Osteoporosis',
                              //                               style: GoogleFonts
                              //                                   .getFont(
                              //                                 'Inter',
                              //                                 fontWeight:
                              //                                     FontWeight
                              //                                         .w400,
                              //                                 fontSize: 13,
                              //                                 height: 1.5,
                              //                                 color: const Color(
                              //                                     0xFF131316),
                              //                               ),
                              //                             ),
                              //                           ],
                              //                         ),
                              //                       ),
                              //                     ),
                              //                     Container(
                              //                       margin: const EdgeInsets
                              //                           .fromLTRB(0, 0, 0, 8),
                              //                       child: Row(
                              //                         mainAxisAlignment:
                              //                             MainAxisAlignment
                              //                                 .start,
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment
                              //                                 .start,
                              //                         children: [
                              //                           Container(
                              //                             margin:
                              //                                 const EdgeInsets
                              //                                     .fromLTRB(
                              //                                     0, 1, 8, 1),
                              //                             child: Container(
                              //                               decoration:
                              //                                   const BoxDecoration(
                              //                                 color: Color(
                              //                                     0xFFFFFFFF),
                              //                               ),
                              //                               child: Container(
                              //                                 width: 23,
                              //                                 height: 23,
                              //                                 padding:
                              //                                     const EdgeInsets
                              //                                         .fromLTRB(
                              //                                         1.5,
                              //                                         1.5,
                              //                                         1.5,
                              //                                         1.5),
                              //                                 child:
                              //                                     const SizedBox(
                              //                                   width: 20,
                              //                                   height: 20,
                              //                                   child: ImageView
                              //                                       .svg(
                              //                                     AppImages
                              //                                         .tick,
                              //                                   ),
                              //                                 ),
                              //                               ),
                              //                             ),
                              //                           ),
                              //                           Text(
                              //                             'Dermatological Problems',
                              //                             style: GoogleFonts
                              //                                 .getFont(
                              //                               'Inter',
                              //                               fontWeight:
                              //                                   FontWeight.w400,
                              //                               fontSize: 13,
                              //                               height: 1.5,
                              //                               color: const Color(
                              //                                   0xFF131316),
                              //                             ),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                     ),
                              //                     Container(
                              //                       margin: const EdgeInsets
                              //                           .fromLTRB(0, 0, 0, 8),
                              //                       child: Align(
                              //                         alignment:
                              //                             Alignment.topLeft,
                              //                         child: Row(
                              //                           mainAxisAlignment:
                              //                               MainAxisAlignment
                              //                                   .start,
                              //                           crossAxisAlignment:
                              //                               CrossAxisAlignment
                              //                                   .start,
                              //                           children: [
                              //                             Container(
                              //                               margin:
                              //                                   const EdgeInsets
                              //                                       .fromLTRB(
                              //                                       0, 1, 8, 1),
                              //                               child: Container(
                              //                                 decoration:
                              //                                     const BoxDecoration(
                              //                                   color: Color(
                              //                                       0xFFFFFFFF),
                              //                                 ),
                              //                                 child: Container(
                              //                                   width: 23,
                              //                                   height: 23,
                              //                                   padding:
                              //                                       const EdgeInsets
                              //                                           .fromLTRB(
                              //                                           1.5,
                              //                                           1.5,
                              //                                           1.5,
                              //                                           1.5),
                              //                                   child:
                              //                                       const SizedBox(
                              //                                     width: 20,
                              //                                     height: 20,
                              //                                     child:
                              //                                         ImageView
                              //                                             .svg(
                              //                                       AppImages
                              //                                           .tick,
                              //                                     ),
                              //                                   ),
                              //                                 ),
                              //                               ),
                              //                             ),
                              //                             Text(
                              //                               'Athritis',
                              //                               style: GoogleFonts
                              //                                   .getFont(
                              //                                 'Inter',
                              //                                 fontWeight:
                              //                                     FontWeight
                              //                                         .w400,
                              //                                 fontSize: 13,
                              //                                 height: 1.5,
                              //                                 color: const Color(
                              //                                     0xFF131316),
                              //                               ),
                              //                             ),
                              //                           ],
                              //                         ),
                              //                       ),
                              //                     ),

                              //                   ],
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //         ),
                              //       ),
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
                                      const EdgeInsets.fromLTRB(16, 16, 0, 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              color: const Color(0xFF6B7280),
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
                                                color: const Color(0xFF131316),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: (widget.appointment
                                                              .nextAppointmentDate ==
                                                          null)
                                                      ? ' N/A'
                                                      : formatDateTime(widget
                                                          .appointment
                                                          .nextAppointmentDate
                                                          .toString()),
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
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
                                                color: const Color(0xFF131316),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: (widget.appointment
                                                              .lastAppointmentDate ==
                                                          null)
                                                      ? ' N/A'
                                                      : formatDateTime(widget
                                                          .appointment
                                                          .lastAppointmentDate
                                                          .toString()),
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w500,
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
                                              text: 'Upcoming Appointments: ',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                height: 1.5,
                                                color: const Color(0xFF131316),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: (widget.appointment
                                                              .upcomingAppointmentsCount ==
                                                          null)
                                                      ? 'N/A'
                                                      : widget.appointment
                                                          .upcomingAppointmentsCount
                                                          .toString(),
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w600,
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
                                            text: 'Number of Consultations: ',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              height: 1.5,
                                              color: const Color(0xFF131316),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: (widget.appointment
                                                            .consultationsCount ==
                                                        null)
                                                    ? 'N/A'
                                                    : widget.appointment
                                                        .consultationsCount
                                                        .toString(),
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
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
                              const SizedBox(
                                height: 25,
                              ),

                                  if (widget.appointment.status != 1)
                              GestureDetector(
                              
                                   onTap: () {
                                              if (widget.isTime) {
                                                ZegoUIKitPrebuiltCallInvitationService()
                                                    .init(
                                                  appID:
                                                      AppStrings.zigoAppIdUrl,
                                                  appSign:
                                                      AppStrings.zegoAppSign,
                                                  userID: userId,
                                                  userName: userName,
                                                  plugins: [
                                                    ZegoUIKitSignalingPlugin()
                                                  ],
                                                );

                                                AppNavigator.pushAndStackPage(
                                                    context,
                                                    page: CallInviteScreen(
                                                      isVideoCall: false,
                                                      inviteeId: widget
                                                          .appointment.patientId
                                                          .toString(),
                                                      inviteeName: widget
                                                          .appointment
                                                          .patientLastName
                                                          .toString(),
                                                      appointmentId: widget
                                                          .appointment
                                                          .appointmentId
                                                          .toString(),
                                                    ));
                                              } else {
                                                Modals.showToast(
                                                    "Appointments cannot be initiated at the moment",
                                                    context);
                                              }
                                            
                                },
                                child: Container(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Communication',
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                height: 1.4,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 8),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: const Color(0xff30B82C)
                                                    .withOpacity(0.3),
                                              ),
                                              child: Text(
                                                'Online Consultation ',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  height: 1.4,
                                                  color: const Color(0xff30B82C),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      
                                        Opacity(
                                          opacity: widget.isTime
                                              ? 1
                                              : 0.3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 38,
                                                    width: 38,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color:
                                                                Color(0xff30B82C),
                                                            shape:
                                                                BoxShape.circle),
                                                    child: const Icon(
                                                      Icons.call,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'Audio Call',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color:
                                                          const Color(0xff0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Row(
                                                children: [
                                                  const SizedBox(
                                                    height: 45,
                                                    width: 45,
                                                    child: ImageView.svg(
                                                        AppImages.videoIcon),
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    'Video Call',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 14,
                                                      height: 1.4,
                                                      color:
                                                          const Color(0xff0A0D14),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: (widget.appointment.status != 1)
                  ? Container(
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
                        child:
                            // (!widget.isSchedule)
                            //     ? ButtonView(
                            //         onPressed: () {},
                            //         borderRadius: 100,
                            //         color: AppColors.lightSecondary,
                            //         child: const Text(
                            //           'Rebook',
                            //           style: TextStyle(
                            //               color: AppColors.lightPrimary,
                            //               fontSize: 14,
                            //               fontWeight: FontWeight.w500),
                            //         ))
                            //     :
                            Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          if(widget.isCancel)  Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  AppNavigator.pushAndStackPage(context,
                                      page: CancelAppointment(
                                          appointmentId: widget
                                              .appointment.appointmentId
                                              .toString()));
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
                                        'Cancel',
                                        style: TextStyle(
                                            color: AppColors.lightSecondary,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ButtonView(
                                  expanded: false,
                                  onPressed: () {
                                    AppNavigator.pushAndStackPage(context,
                                        page: BookAppointentPage(
                                          isReBookAppointment: true,
                                          patientsId: widget
                                              .appointment.patientId
                                              .toString(), appointmentId: widget
                                              .appointment.appointmentId.toString() ?? "",
                                        ));
                                  },
                                  borderRadius: 100,
                                  color: AppColors.lightSecondary,
                                  child: const Text(
                                    'Reschedule',
                                    style: TextStyle(
                                        color: AppColors.lightPrimary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            );
    });
  }

  bool isWithinFiveMinutes(String dateTimeString) {
    try {
      DateTime inputTime = DateTime.parse(dateTimeString).toUtc();

      DateTime currentTime = DateTime.now().toUtc();

      int differenceInMinutes = currentTime.difference(inputTime).inMinutes;

      return differenceInMinutes.abs() <= 5;
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
      return 'N/B';
    }
  }

  String formatDateTime(String dateTimeString) {
    final DateTime dateTime = DateTime.parse(dateTimeString);
    final DateFormat formatter = DateFormat('MMMM d, yyyy, h:mm a');

    return formatter.format(dateTime.toLocal());
  }
}
