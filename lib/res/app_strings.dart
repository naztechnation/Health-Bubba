import 'dart:io';


class AppStrings {
  static const String appName = 'HEALTH BUBBA';
 

   
  ///base url
  static const String _baseUrl = 'https://healthbubba.com/api/';
  static const String imageBaseUrl = "http://healthbubba.com//uploads/profile_pics/";

 

  static const String networkErrorMessage = "Network error, try again later";
  static const String errorTitle = "Error!!!";
  static const String successTitle = "Success!!!";

  
  static const String registerUserUrl = "${_baseUrl}doctor/register";
  static const String verifyOtpUrl = "${_baseUrl}verify-otp";
  static const String verifyOtpPasswordResetUrl = "${_baseUrl}verify-otp-for-password-reset";
  static const String loginUrl = "${_baseUrl}doctor/login";
  static const String resetPasswordUrl = "${_baseUrl}reset-password";
  static const String languagesUrl = "${_baseUrl}languages";
  static const String initiatePasswordResetUrl = "${_baseUrl}initiate-password-reset";
  static const String qualificationsUrl = "${_baseUrl}qualifications";
  static const String selectQualificationsUrl = "${_baseUrl}select-qualifications";
  static const String addLanguagesUrl = "${_baseUrl}add-language";
  static const String selectedLanguagesUrl = "${_baseUrl}get-user-language";
  static const String selectedQualificationsUrl = "${_baseUrl}get-user-qualification";
  static const String selectedDocAvailabilityUrl = "${_baseUrl}doctor/availability";
  static const String addAvailabilityUrl = "${_baseUrl}doctor/availability";
  static const String updateBioUrl = "${_baseUrl}doctor/update_profile";
  static const String getUserDataUrl = "${_baseUrl}user/get";
  static const String getSpecialtiesUrl = "${_baseUrl}specialties";
  static const String uploadimageUrl = "${_baseUrl}user/update_profile_pic";
  static const String selectLanguageUrl = "${_baseUrl}select-language";
  


  

    
  
}
