import 'dart:io';

class AppStrings {
  static const String appName = 'HEALTH BUBBA PARTNER';

  ///base url
  static const String _baseUrl = 'https://api.healthbubba.com/api/';
  static const String imageBaseUrl =
      "http://api.healthbubba.com//uploads/profile_pics/";

  static const String networkErrorMessage = "Network error, try again later";
  static const String errorTitle = "Error!!!";
  static const String successTitle = "Success!!!";

  static const String registerUserUrl = "${_baseUrl}doctor/register";
  static const String verifyOtpUrl = "${_baseUrl}verify-otp";
  static const String verifyOtpPasswordResetUrl =
      "${_baseUrl}verify-otp-for-password-reset";
  static const String updateNotificationSettingsUrl =
      "${_baseUrl}update_notification_setting";
      static const String getNotificationSettingsUrl =
      "${_baseUrl}notification_settings";
  static const String loginUrl = "${_baseUrl}doctor/login";
  static const String resetPasswordUrl = "${_baseUrl}reset-password";
  static const String languagesUrl = "${_baseUrl}languages";
  static const String initiatePasswordResetUrl =
      "${_baseUrl}initiate-password-reset";
  static const String qualificationsUrl = "${_baseUrl}qualifications";
  static const String selectQualificationsUrl =
      "${_baseUrl}select-qualifications";
  static const String addLanguagesUrl = "${_baseUrl}add-language";
  static const String selectedLanguagesUrl = "${_baseUrl}get-user-language";
  static const String selectedQualificationsUrl =
      "${_baseUrl}get_user_specialties";
  static const String selectedDocAvailabilityUrl =
      "${_baseUrl}doctor/availability";
  static const String addAvailabilityUrl = "${_baseUrl}doctor/availability";
  static const String updateBioUrl = "${_baseUrl}doctor/update_profile";
  static const String getUserDataUrl = "${_baseUrl}user/get";
  static const String getSpecialtiesUrl = "${_baseUrl}specialties";
  static const String uploadimageUrl = "${_baseUrl}user/update_profile_pic";
  static const String selectLanguageUrl = "${_baseUrl}select-language";
  static const String selectSpecialtiesUrl = "${_baseUrl}select_specialties";
  static const String banksUrl = "${_baseUrl}banks";
  static const String addBanksUrl = "${_baseUrl}add_banking_details";
  static const String editBanksUrl = "${_baseUrl}edit_banking_details";
  static String consultationFeeUrl({required String url}) => "$_baseUrl$url";
  static const String checkConsultationStatusUrl = "status/consultation_fee";
  static const String addConsultationUrl = "add_consultation_fee";
  static const String editConsultationUrl = "edite_consultation_fee";
  static const String availabilityStatus = "status/availability";
  static const String specialtyStatus = "status/specialty";
  static const String languageStatus = "status/language";
  static const String createNewMedicationUrl = "${_baseUrl}medication/create";
  static const String cancelAppointmentUrl = "${_baseUrl}appointments/cancel";
  static const String completeAppointmentUrl = "${_baseUrl}appointments/complete";
  static const String updatePasswordUrl = "${_baseUrl}update-password";
  static const String deactivateAccountUrl = "${_baseUrl}user/delete_account";
  static   String doctorAnalyticsUrl(String days) => "${_baseUrl}doctor/analytics?days=$days";
  static const String medicationCategoriesUrl =
      "${_baseUrl}medication/categories";
  static const String medicationsUrl = "${_baseUrl}doctor/medications";
  static const String getProfileStatusUrl =
      "${_baseUrl}status/profile_settings";
  static const String getAdministeredRouteUrl =
      "${_baseUrl}administration_routes";

      static const String getNotificationUrl =
      "${_baseUrl}notifications";
  static const String createAppointmentUrl =
      "${_baseUrl}doctor/create_appointment";
  static const String appointmentListUrl = "${_baseUrl}doctor/appointments";
  static String appointmentDetailsUrl({required String appointmentId}) =>
      "${_baseUrl}v1/get_user_appointments/$appointmentId";
  static String medicationDetailsUrl({required String medicationId}) =>
      "${_baseUrl}doctor/medications/$medicationId";

      static String patientDetailsUrl({required String patientId}) =>
      "${_baseUrl}patients/$patientId";
  static String getPatientsDetailsUrl({required String patientId}) =>
      "${_baseUrl}patients/$patientId";

  static String profileStatusUrl({
    required String url,
  }) =>
      "$_baseUrl$url";
  static String medicationSubCategoryUrl({required String categoryId}) =>
      "${_baseUrl}medication/category/$categoryId";
  static String patientsListsUrl(
          {required String page, required String limit}) =>
      "${_baseUrl}patients?page=$page&limit=$limit";
}
