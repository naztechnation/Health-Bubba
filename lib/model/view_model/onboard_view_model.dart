import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:image_picker/image_picker.dart';

import '../../res/app_colors.dart';
import '../../res/enum.dart';

import '../working_hours.dart';
import 'base_viewmodel.dart';

class OnboardViewModel extends BaseViewModel {
  bool _showPassword = true;
  bool _showConfirmPassword1 = true;
  bool _isScrollable = true;
  File? _imageURl;

  ImagePicker picker = ImagePicker();

  String _workBio = '';

  final PageController _pageController = PageController();

  List<String> _selectedLanguages = [];

  List<String> _selectedSpecialties = [];

  void toggleSpecialty(String specialty) {
    if (_selectedSpecialties.contains(specialty)) {
      _selectedSpecialties.remove(specialty);
    } else {
      _selectedSpecialties.add(specialty);
    }
    setViewState(ViewState.success);
  }

  void addLanguage(String language) {
    if (!_selectedLanguages.contains(language)) {
      _selectedLanguages.add(language);
      setViewState(ViewState.success);
    } else {
      debugPrint('$language is already in the list.');
    }
  }

  void removeLanguage(String language) {
    _selectedLanguages.remove(language);
    setViewState(ViewState.success);
  }

  void clearLanguage() {
    _selectedLanguages.clear();
    setViewState(ViewState.success);
  }

  void clearSpecialties() {
    _selectedSpecialties.clear();
    setViewState(ViewState.success);
  }

  void saveLanguages() {}

  void nextPage() {
    if (_pageController.page != 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );

      setViewState(ViewState.success);
    }
  }

  void saveBio(String bio) {
    _workBio = bio;
    setViewState(ViewState.success);
  }

  showPassword() {
    _showPassword = !_showPassword;
    setViewState(ViewState.success);
  }

  showConfirmPassword() {
    _showConfirmPassword1 = !_showConfirmPassword1;
    setViewState(ViewState.success);
  }

  void previousPage() {
    if (_pageController.page != 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setViewState(ViewState.success);
    }
  }

  void updateScroll(bool scrollable) {
    _isScrollable = scrollable;
    setViewState(ViewState.success);
  }

  loadImage(BuildContext context) async {
    await showModalBottomSheet<dynamic>(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
        builder: (BuildContext bc) {
          return Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                
                Text(
                  'Choose from Gallery',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF0A0D14),
                  ),
                ),
                const SizedBox(height: 10),

                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
            
                    final image = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 30,
                        maxHeight: 500,
                        maxWidth: 500);
                    _imageURl = File(image!.path);
                    setViewState(ViewState.success);
                  },
                  child: Container(
                      height: 69,
                      width: 80,
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
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: ImageView.svg(AppImages.gallery),
                      )),
                ),
                const SizedBox(height: 20),
                Text(
                  'Take photo',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF0A0D14),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
            
                     
                    final image = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                        imageQuality: 30,
                        maxHeight: 500,
                        maxWidth: 500);
                    _imageURl = File(image!.path);
                    setViewState(ViewState.success);
                  },
                  child: Container(
                      height: 69,
                      width: 80,
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
                      child: const SizedBox(
                         height: 20, width: 20,
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: ImageView.svg(AppImages.photo,),
                        ))),
                ),
                 
              ],
            ),
          );
        });
  }

  List<DaySchedule> _schedule = [];

  void updateSchedule(List<DaySchedule> newSchedule) {
    _schedule = newSchedule;
    setViewState(ViewState.success);
  }

  PageController get pageController => _pageController;

  bool get showPasswordStatus => _showPassword;
  bool get showConfirmPasswordStatus => _showConfirmPassword1;
  bool get scrollable => _isScrollable;
  List<String> get selectedSpecialties => _selectedSpecialties;

  List<DaySchedule> get schedule => _schedule;
  List<String> get selectedLanguages => _selectedLanguages;

  String get workBio => _workBio;
  File? get imageURl => _imageURl;
}
