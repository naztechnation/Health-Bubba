import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard_pages.dart/patient/book_appointment.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:intl/intl.dart'; 
import '../../../../model/patients/patients_list.dart'; 
import '../../../../res/app_colors.dart';
import '../../../../widgets/button_view.dart'; 

 

class PatientDetails extends StatefulWidget {
  final Patients patientsData;
  const PatientDetails({Key? key, required this.patientsData})
      : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  
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
                    title: Center(
                      child: Text(
                        patientDetails.firstName ?? '',
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
                                                          patientDetails.picture,
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                ),
                                                Text(
                                                  patientDetails.firstName ??
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
                                                    CrossAxisAlignment.start,
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
                                                 (patientDetails.dob == null ) ? 'N/B':  calculateAge(patientDetails.dob ??
                                                            '') ,
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10,
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
                                                    CrossAxisAlignment.start,
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
                                                 (patientDetails.weight == null) ? 'N/B':  patientDetails.weight.toString(),  
                                                        
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10,
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
                                                    CrossAxisAlignment.start,
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
                                                    patientDetails.sex ??
                                                        'N/B',

                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                         FontWeight.w400,
                                                      fontSize:  10,
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
                                  if (patientDetails.currentMedications != null
                                       ) ...[
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
                                         if(patientDetails.currentMedications != null)   Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: patientDetails.currentMedications!
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
                                                          Expanded(
                                                            child: Text(
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
                                  if (patientDetails.healthConditions?.isNotEmpty ?? false)
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
                                         if(patientDetails.healthConditions != null)   Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: patientDetails.healthConditions!
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
                                                      text: (patientDetails.nextAppointmentDate ==
                                                                  'null' ||
                                                              patientDetails.nextAppointmentDate ==
                                                                  null ||
                                                              patientDetails
                                                                  .nextAppointmentDate
                                                                  .toString()
                                                                  .isEmpty)
                                                          ? 'N/A'
                                                          : formatDateTime(
                                                              patientDetails.nextAppointmentDate
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
                                                      text: (patientDetails.lastAppointmentDate ==
                                                                  'null' ||
                                                              patientDetails.lastAppointmentDate ==
                                                                  null ||
                                                              patientDetails.lastAppointmentDate
                                                                  .toString()
                                                                  .isEmpty)
                                                          ? 'none'
                                                          : formatDateTime(
                                                              patientDetails.lastAppointmentDate
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
                                                      text: (patientDetails.upcomingAppointmentsCount ==
                                                                  'null' ||
                                                              patientDetails.upcomingAppointmentsCount ==
                                                                  null ||
                                                              patientDetails.upcomingAppointmentsCount
                                                                  .toString()
                                                                  .isEmpty)
                                                          ? '0'
                                                          : patientDetails.upcomingAppointmentsCount.toString(),
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
                                                    text: (patientDetails.consultationsCount ==
                                                                  null ||
                                                               
                                                              patientDetails.consultationsCount
                                                                  .toString()
                                                                  .isEmpty)
                                                          ? '0'
                                                          : patientDetails.consultationsCount.toString(),
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
                                    patientsId:patientDetails.id.toString()  ?? '',
                                  ));
                            },
                            borderRadius: 100,
                            color: AppColors.lightSecondary,
                            child: const Text(
                              'Reschedule an Appointment',
                              style: TextStyle(
                                  color: AppColors.lightPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,),
                            )),
                      ),
                    ),
                  ),
                )
   ;
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


