import 'dart:convert';
import 'dart:io';

import 'package:healthbubba/model/auth_model/verify_otp.dart';
import 'package:healthbubba/model/user/languages.dart';
import 'package:healthbubba/model/user/qualification.dart';
import 'package:healthbubba/model/user/select_language.dart';
import 'package:healthbubba/model/user/select_qualifications.dart';
import 'package:healthbubba/model/user/selected_docs_availability.dart';
import 'package:healthbubba/model/user/selected_languages.dart';
import 'package:healthbubba/model/user/selected_qualifications.dart';

import '../../../model/auth_model/login.dart';
import '../../../model/auth_model/register.dart';
import '../../../res/app_strings.dart';

import '../../setup/requests.dart';
import 'account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  @override
  Future<RegisterUser> registerUser({
    required String email,
    required String password,
  }) async {
    final map = await Requests().post(AppStrings.registerUserUrl, body: {
      "email": email,
      "password": password,
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
      {required String email, required String password}) async {
    final map = await Requests().post(AppStrings.loginUrl, body: {
      "email": email,
      "password": password,
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
  Future<SelectQualification> selectQualifications(
      {required List<String> qualificationsId}) async {
     const String key = "qualification_id";
     Map<String, dynamic> body = {
    for (var i = 0; i < qualificationsId.length; i++) key: qualificationsId[i]
  };

  print(body.toString());
  String requestBody = json.encode(body);
    final map = await Requests().post(
      AppStrings.selectQualificationsUrl,
      body: requestBody,
       
    );
    return SelectQualification.fromJson(map);
  }

  @override
  Future<SelectLanguage> addLanguage({required List<String> languages})  async {
     const String key = "language_name";
     Map<String, dynamic> body = {
    for (var i = 0; i < languages.length; i++) key: languages[i]
  };

  
    final map = await Requests().post(
      AppStrings.addLanguagesUrl,
      body: {
        "language_name": languages[0],
         
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
  Future<GetSelectedQualificationsData> getSelectedQualifications() async {
    final map = await Requests().get(
      AppStrings.selectedQualificationsUrl,
    );
    return GetSelectedQualificationsData.fromJson(map);

  }

  @override
  Future<GetSelectedAvailability> getSelectedAvailability() async {
    final map = await Requests().get(
      AppStrings.selectedDocAvailabilityUrl,
    );
    return GetSelectedAvailability.fromJson(map);

  }

}
