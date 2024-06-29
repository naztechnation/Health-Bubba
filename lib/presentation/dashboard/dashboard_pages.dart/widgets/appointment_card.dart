


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/model/patients/appointment_lists.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';

import '../../../../utils/app_utils.dart';
import '../../../../widgets/choice_widget.dart';

appointmentCard(List<AppointmentListsData> appointmentListsData){
  return Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      border: Border(
                        bottom: BorderSide (
                          color: Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
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
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(3, 7, 3, 3),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Upcoming Appointment',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        height: 1.4,
                                        color: const Color(0xFF0A0D14),
                                      ),
                                    ),
                                    Text(
                                      'View all (${appointmentListsData.length})',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        height: 1.4,
                                        color: const Color(0xFF0A0D14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        
                              ListView.builder(
                                itemCount: appointmentListsData.length,
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 12),
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (  (context, index) {
                                return Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 210.1,
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                                          child: Row(
                                         
                                            children: [
                                              const ImageView.svg(AppImages.avatar),
                                              const SizedBox(width: 13,),
                                              SizedBox(
                                                width: 139.1,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                      appointmentListsData[index].patientFirstName ?? '',
                                                      style: GoogleFonts.getFont(
                                                        'Inter',
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        height: 1.4,
                                                        color: const Color(0xFF0A0D14),
                                                      ),
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                        style: GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 12,
                                                          height: 1.7,
                                                          color: const Color(0xFF6B7280),
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: '${AppUtils.getHumanReadableDate(appointmentListsData[index].date ?? '')}, ${AppUtils.formatTimeOnly(dateTime: appointmentListsData[index].time ?? '')}',
                                                            style: GoogleFonts.getFont(
                                                              'Inter',
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 12,
                                                              height: 1.3,
                                                              color: const Color(0xFF6C7079),
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: '  (${AppUtils.getTimeDifference(appointmentListsData[index].date ?? '')})',
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
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(0, 29.2, 0, 0),
                                        child: const SizedBox(
                                          width: 30.1,
                                          height: 30.8,
                                          child: ImageView.svg(AppImages.videoIcon),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              })),
                              
                               
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
}

class AnalyticsData extends StatefulWidget {
  const AnalyticsData({super.key});

  @override
  State<AnalyticsData> createState() => _AnalyticsDataState();
}

class _AnalyticsDataState extends State<AnalyticsData> {

  String _selectedDay = "1 Day";

  void _handleDaySelected(String selectedDay) {
    setState(() {
      _selectedDay = selectedDay;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
                    decoration:const BoxDecoration(
                      color:  Color(0xFFFFFFFF),
                      border: Border(
                        bottom: BorderSide (
                          color:   Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0.2, 0, 0.2, 10),
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
                          const SizedBox(height: 8,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               ChoiceSelector(
                                      items: const ["1 Day", "7 Days", "30 Days"],
                                      onSelected: _handleDaySelected,
                                    ),
                                const SizedBox(height: 15,),   
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: const Color(0xFFE2E4E9)),
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
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
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
                                                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                                          child: Align(
                                                            alignment: Alignment.topLeft,
                                                            child: Text(
                                                              'Total Consultations',
                                                              style: GoogleFonts.getFont(
                                                                'Inter',
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 12,
                                                                height: 1.6,
                                                                color: const Color(0xFF6B7280),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment.topLeft,
                                                          child: Text(
                                                            '50',
                                                            style: GoogleFonts.getFont(
                                                              'Inter',
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 16,
                                                              height: 1.5,
                                                              letterSpacing: -0.2,
                                                              color: const Color(0xFF0A0D14),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
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
                                                    padding: const EdgeInsets.fromLTRB(8, 8, 17.1, 8),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                                          child: Text(
                                                            'Total Prescriptions Issued',
                                                            style: GoogleFonts.getFont(
                                                              'Inter',
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 12,
                                                              height: 1.6,
                                                              color: const Color(0xFF6B7280),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment.topLeft,
                                                          child: Container(
                                                            child: Text(
                                                              '456',
                                                              style: GoogleFonts.getFont(
                                                                'Inter',
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 16,
                                                                height: 1.5,
                                                                letterSpacing: -0.2,
                                                                color: const Color(0xFF0A0D14),
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
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
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
                                                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                                        child: Align(
                                                          alignment: Alignment.topLeft,
                                                          child: Text(
                                                            'Total Revenue',
                                                            style: GoogleFonts.getFont(
                                                              'Inter',
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 12,
                                                              height: 1.6,
                                                              color: const Color(0xFF6B7280),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Container(
                                                          child: Text(
                                                            '₦ 556,789',
                                                            style: GoogleFonts.getFont(
                                                              'Inter',
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 16,
                                                              height: 1.5,
                                                              letterSpacing: -0.2,
                                                              color: const Color(0xFF0A0D14),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
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
                                                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                                        child: Align(
                                                          alignment: Alignment.topLeft,
                                                          child: Text(
                                                            'Patient Demographic',
                                                            style: GoogleFonts.getFont(
                                                              'Inter',
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 12,
                                                              height: 1.6,
                                                              color: const Color(0xFF6B7280),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Container(
                                                          child: Text(
                                                            'M/F - 60/63',
                                                            style: GoogleFonts.getFont(
                                                              'Inter',
                                                              fontWeight: FontWeight.w500,
                                                              fontSize: 16,
                                                              height: 1.5,
                                                              letterSpacing: -0.2,
                                                              color: const Color(0xFF0A0D14),
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
                  );
  }
}

 