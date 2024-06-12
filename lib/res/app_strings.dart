import 'dart:io';


class AppStrings {
  static const String appName = 'HEALTH BUBBA';
 

   
  ///base url

  static const String _baseUrl = 'https://healthbubba.com/api/';

 

  static const String networkErrorMessage = "Network error, try again later";
  static const String errorTitle = "Error!!!";
  static const String successTitle = "Success!!!";
  static const String registerUserUrl = "${_baseUrl}doctor/register";
  static const String verifyOtprUrl = "${_baseUrl}verify-otp";

  

    
  
}
