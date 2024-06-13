import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:healthbubba/widgets/modals.dart';

import '../../res/app_colors.dart';
import '../../widgets/button_view.dart';
import '../../widgets/checkbox.dart';
import '../../widgets/text_edit_view.dart';
import 'work_information.dart';

class ProfileSetup extends StatefulWidget {
  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final _emailController = TextEditingController();

  final _titleController = TextEditingController();
  final _qualificationController = TextEditingController();

  bool isAgreed = false;

  List<String> titles = [
    "Dr.",
    "Mr.",
    "Ms.",
    "Mrs.",
    "Prof.",
    "Fr. (Father)",
    "Sr. (Sister)"
  ];

  List<String> qualifications = [
    "MD",
    "DO",
    "DDS",
    "DMD",
    "MS",
    "PhD",
    "MPH",
    "MHA"
  ];

  Set<String> _selectedItems = {};

  void _onCheckboxChanged(bool isChecked, String item) {
    setState(() {
      if (isChecked) {
        _selectedItems.add(item);
      } else {
        _selectedItems.remove(item);
      }
      _updateTextField();
    });
  }

  void _updateTextField() {
    _qualificationController.text = _selectedItems.join(', ');
  }

  @override
  void initState() {
    super.initState();
    _updateTextField();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.07,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 12, 8, 11),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 1.4, 8),
                      child: Text(
                        'Setup your Profile',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 1.5,
                          color: const Color(0xFF0A0D14),
                        ),
                      ),
                    ),
                    Text(
                      'Provide all the essential details below',
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
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 63),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFCFCFC),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Title',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _titleController,
                                borderColor: Colors.grey.shade200,
                                borderWidth: 0.5,
                                hintText: 'Select',
                                readOnly: true,
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.all(17.0),
                                  child: ImageView.svg(
                                    AppImages.dropDown,
                                    scale: 0.8,
                                  ),
                                ),
                                onTap: () {
                                  Modals.showDialogModal(context,
                                      page: titleModalContent(context));
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'First name',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _emailController,
                                borderColor: Colors.grey.shade200,
                                borderWidth: 0.5,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Last name',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _emailController,
                                borderColor: Colors.grey.shade200,
                                borderWidth: 0.5,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Medical Qualification',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _qualificationController,
                                borderColor: Colors.grey.shade200,
                                borderWidth: 0.5,
                                hintText: 'MBBS, MCPS, MD',
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.all(17.0),
                                  child: ImageView.svg(
                                    AppImages.dropDown,
                                    scale: 0.8,
                                  ),
                                ),
                                 readOnly: true,
                                 onTap: () {
                                  Modals.showDialogModal(context,
                                      page: qualificationModalContent(context));
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Medical License Number',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _emailController,
                                borderColor: Colors.grey.shade200,
                                keyboardType: TextInputType.number,
                                borderWidth: 0.5,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Years of Experience',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _emailController,
                                borderColor: Colors.grey.shade200,
                                borderWidth: 0.5,
                                hintText: 'Select',
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.all(17.0),
                                  child: ImageView.svg(
                                    AppImages.dropDown,
                                    scale: 0.8,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Clinic/ Hospital Affiliation',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _emailController,
                                borderColor: Colors.grey.shade200,
                                borderWidth: 0.5,
                                hintText: '',
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Phone Number',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _emailController,
                                borderColor: Colors.grey.shade200,
                                keyboardType: TextInputType.number,
                                borderWidth: 0.5,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Location (Optional)',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextEditView(
                                controller: _emailController,
                                borderColor: Colors.grey.shade200,
                                borderWidth: 0.5,
                                hintText: 'Ikeja, Lagos, Nigeria',
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(7.0),
                                  child: ImageView.svg(
                                    AppImages.location,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                            CustomCheckbox(isChecked: isAgreed,
                            onChanged: (value) {
                              isAgreed = value;
                            },

                            ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: 'I agree to HealthBubba’s ',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 1.4,
                                  color: const Color(0xFF131316),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Terms and Conditions',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 1.3,
                                      color: const Color(0xFF40B93C),
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' and ',
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      height: 1.3,
                                      color: const Color(0xFF40B93C),
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
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: ButtonView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  onPressed: () {
                    AppNavigator.pushAndStackPage(context,
                        page: const WorkInformation());
                  },
                  borderRadius: 100,
                  color: AppColors.lightSecondary,
                  child: RichText(
                    text: TextSpan(
                      text: 'Next - ',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.6,
                        color: const Color(0xFFFFFFFF),
                      ),
                      children: [
                        TextSpan(
                          text: 'Work information',
                          style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1.3,
                            color: const Color(0xCCFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  titleModalContent(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.6,
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
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: titles.length,
        separatorBuilder: (context, index) => (index == 0)
            ? Divider(
                color: Colors.grey.shade300,
                height: 0,
              )
            : const SizedBox.shrink(),
        itemBuilder: (context, index) {
          String title = titles[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                _titleController.text = title;
              });

              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all((index == 0) ? 8 : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: (index == 0) ? const Color(0xFFF9FAFB) : Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13.0, horizontal: 15),
                child: Text(
                  title,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    height: 1.5,  
                    color: const Color(0xFF030712),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  qualificationModalContent(BuildContext context) {
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
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: qualifications.length,
        itemBuilder: (context, index) {
          String qualification = qualifications[index];
           bool isChecked = _selectedItems.contains(qualification);
          return GestureDetector(
            onTap: () {
              setState(() {
               
              });
              Navigator.pop(context);

            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 23),
              child: Row(
                children: [
                  CustomCheckbox(
                    bgColor: const Color(0xFF6667FA),
                    
                    isChecked: isChecked,
                      onChanged: (checked) {
                        _onCheckboxChanged(checked, qualification);
                      },),
                  const SizedBox(width: 13,),
                  Text(
                    qualification,
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      height: 1.5,  
                      color: const Color(0xFF030712),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
