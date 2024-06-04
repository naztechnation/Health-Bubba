import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
 
import '../../res/app_colors.dart';
import '../../res/enum.dart';
 
import '../workinng_hours.dart';
import 'base_viewmodel.dart';

class OnboardViewModel extends BaseViewModel {
 
  bool _showPassword = true;
  bool _isScrollable = true;
  File? _imageURl;

  ImagePicker picker = ImagePicker();



  String _workBio = '';

  final PageController _pageController = PageController();

   List<String> _selectedLanguages = [];


  void addLanguage(String language) {
    if (!_selectedLanguages.contains(language)) {
      _selectedLanguages.add(language);
      notifyListeners();
    } else {
      debugPrint('$language is already in the list.');
    }
  }

  void removeLanguage(String language) {
    _selectedLanguages.remove(language);
    notifyListeners();
  }

  void saveLanguages() {
    print('Selected Languages: $_selectedLanguages');
  }


   
 void nextPage() {
     
    if (_pageController.page != 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );

    setViewState(ViewState.success);

    }
  }

  void saveBio(String bio){
    
_workBio = bio;
    setViewState(ViewState.success);

  }

   showPassword() {
    _showPassword = !_showPassword;
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

  void updateScroll(bool scrollable){

    _isScrollable = scrollable;
    setViewState(ViewState.success);

  }

  loadImage(BuildContext context) async {
    await showModalBottomSheet<dynamic>(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
        builder: (BuildContext bc) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(
                    left: 30.0, right: 8.0, top: 8.0, bottom: 8.0),
                child: Text('Select the images source',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.lightSecondary,
                        fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo_camera,
                  size: 35.0,
                  color: AppColors.lightSecondary,
                ),
                title: const Text('Camera'),
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
              ),
              ListTile(
                leading: const Icon(
                  Icons.photo,
                  size: 35.0,
                  color: AppColors.lightSecondary,
                ),
                title: const Text('Gallery'),
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
              ),
            ],
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
  bool get scrollable => _isScrollable;

  List<DaySchedule> get schedule => _schedule;
  List<String> get selectedLanguages => _selectedLanguages;



  String get workBio => _workBio;
  File? get imageURl => _imageURl;


}
