import 'package:flutter/material.dart';
 
import '../../res/enum.dart';
 
import 'base_viewmodel.dart';

class OnboardViewModel extends BaseViewModel {
 
  bool _showPassword = true;

    String _workBio = '';

  final PageController _pageController = PageController();

   
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

  PageController get pageController => _pageController;
  
  bool get showPasswordStatus => _showPassword;

  String get workBio => _workBio;

}
