 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/app_images.dart';
import '../../../../widgets/choice_widget.dart';
import '../../../../widgets/choices.dart';
import '../../../../widgets/image_view.dart';



class EmptyAnalytics extends StatefulWidget {
  
  const EmptyAnalytics({super.key});

  @override
  State<EmptyAnalytics> createState() => _EmptyAnalyticsState();
}

class _EmptyAnalyticsState extends State<EmptyAnalytics> {

    
  @override
  Widget build(BuildContext context) {
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
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 16, 16, 24),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                               
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xFFE2E4E9)),
                                                    borderRadius:
                                                        BorderRadius.circular(12),
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
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                            3, 3, 3, 3),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12),
                                                        color:
                                                            const Color(0xFFFFFFFF),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0A000000),
                                                            offset: Offset(0, 1),
                                                            blurRadius: 1.5,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0D2F3037),
                                                            offset: Offset(0, 24),
                                                            blurRadius: 34,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0A222A35),
                                                            offset: Offset(0, 4),
                                                            blurRadius: 3,
                                                          ),
                                                          BoxShadow(
                                                            color:
                                                                Color(0x0D000000),
                                                            offset: Offset(0, 1),
                                                            blurRadius: 0.5,
                                                          ),
                                                        ],
                                                      ),
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        child: Container(
                                                          padding: const EdgeInsets
                                                              .fromLTRB(
                                                              10, 16, 10, 0),
                                                          child: Stack(
                                                            clipBehavior: Clip.none,
                                                            children: [
                                                              Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  const SizedBox(
                                                                      height: 80,
                                                                      width: 80,
                                                                      child: ImageView
                                                                          .svg(AppImages
                                                                              .noData)),
                                                                  Container(
                                                                    margin:
                                                                        const EdgeInsets
                                                                            .fromLTRB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            15),
                                                                    child: Text(
                                                                      'No Data Available Yet. ',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Inter',
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            14,
                                                                        height: 1.7,
                                                                        color: const Color(
                                                                            0xFF0A0D14),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Once you start using the app for consultations and prescriptions, your analytics will be displayed here',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style:
                                                                        GoogleFonts
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
                                    );
  }
}




class AnalyticsData extends StatefulWidget {
  final String totalConsultation ;
  final String totalPrescription ;
  final String totalRevenue ;
  final String patientDemography;
  final Function(String value) onTap;
  const AnalyticsData({super.key, required this.totalConsultation, required this.totalPrescription, required this.totalRevenue, required this.patientDemography, required this.onTap});

  @override
  State<AnalyticsData> createState() => _AnalyticsDataState();
}

class _AnalyticsDataState extends State<AnalyticsData> {
  String selectedDay = "1 Day";

  void _handleDaySelected(String selectedDay, BuildContext context, String day) {
   

     
    setState(() {
      selectedDay = selectedDay;
      widget.onTap(day);
      
    });
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              height: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Choices(
                  items: const ["1 Day", "7 Days", "30 Days"],
                  onSelected: (value){
                    int number = extractNumber(value);
                    _handleDaySelected(value,context, number.toString());
                  } ,
                ),
                const SizedBox(
                  height: 15,
                ),
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
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 8, 0),
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
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 8, 0, 8),
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
                                                'Total Consultations',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                  height: 1.6,
                                                  color:
                                                      const Color(0xFF6B7280),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              widget.totalConsultation,
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
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 17.1, 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 8),
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
                                            child: Text(
                                              widget.totalPrescription,
                                              style: GoogleFonts.getFont(
                                                'Inter',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                height: 1.5,
                                                letterSpacing: -0.2,
                                                color:
                                                    const Color(0xFF0A0D14),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 0, 8),
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
                                              '₦ ${widget.totalRevenue }',
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
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 0, 8),
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
                                          child: Text(
                                            'M/F - ${widget.patientDemography}',
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

  int extractNumber(String value) {
   
  final RegExp regExp = RegExp(r'\d+');
  final match = regExp.firstMatch(value);
  
  if (match != null) {
    return int.parse(match.group(0)!);
  } else {
    throw ArgumentError('No numeric value found in the string.');
  }
}
}
