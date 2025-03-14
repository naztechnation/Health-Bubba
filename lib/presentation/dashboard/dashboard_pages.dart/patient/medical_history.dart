import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/image_view.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({super.key});

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {

    String selectedFilter = "All"; // Only one selection at a time

  final List<String> filterOptions = [
    "All",
    "Appointments",
    "General Information",
    "Current Health Conditions",
    "Past Conditions",
    "Emergency Contact"
  ];

  void _selectFilter(String value) {
    setState(() {
      selectedFilter = value;
    });
    Navigator.pop(context); // Close the popup after selection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
           PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return filterOptions.map((option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Row(
                    children: [
                      Checkbox(
                        value: selectedFilter == option,
                        onChanged: (bool? checked) {
                          _selectFilter(option);
                        },
                        activeColor: AppColors.lightSecondary, // Active color
                      ),
                      Text(option,
                          style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: selectedFilter == option
                                  ?  AppColors.lightSecondary
                                  : Colors.black)),
                    ],
                  ),
                  onTap: () => _selectFilter(option), // Also allow tapping the row
                );
              }).toList();
            },
            icon: const Padding(
              padding: EdgeInsets.only(right:12.0),
              child: ImageView.svg(AppImages.filterIcon, height: 28,),
            ),
          ),
        ],
        title: const Center(
          child: Text(
            'Medical History',
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
         
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Divider(
            color: Colors.grey.shade300,
          ),
          Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x12000000),
                        offset: Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF7F7F7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Appointment',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.6,
                              color: const Color(0xFF131316),
                            ),
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
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Next Appointment',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            height: 1.4,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 15),
                                      child: Text(
                                        ' May 18, 2024, 10:00 AM  ',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          height: 1.4,
                                          color: const Color(0xFF131316),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 0,
                              color: Colors.grey.shade300,
                              thickness: 0.5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Last Appointment',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            height: 1.4,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 15),
                                      child: Text(
                                        ' May 18, 2024, 10:00 AM',
                                        maxLines: 1,
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          height: 1.4,
                                          color: const Color(0xFF131316),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 0,
                              color: Colors.grey.shade300,
                              thickness: 0.5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Upcoming Appointments',
                                          maxLines: 1,
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            height: 1.4,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 15),
                                      child: Text(
                                        '2',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          height: 1.4,
                                          color: const Color(0xFF131316),
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
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x12000000),
                        offset: Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF7F7F7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'General Information',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.6,
                              color: const Color(0xFF131316),
                            ),
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
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey.shade200,
                                            ),
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Age',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            height: 1.4,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.shade200,
                                      ),
                                    )),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          '24',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            height: 1.4,
                                            color: const Color(0xFF131316),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey.shade200,
                                            ),
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Weight',
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
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.shade200,
                                      ),
                                    )),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          '46kg',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF131316),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey.shade200,
                                            ),
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Gender',
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
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.shade200,
                                      ),
                                    )),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Male',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF131316),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey.shade200,
                                            ),
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Blood Type',
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
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.shade200,
                                      ),
                                    )),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          '0+',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF131316),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey.shade200,
                                            ),
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Genotype',
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
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.shade200,
                                      ),
                                    )),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'AA',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            height: 1.4,
                                            color: const Color(0xFF131316),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
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
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x12000000),
                        offset: Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF7F7F7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Health Conditions',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.6,
                              color: const Color(0xFF131316),
                            ),
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
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Physical Activity Level',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            height: 1.4,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 15),
                                      child: Text(
                                        'Sedentary',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          height: 1.4,
                                          color: const Color(0xFF131316),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 0,
                              color: Colors.grey.shade300,
                              thickness: 0.5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Current Medical Condition',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            height: 1.4,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 15),
                                      child: Text(
                                        'Vitamin Deficiency, Osteoporosis, Athritis',
                                        maxLines: 1,
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          height: 1.4,
                                          color: const Color(0xFF131316),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 0,
                              color: Colors.grey.shade300,
                              thickness: 0.5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Do you smoke?',
                                          maxLines: 1,
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            height: 1.4,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 15),
                                      child: Text(
                                        'YES',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          height: 1.4,
                                          color: const Color(0xFF131316),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 0,
                              color: Colors.grey.shade300,
                              thickness: 0.5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Do you drink?',
                                          maxLines: 1,
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            height: 1.4,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 15),
                                      child: Text(
                                        'YES',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          height: 1.4,
                                          color: const Color(0xFF131316),
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
                  
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
                
                    Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x12000000),
                        offset: Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF7F7F7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Past Condition',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.6,
                              color: const Color(0xFF131316),
                            ),
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
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Past condition you are treating or were treated for:',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Vitamin Deficiency, Osteoporosis, Athritis,Vitamin Deficiency, Osteoporosis, AthritisVitamin Deficiency, Osteoporosis, AthritisVitamin Deficiency, Osteoporosis, Athritis',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Last medical Checkup:',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                '3-12-1980',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Has there been any change in your general health in the past year?: ',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Whatever they have described should show up here',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Medications, non-prescription drugs or supplements: ',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Ozempic, L-theanine, Adderall',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Allergies',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Allergies 1, Allergies 2, Allergies 3',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Surgeries:',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Appendice Surgery (9-12-2008), Heart Surgery (9-12-2009)',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Do you have or have you ever had any heart or blood pressure problems?',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'NO',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Do you have or have had asthma?',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'NO',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Are there any diseases or medical p0roblems that run in your family?',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Anorexia, Obesity',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'History of convulsion or seizures:',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'NO',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Menstrual History:',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Everything about the menstrual history shows up here',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Have Children?',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'NO',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'Immunization history:',
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
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Text(
                                'None',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Divider(
                            height: 0,
                            color: Colors.grey.shade300,
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
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x12000000),
                        offset: Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF7F7F7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Emergency Contact',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.6,
                              color: const Color(0xFF131316),
                            ),
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
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Name',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            height: 1.4,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 15),
                                      child: Text(
                                        'Alexander Ogunyemi',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          height: 1.4,
                                          color: const Color(0xFF131316),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 0,
                              color: Colors.grey.shade300,
                              thickness: 0.5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Relationship',
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            height: 1.4,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 15),
                                      child: Text(
                                        'Brother',
                                        maxLines: 1,
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          height: 1.4,
                                          color: const Color(0xFF131316),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 0,
                              color: Colors.grey.shade300,
                              thickness: 0.5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Phone Number',
                                          maxLines: 1,
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            height: 1.4,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 15),
                                      child: Text(
                                        '08116848839',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          height: 1.4,
                                          color: const Color(0xFF131316),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),Divider(
                              height: 0,
                              color: Colors.grey.shade300,
                              thickness: 0.5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0, vertical: 15),
                                        child: Text(
                                          'Address',
                                          maxLines: 1,
                                          style: GoogleFonts.getFont(
                                            'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            height: 1.4,
                                            color: const Color(0xFF6B7280),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 15),
                                      child: Text(
                                        '8 Yinka Ogunfile Street, Ikeja Lagos',
                                        style: GoogleFonts.getFont(
                                          'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          height: 1.4,
                                          color: const Color(0xFF131316),
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
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          )
        ],
      )),
    );
  }
}
