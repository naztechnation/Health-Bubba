import 'dart:io';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../res/enum.dart';
 
import '../working_hours.dart';
import 'base_viewmodel.dart';

class OnboardViewModel extends BaseViewModel {
  bool _showPassword = true;
  bool _showConfirmPassword1 = true;
  bool _isScrollable = true;
  File? _imageURl;

  ImageSourceType imageType = ImageSourceType.none;

  ImagePicker picker = ImagePicker();

  String _workBio = '';

  final PageController _pageController = PageController();


String _successMessage = '';
  bool _status = false;


  List<SelectedLangs> _selectedLanguages = [];
  List<int> _selectedLanguagesId = [];

  List<String> _selectedSpecialties = [];
  List<int> _selectedSpecialtiesId = [];

  void toggleSpecialty(
      {required String specialty, required int specialtiesId}) {
    if (_selectedSpecialties.contains(specialty)) {
      _selectedSpecialties.remove(specialty);
      _selectedSpecialtiesId.remove(specialtiesId);
    } else {
      _selectedSpecialties.add(specialty);
      _selectedSpecialtiesId.add(specialtiesId);
    }
    setViewState(ViewState.success);
  }

  void addSpecialty(
      {required String specialty, required int specialtiesId}) {
     _selectedSpecialties.add(specialty);
      _selectedSpecialtiesId.add(specialtiesId);
    setViewState(ViewState.success);
  }

 

  void addLanguage(String language, int languageId) {
    if (!_selectedLanguages
        .any((selectedLang) => selectedLang.language == language)) {
      _selectedLanguages
          .add(SelectedLangs(language: language, languageId: languageId));
      _selectedLanguagesId.add(languageId);
      setViewState(ViewState.success);
    } else {}
  }

  void removeLanguage(String language, int languageId) {
    _selectedLanguages
        .removeWhere((selectedLang) => selectedLang.language == language);

    _selectedLanguagesId.remove(languageId);

    setViewState(ViewState.success);
  }

  void clearLanguage() {
    _selectedLanguages.clear();

    _selectedLanguagesId.clear();

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

  loadImage(BuildContext context, Function() onTap) async {
    await showModalBottomSheet<dynamic>(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
        builder: (BuildContext bc) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  if (_imageURl != null)
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // upload(_imageURl!);
                        onTap();
                      },
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
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
                  Row(
                    children: [
                      if (imageType == ImageSourceType.gallery &&
                          _imageURl != null)
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 69,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 2),
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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: ImageView.file(
                                  _imageURl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: -3,
                              right: -5,
                              child: GestureDetector(
                                onTap: () {
                                  _imageURl = null;
                                  setState(() {
                                    
                                  },);
                                  setViewState(ViewState.success);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    height: 17,
                                    width: 17,
                                    color: Colors.red,
                                    child: const Icon(Icons.close,
                                        size: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (imageType == ImageSourceType.gallery &&
                          _imageURl != null)
                        const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () async {
                          // Navigator.pop(context);

                          final image = await ImagePicker().pickImage(
                              source: ImageSource.gallery,
                              imageQuality: 30,
                              maxHeight: 500,
                              maxWidth: 500);
                          _imageURl = File(image!.path);
                          setState(
                            () {},
                          );
                          imageType = ImageSourceType.gallery;
                          setViewState(ViewState.success);
                        },
                        child: Container(
                            height: 69,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 2),
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
                    ],
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
                  Row(
                    children: [
                      if (imageType == ImageSourceType.camera &&
                          _imageURl != null)
                        Container(
                            height: 69,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 2),
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: ImageView.file(
                                _imageURl,
                                fit: BoxFit.cover,
                              ),
                            )),
                      if (imageType == ImageSourceType.camera &&
                          _imageURl != null)
                        const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () async {
                          final image = await ImagePicker().pickImage(
                              source: ImageSource.camera,
                              imageQuality: 30,
                              maxHeight: 500,
                              maxWidth: 500);
                          _imageURl = File(image!.path);
                          imageType = ImageSourceType.camera;
                          setState(
                            () {},
                          );
                          setViewState(ViewState.success);
                        },
                        child: Container(
                            height: 69,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 2),
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
                                height: 20,
                                width: 20,
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: ImageView.svg(
                                    AppImages.photo,
                                  ),
                                ))),
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
        });
  }

  List<DaySchedule> _schedule = [];

  void updateSchedule(List<DaySchedule> newSchedule) {
    _schedule = newSchedule;
    setViewState(ViewState.success);
  }


  Future<User?> signInWithGoogle() async {
    try {
      _status = true;
      setViewState(ViewState.success);

      final GoogleSignInAccount? googleUser = await GoogleSignIn(clientId: '1088264478524-ev6kd3n6pdvbsgfoarnve490vjpunvso.apps.googleusercontent.com').signIn();

      if (googleUser == null) {
        _successMessage = 'Authentication canceled';
        _status = false;
        setViewState(ViewState.success);

        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;

      if (authResult != null) {
        Map<String, dynamic> userInfo = {
          "email": user!.email,
          "name": user.displayName,
          "imageUrl": user.photoURL,
          "id": user.uid,
        };
      }

      _successMessage = 'Authentication successful';
      _status = false;
      setViewState(ViewState.success);

      return user;
    } catch (error) {
      if (error is FirebaseAuthException) {
        switch (error.code) {
          case 'account-exists-with-different-credential':
            _successMessage = 'Account already exists';
            _status = false;
            break;
          case 'invalid-credential':
            _successMessage = 'Invalid credential';
            _status = false;
            break;
          case 'operation-not-allowed':
            _successMessage = 'Operation not allowed';
            _status = false;
            break;
          case 'user-disabled':
            _successMessage =
                'User account has been disabled by an administrator';
            _status = false;
            break;
          case 'user-not-found':
            _successMessage = 'User not found';
            _status = false;
            break;
          case 'wrong-password':
            _successMessage = 'Wrong password';
            _status = false;
            break;
          default:
            _successMessage = "Error during authentication: ${error.message}";
            _status = false;
        }

        setViewState(ViewState.success);
      } else if (error is PlatformException &&
          error.code == 'sign_in_failed' &&
          error.details == 'ID Token expired') {
        _successMessage = 'Session expired, please sign in again';
        _status = false;
        setViewState(ViewState.success);
      } else {
        _successMessage = "Unexpected error during authentication: $error";
        _status = false;
        setViewState(ViewState.success);
      }

      return null;
    }
  }
  
  

  
  
  
  PageController get pageController => _pageController;

  bool get showPasswordStatus => _showPassword;
  bool get showConfirmPasswordStatus => _showConfirmPassword1;
  bool get scrollable => _isScrollable;
  List<String> get selectedSpecialties => _selectedSpecialties;
  List<int> get selectedSpecialtiesId => _selectedSpecialtiesId;

  List<DaySchedule> get schedule => _schedule;
  List<SelectedLangs> get selectedLanguages => _selectedLanguages;
  List<int> get selectedLanguagesId => _selectedLanguagesId;

  String get workBio => _workBio;
  File? get imageURl => _imageURl;

  String get successMessage => _successMessage;
  bool get status => _status;
}

class SelectedLangs {
  final String language;
  final int languageId;

  SelectedLangs({required this.language, required this.languageId});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelectedLangs &&
          runtimeType == other.runtimeType &&
          language == other.language;

  @override
  int get hashCode => language.hashCode;
}
