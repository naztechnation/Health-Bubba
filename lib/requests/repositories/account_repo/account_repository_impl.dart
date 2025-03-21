import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:healthbubba/model/auth_model/account_details.dart';
import 'package:healthbubba/model/auth_model/get_account.dart';
import 'package:healthbubba/model/auth_model/verify_otp.dart';
import 'package:healthbubba/model/user/bank_details.dart';
import 'package:healthbubba/model/user/banks.dart';
import 'package:healthbubba/model/user/get_specialties.dart';
import 'package:healthbubba/model/user/languages.dart';
import 'package:healthbubba/model/user/qualification.dart';
import 'package:healthbubba/model/user/select_language.dart';
import 'package:healthbubba/model/user/select_qualifications.dart';
import 'package:healthbubba/model/user/selected_docs_availability.dart';
import 'package:healthbubba/model/user/selected_languages.dart';
 
import 'package:healthbubba/model/user/upload_image.dart';
import 'package:healthbubba/model/user/upload_image_file.dart';
import 'package:healthbubba/model/user/user_data.dart';
import 'package:healthbubba/model/working_hours.dart';
  

import '../../../handlers/secure_handler.dart';
import '../../../model/auth_model/login.dart';
import '../../../model/auth_model/register.dart';
import '../../../model/google_places.dart';
import '../../../model/user/login_with_google.dart';
import '../../../model/user/reg_with_google.dart';
import '../../../model/user/select_specialties.dart';
import '../../../model/user/selected_user_specialties.dart';
import '../../../model/user/update_user.dart';
import '../../../res/app_strings.dart';

import '../../setup/requests.dart';
import 'account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  @override
  Future<RegisterUser> registerUser({
    required String email,
    required String password,
    required String phone,
    required String referral,
     required String fcmToken
  }) async {
     debugPrint("This is my token${fcmToken}");
    

    final map = await Requests().post(AppStrings.registerUserUrl, body: {
      "email": email,
      "password": password,
      "referral_code": referral,
      "phone": phone,
      "fcm_token": fcmToken,
    });
    return RegisterUser.fromJson(map);
  }

  @override
  Future<VerifyOtp> verifyOtp(
      {required String email, required String otp, required String url}) async {
    final map = await Requests().post(url, body: {
      "email": email,
      "otp": otp,
      "url": url,
    });
    return VerifyOtp.fromJson(map);
  }

  @override
  Future<LoginData> loginUser(
      {required String email, required String password, required String fcmToken}) async {
     
     debugPrint("This is my token${fcmToken}");
        
    final map = await Requests().post(AppStrings.loginUrl, body: {
      "email": email,
      "password": password,
      "fcm_token": fcmToken,
    });
    return LoginData.fromJson(map);
  }

  @override
  Future<RegisterUser> initiateResetPassword({required String email}) async {
    final map =
        await Requests().post(AppStrings.initiatePasswordResetUrl, body: {
      "email": email,
    });
    return RegisterUser.fromJson(map);
  }

  @override
  Future<RegisterUser> resetPassword(
      {required String email,
      required String otp,
      required String newPassword}) async {
    final map = await Requests().post(AppStrings.resetPasswordUrl, body: {
      "email": email,
      "otp": otp,
      "newPassword": newPassword,
    });
    return RegisterUser.fromJson(map);
  }

  @override
  Future<Languages> getLanguages() async {
    final map = await Requests().get(
      AppStrings.languagesUrl,
    );
    return Languages.fromJson(map);
  }

  @override
  Future<Qualification> getQualifications() async {
    final map = await Requests().get(
      AppStrings.qualificationsUrl,
    );
    return Qualification.fromJson(map);
  }

  @override
  Future<SelectLanguage> addLanguage({required String languages}) async {
    final map = await Requests().post(
      AppStrings.addLanguagesUrl,
      body: {
        "language_name": languages,
      },
    );
    return SelectLanguage.fromJson(map);
  }

  @override
  Future<SelectedLanguages> selectedLanguages() async {
    final map = await Requests().get(
      AppStrings.selectedLanguagesUrl,
    );
    return SelectedLanguages.fromJson(map);
  }

  @override
  Future<SelectedUserSpecialties> getSelectedQualifications() async {
    final map = await Requests().get(
      AppStrings.selectedQualificationsUrl,
    );
    return SelectedUserSpecialties.fromJson(map);
  }

  @override
  Future<GetSelectedAvailability> getSelectedAvailability() async {
    final map = await Requests().get(
      AppStrings.selectedDocAvailabilityUrl,
    );
    return GetSelectedAvailability.fromJson(map);
  }

  @override
  Future<LoginData> updateAvalaibility(
      {required List<DaySchedule> schedule,
      required BuildContext context}) async {
    var body = {};
    final accessToken = await StorageHandler.getUserToken() ?? '';

    var availabilityList = [];

    for (var scheduleData in schedule) {
      for (var timeSlots in scheduleData.timeSlots) {
        
          
        TimeOfDay start = timeSlots['start']!;
        TimeOfDay end = timeSlots['end']!;

        availabilityList.add({
          "day_of_week": scheduleData.day,
          "is_available": (scheduleData.isOpen) ? 1: 0,
         if(start != null) "start_time": start.format(context),
         if(end != null) "end_time": end.format(context),
        });
      }
    }

    body["availabilities"] = availabilityList;

    
    final map = await Requests()
        .post(AppStrings.addAvailabilityUrl, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $accessToken",
    });
    return LoginData.fromJson(map);
  }

  @override
  Future<UpdateUser> updateBio({required String bio}) async {
    final map = await Requests().post(
      AppStrings.updateBioUrl,
      body: {
        "bio": bio,
      },
    );
    return UpdateUser.fromJson(map);
  }

  @override
  Future<UpdateUser> updateUserData({
    required String title,
    required String firstname,
    required String lastname,
    required String licenceNumber,
    required int experience,
    required String hospitalAffliated,
    required String phone,
    required String doctorLicenceDoc,
    String? otherDocs,
    String? location,
  }) async {
    final map = await Requests().post(
      AppStrings.updateBioUrl,
      body: {
        "years_of_experience": experience.toString(),
        "title": title,
        "first_name": firstname,
        "last_name": lastname,
        // "phone": phone,
        if (location != null) "address": location,
        "licence_number": licenceNumber,
        "clinic_affiliation": hospitalAffliated,
        "doctor_license": doctorLicenceDoc,
       if(otherDocs !=  null || otherDocs != "") "other_document": otherDocs,
      },
    );
    return UpdateUser.fromJson(map);
  }

  @override
  Future<UserData> getUserInfo() async {
    final map = await Requests().get(
      AppStrings.getUserDataUrl,
    );
    return UserData.fromJson(map);
  }

  @override
  Future<GetSpecialties> getSpecialties() async {
    final map = await Requests().get(
      AppStrings.getSpecialtiesUrl,
    );
    return GetSpecialties.fromJson(map);
  }

  @override
  Future<UploadImage> uploadImage({required File image}) async {
    List<File> profilePic = [];
    profilePic.add(image);

    final map = await Requests().post(
      AppStrings.uploadimageUrl,
      files: {"picture": profilePic},
    );

    return UploadImage.fromJson(map);
  }

  @override
  Future<SelectedLanguages> chooseLanguages(
      {required List<int> languageId}) async {
    final accessToken = await StorageHandler.getUserToken() ?? '';

    final body = jsonEncode({'language_id': languageId});

    final map = await Requests()
        .post(AppStrings.selectLanguageUrl, body: body, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $accessToken",
    });
    return SelectedLanguages.fromJson(map);
  }

  @override
  Future<SelectSpecialties> selectSpecialties(
      {required List<int> specialties}) async {
    final accessToken = await StorageHandler.getUserToken() ?? '';

    final body = jsonEncode({"specialty_id": specialties});

    final map = await Requests()
        .post(AppStrings.selectSpecialtiesUrl, body: body, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $accessToken",
    });
    return SelectSpecialties.fromJson(map);
  }

  @override
  Future<SelectQualification> selectQualifications(
      {required List<dynamic> qualificationIds}) async {
    final accessToken = await StorageHandler.getUserToken() ?? '';

    final body = jsonEncode({'qualification_id': qualificationIds});

    final map = await Requests()
        .post(AppStrings.selectQualificationsUrl, body: body, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $accessToken",
    });
    return SelectQualification.fromJson(map);
  }

  @override
  Future<Banks> getBanks() async {
    final map = await Requests().get(
      AppStrings.banksUrl,
    );
    return Banks.fromJson(map);
  }

  @override
  Future<BankDetails> addBankDetails(
      {required String bankCode,
      required String accountNumber,
      required String accountName,
      required String url}) async {
    final map = await Requests().post(
      url,
      body: {
        "bank_id": bankCode,
        "account_number": accountNumber,
        "account_name": accountName,
      },
    );
    return BankDetails.fromJson(map);
  }

  @override
  Future<LoginData> changePassword(
      {required String oldPassword, required String newPassword}) async {
    final map = await Requests().post(
      AppStrings.updatePasswordUrl,
      body: {
        "old_password": oldPassword,
        "new_password": newPassword,
      },
    );
    return LoginData.fromJson(map);
  }

  @override
  Future<RegWithGoogle> regWithGoogleA(
      {required String dob,
      required String sex,
      required String firstname,
      required String email,
      required String fcmToken}) async {
   
    final map = await Requests().post(AppStrings.googleRegUrl, body: {
      'email': email,
      'firstname': firstname,
      'sex': sex,
      'dob': dob,
      'fcm_token': fcmToken,
    });
    return RegWithGoogle.fromJson(map);
  }

  @override
  Future<LoginWithGoogle> loginWithGoogleA({required String email,
     required String fcmToken
  
  }) async {
     

    final map = await Requests().post(AppStrings.googleLoginUrl, body: {
      'email': email,
      'fcm_token': fcmToken,
    });
    return LoginWithGoogle.fromJson(map);
  }

  @override
  Future<LoginWithGoogle> loginWithAppleA(
      {required String email, required String appleId, 
      
     required String fcmToken
      
      }) async {
     

    final map = await Requests().post(AppStrings.appleLoginUrl,
     body: {
      'email': email,
      'apple_id': appleId,
      'fcm_token': fcmToken,
    });
    return LoginWithGoogle.fromJson(map);
  }

  @override
  Future<RegWithGoogle> regWithAppleA(
      {required String dob,
      required String sex,
      required String firstname,
      required String email,
      required String appleId,
      required String fcmToken}) async {
    

    final map = await Requests().post(AppStrings.appleRegUrl, body: {
      if(email.isNotEmpty)'email': email,
      'firstname': firstname,
      'apple_id': appleId,
      'sex': sex,
      'dob': dob,
      'fcm_token': fcmToken,
    },
    
    );
    return RegWithGoogle.fromJson(map);
  }
  
  @override
  Future<VerifyOtp> resendOtp({required String email}) async {
    final map = await Requests().post(
      AppStrings.resendOtpUrl,
      body: {
        "email": email,
        
      },
    );
    return VerifyOtp.fromJson(map);
  }
  
  @override
  Future<GooglePlaces> googlePlacesSearch({required String input}) async {
    final map = await Requests().get(
      AppStrings.googlePlaceApi(input: input),
      
    );
    return GooglePlaces.fromJson(map);
  }

  @override
  Future<UploadDoc> uploadDoc({required File doc}) async {
    List<File> docs = [];
    docs.add(doc);

    final map = await Requests().post(
      AppStrings.uploadDocUrl,
      files: {"docs": docs},
    );

    return UploadDoc.fromJson(map);
  }

  @override
  Future<GetBankDetails> getBankDetails()  async {
    final map = await Requests().get(
      AppStrings.getBankDetailsUrl,
      
    );
    return GetBankDetails.fromJson(map);
  }

  @override
  Future<GetAccountName> getAccountName({
    required String bankCode,
    required String accountNumber,
    
  }) async {
     

    final map = await Requests().post(AppStrings.getAccountNameUrl,
     body: {
      'account_number': accountNumber,
      'bank_code': bankCode,
       
    });
    return GetAccountName.fromJson(map);
  }

}
