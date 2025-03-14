import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard_pages.dart/patient/case_note.dart';
import 'package:healthbubba/presentation/dashboard/dashboard_pages.dart/patient/medical_history.dart';
 
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
 
import 'package:healthbubba/widgets/image_view.dart';
import 'package:intl/intl.dart';
import '../../../../model/patients/patients_list.dart';
import '../../../../res/app_colors.dart';
import '../../../../utils/app_utils.dart';
import 'add_feedback.dart';
 

class NewPatientDetails extends StatefulWidget {
  final Patients patientsData;
  const NewPatientDetails({Key? key, required this.patientsData})
      : super(key: key);

  @override
  State<NewPatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<NewPatientDetails> {
  late Patients patientDetails;

  @override
  void initState() {
    super.initState();

    patientDetails = widget.patientsData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Patients Details',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 16, 0, 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0.3, 0, 0, 16),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: SizedBox(
                                          width: 62.6,
                                          height: 64,
                                          child: Image.network(
                                            fit: BoxFit.cover,
                                            patientDetails.picture ?? '',
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const ImageView.asset(
                                                  AppImages.avatarIcon);
                                            },
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null)
                                                return child;
                                              return const ImageView.asset(
                                                  AppImages.avatarIcon);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      patientDetails.firstName ?? '',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        height: 1.4,
                                        color: const Color(0xFF0A0D14),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          6,
                                        ),
                                        color: const Color(0xffF3F4F6),
                                        border: Border.all(
                                            color: const Color(0xFFE5E7EB),
                                            width: 1),
                                      ),
                                      child: Text(
                                        patientDetails.patientStatus
                                                .toString()
                                                .toUpperCase() ??
                                            '',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          height: 1.7,
                                          color: const Color(0xFF838487),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
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
                          padding: const EdgeInsets.fromLTRB(16, 16, 16.7, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 11, 6, 11),
                                    width: 20,
                                    height: 20,
                                    child: const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: ImageView.svg(AppImages.ageIcon),
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
                                          'Age',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        textAlign: TextAlign.center,
                                        (patientDetails.dob == null)
                                            ? 'N/B'
                                            : calculateAge(
                                                patientDetails.dob ?? ''),
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
                                            (patientDetails.weight == null)
                                                ? '     —'
                                                : patientDetails.weight
                                                    .toString(),
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              height: 1.7,
                                              color: const Color(0xFF6B7280),
                                            ),
                                          ),
                                          Text(
                                            (patientDetails.weight == null)
                                                ? ''
                                                : (patientDetails.weightUnit ==
                                                        null)
                                                    ? "KG"
                                                    : patientDetails.weightUnit
                                                        .toString(),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        0, 13.2, 6, 12.6),
                                    width: 20,
                                    height: 20,
                                    child: const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child:
                                          ImageView.svg(AppImages.genderIcon),
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
                                          'Gender',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        AppUtils.toTitleCase(
                                            patientDetails.sex ?? 'N/B'),
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: const Color(0xFF6B7280),
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(14, 18, 14, 10),
                        width: MediaQuery.sizeOf(context).width,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFFF3F4F6)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 45,
                              margin: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                              width: MediaQuery.sizeOf(context).width * 0.45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x0D020617),
                                    offset: Offset(0, 0),
                                    blurRadius: 0,
                                    spreadRadius: 1,
                                  ),
                                  BoxShadow(
                                    color: Color(0x1A020617),
                                    offset: Offset(0, 6),
                                    blurRadius: 7.3,
                                    spreadRadius: -7,
                                  ),
                                  BoxShadow(
                                    color: Color(0x14020617),
                                    offset: Offset(0, 6),
                                    blurRadius: 6,
                                    spreadRadius: -3,
                                  ),
                                  BoxShadow(
                                    color: Color(0x05020617),
                                    offset: Offset(0, 2),
                                    blurRadius: 2,
                                    spreadRadius: -1,
                                  ),
                                  BoxShadow(
                                    color: Color(0x14020617),
                                    offset: Offset(0, 4),
                                    blurRadius: 8,
                                    spreadRadius: -7,
                                  ),
                                ],
                              ),
                              child: Align(
                                child: Text(
                                  "Case Notes",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: const Color(0xFF111827),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                AppNavigator.pushAndStackPage(context, page: const MedicalHistory());
                              },
                              child: Row(
                                children: [
                                  Align(
                                    child: Text(
                                      "Medical History",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: const Color(0xFF6B7280),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const ImageView.svg(AppImages.linkIcon),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                          itemCount: 5,
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return caseNotes(index);
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: const BoxDecoration(
      //     color: Color(0xFFFFFFFF),
      //     border: Border(
      //       top: BorderSide(
      //         color: Color(0xFFE5E7EB),
      //         width: 1,
      //       ),
      //     ),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Color(0x14000000),
      //         offset: Offset(0, -4),
      //         blurRadius: 8.8999996185,
      //       ),
      //     ],
      //   ),
      //   child: Container(
      //     padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
      //     child: Container(
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(100),
      //         color: const Color(0xFF093126),
      //         boxShadow: const [
      //           BoxShadow(
      //             color: Color(0x33212126),
      //             offset: Offset(0, 1),
      //             blurRadius: 1.5,
      //           ),
      //           BoxShadow(
      //             color: Color(0xFF083025),
      //             offset: Offset(0, 0),
      //             blurRadius: 0,
      //           ),
      //         ],
      //       ),
      //       child: ButtonView(
      //           onPressed: () {
      //             AppNavigator.pushAndStackPage(context,
      //                 page: BookAppointentPage(
      //                   isReBookAppointment: false,
      //                   patientsId: patientDetails.id.toString() ?? '',
      //                   appointmentId: patientDetails.appointmentId ?? "",
      //                 ));
      //           },
      //           borderRadius: 100,
      //           color: AppColors.lightSecondary,
      //           child: const Text(
      //             'Reschedule Appointment',
      //             style: TextStyle(
      //               color: AppColors.lightPrimary,
      //               fontSize: 14,
      //               fontWeight: FontWeight.w500,
      //             ),
      //           )),
      //     ),
      //   ),
      // ),
    );
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

  Widget caseNotes(int index) {
    return Container(
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
            border: Border.all(color: const Color(0xFFE2E4E9)),
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
              padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                            padding:
                                const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // if (AppUtils.isWithinFiveMinutes(
                                        //     upcomingAppointment.time ?? "",
                                        //     "${AppUtils.getHumanReadableDate(upcomingAppointment.date ?? '')}, ${AppUtils.formatTimeOnly(dateTime: upcomingAppointment.time ?? '')}",
                                        //     context)) {
                                        //   ZegoUIKitPrebuiltCallInvitationService().init(
                                        //     appID: AppStrings.zigoAppIdUrl,
                                        //     appSign: AppStrings.zegoAppSign,
                                        //     userID: userId,
                                        //     userName: userName,
                                        //     plugins: [ZegoUIKitSignalingPlugin()],
                                        //   );
                                
                                        // AppNavigator.pushAndStackPage(context,
                                        //     page: CallInviteScreen(
                                        //       inviteeId: upcomingAppointment.patientId.toString(),
                                        //       inviteeName:
                                        //           upcomingAppointment.patientLastName.toString(),
                                        //       appointmentId:
                                        //           upcomingAppointment.appointmentId.toString(),
                                        //     ));
                                        // } else {
                                        //   Modals.showToast(
                                        //       "Appointment cannot be initiated at the moment",
                                        //       context);
                                        // }
                                      },
                                      child: const SizedBox(
                                        width: 40.1,
                                        height: 40.8,
                                        child:
                                            ImageView.svg(AppImages.videoIcon),
                                      ),
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
                                        Text(
                                          'Video Consultation',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            height: 1.7,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                        Text(
                                          'Ayoola Feranmi',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF0A0D14),
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.6,
                                          child: const Row(
                                            children: [
                                              // Text(
                                              //   '${AppUtils.getHumanReadableDate(upcomingAppointment.date ?? '')}, ${AppUtils.formatTimeOnly(dateTime: upcomingAppointment.time ?? '')}',
                                              //   style: GoogleFonts.getFont(
                                              //     'Inter',
                                              //     fontWeight: FontWeight.w500,
                                              //     fontSize: 12,
                                              //     color:
                                              //         const Color(0xFF6C7079),
                                              //   ),
                                              // ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              // Flexible(
                                              //   child: Text(
                                              //     '  (${AppUtils.getTimeDifference(replaceTimeInDateTime(upcomingAppointment.date ?? '', upcomingAppointment.time ?? ''))})',
                                              //     textAlign: TextAlign.end,
                                              //     style: GoogleFonts.getFont(
                                              //       'Inter',
                                              //       fontWeight:
                                              //           FontWeight.w400,
                                              //       fontSize: 12,
                                              //       color: const Color(
                                              //           0xFF6B7280),
                                              //     ),
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                               Expanded(
                                 child: Text(
                                            'Feb 14th, 19:03',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              height: 1.7,
                                              color: const Color(0xFF6B7280),
                                            ),
                                          ),
                               ), 
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 11),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFE5E7EB),
                              ),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                height: 1,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      width:
                                          MediaQuery.sizeOf(context).width,
                                      height: 42,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(
                                            100,
                                          ),
                                          color: AppColors.lightPrimary,
                                          border: Border.all(
                                              color: Colors.grey,
                                              width: 0.5)),
                                      child: const Center(
                                        child: Text(
                                          'Rebook',
                                          style: TextStyle(
                                              color:
                                                  AppColors.lightSecondary,
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
                                child: GestureDetector(
                                  onTap: () {
                                    if(index%2!=0){
                                      AppNavigator.pushAndStackPage(context, page: const AddFeedback());
                                    }else{
                                      AppNavigator.pushAndStackPage(context, page: const CaseNote());
                                      
                                    }
                                  },
                                  child: Container(
                                      width:
                                          MediaQuery.sizeOf(context).width,
                                      height: 42,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(
                                            100,
                                          ),
                                          color: AppColors.lightPrimary,
                                          border: Border.all(
                                              color: Colors.grey,
                                              width: 0.5)),
                                      child:   Center(
                                        child: Text(
                                         (index%2==0)? 'View Case Note' : "Add Feedback",
                                          style:const TextStyle(
                                              color:
                                                  AppColors.lightSecondary,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
