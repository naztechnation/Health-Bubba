import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../model/view_model/book_appointment_viewmodel.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/button_view.dart';
import '../../../../widgets/image_view.dart';
import '../widgets/calender_widget.dart';

class BookAppointentPage extends StatelessWidget {
  final bool isReBookAppointment;

  const BookAppointentPage({super.key, required this.isReBookAppointment});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            isReBookAppointment
                ? 'Reschedule Appointment'
                : 'Book a Time & Date',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 134),
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Select Date',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        height: 1.7,
                                        color: const Color(0xFF0A0D14),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final DateTime? picked =
                                            await showMonthYearPickerDialog(
                                          context: context,
                                          initialDate: DateTime.now(),
                                        );
                                        if (picked != null) {
                                          Provider.of<BookAppointmentViewModel>(
                                                  context,
                                                  listen: false)
                                              .setSelectedDate(picked);
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFFE8E8E8)),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: const Color(0xFFFFFFFF),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0xFFF2F2F2),
                                              offset: Offset(0, 1),
                                              blurRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 3, 13.2, 3),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 8.7, 0),
                                                child: Consumer<
                                                        BookAppointmentViewModel>(
                                                    builder: (context,
                                                        calendarProvider,
                                                        child) {
                                                  return Text(
                                                    '${calendarProvider.formattedMonth}, ${calendarProvider.formattedYear}',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                      color: const Color(
                                                          0xFF111827),
                                                    ),
                                                  );
                                                }),
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 13,
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
                              const SizedBox(
                                height: 20,
                              ),
                              CalendarScreen(),
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
                          padding: const EdgeInsets.fromLTRB(16, 16, 25.8, 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Select Time Slot',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      height: 1.7,
                                      color: const Color(0xFF0A0D14),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 7.5, 4),
                                          child: Text(
                                            '5:00 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 7.5, 4),
                                          child: Text(
                                            '5:30 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 8.2, 4),
                                          child: Text(
                                            '6:00 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 8.2, 4),
                                          child: Text(
                                            '6:00 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 7.5, 4),
                                          child: Text(
                                            '5:00 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 7.5, 4),
                                          child: Text(
                                            '5:30 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 8.2, 4),
                                          child: Text(
                                            '6:00 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 8.2, 4),
                                          child: Text(
                                            '6:00 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                   mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 7.5, 4),
                                          child: Text(
                                            '5:00 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 7.5, 4),
                                          child: Text(
                                            '5:30 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 8.2, 4),
                                          child: Text(
                                            '6:00 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 8.2, 4),
                                          child: Text(
                                            '6:00 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 7.5, 4),
                                          child: Text(
                                            '5:00 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 7.5, 4),
                                          child: Text(
                                            '5:30 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 8.2, 4),
                                          child: Text(
                                            '6:00 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9999),
                                          color: const Color(0xFFFAFAFB),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(0x1A2F3037),
                                              offset: Offset(0, 0),
                                              blurRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 4, 8.2, 4),
                                          child: Text(
                                            '6:00 PM',
                                            style: GoogleFonts.getFont(
                                              'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              height: 1.4,
                                              color: const Color(0xFF5E5F6E),
                                            ),
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
                  // AppNavigator.pushAndStackPage(context, page: BookAppointentPage());
                },
                borderRadius: 100,
                color: AppColors.lightSecondary,
                child: Text(
                  (!isReBookAppointment)
                      ? 'Book Appointment'
                      : 'Confrim Rescheduling',
                  style: const TextStyle(
                      color: AppColors.lightPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> showMonthYearPickerDialog({
    required BuildContext context,
    required DateTime initialDate,
  }) {
    int selectedYear = initialDate.year;
    int selectedMonth = initialDate.month;

    return showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              'Select Month and Year',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(),
              DropdownButton<int>(
                value: selectedYear,
                items: List.generate(
                        100, (index) => DateTime.now().year - 50 + index)
                    .map((year) => DropdownMenuItem(
                          value: year,
                          child: Text('$year'),
                        ))
                    .toList(),
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    selectedYear = newValue;
                  }
                },
              ),
              DropdownButton<int>(
                value: selectedMonth,
                items: <String>[
                  'Jan',
                  'Feb',
                  'Mar',
                  'Apr',
                  'May',
                  'Jun',
                  'Jul',
                  'Aug',
                  'Sep',
                  'Oct',
                  'Nov',
                  'Dec'
                ]
                    .map((month) => DropdownMenuItem(
                          value: <String>[
                                'Jan',
                                'Feb',
                                'Mar',
                                'Apr',
                                'May',
                                'Jun',
                                'Jul',
                                'Aug',
                                'Sep',
                                'Oct',
                                'Nov',
                                'Dec'
                              ].indexOf(month) +
                              1,
                          child: Text(month),
                        ))
                    .toList(),
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    selectedMonth = newValue;
                  }
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(DateTime(selectedYear, selectedMonth));
              },
              child: const Text(
                'OK',
                style: TextStyle(color: AppColors.lightSecondary),
              ),
            ),
          ],
        );
      },
    );
  }
}
