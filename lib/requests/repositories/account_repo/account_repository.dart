import 'dart:io';

import 'package:flutter/material.dart';
import 'package:healthbubba/model/auth_model/verify_otp.dart';
import 'package:healthbubba/model/user/banks.dart';
import 'package:healthbubba/model/user/languages.dart';
import 'package:healthbubba/model/user/selected_docs_availability.dart';
import 'package:healthbubba/model/user/upload_image.dart';
import 'package:healthbubba/model/user/user_data.dart';

import '../../../model/auth_model/login.dart';
import '../../../model/auth_model/register.dart';
import '../../../model/user/bank_details.dart';
import '../../../model/user/get_specialties.dart';
import '../../../model/user/qualification.dart';
import '../../../model/user/select_language.dart';
import '../../../model/user/select_qualifications.dart';
import '../../../model/user/select_specialties.dart';
import '../../../model/user/selected_languages.dart';
import '../../../model/user/selected_qualifications.dart';
import '../../../model/user/update_user.dart';
import '../../../model/working_hours.dart';

abstract class AccountRepository {
  Future<RegisterUser> registerUser({
    required String email,
    required String password,
  });

  Future<RegisterUser> initiateResetPassword({
    required String email,
  });

  Future<VerifyOtp> verifyOtp({
    required String email,
    required String otp,
    required String url,
  });

  Future<LoginData> loginUser({
    required String email,
    required String password,
  });

  Future<RegisterUser> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  });

  Future<LoginData> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  Future<Languages> getLanguages();
  Future<SelectedLanguages> selectedLanguages();
  Future<SelectedLanguages> chooseLanguages({required List<int> languageId});
  Future<Qualification> getQualifications();
  Future<SelectQualification> selectQualifications(
      {required List<int> qualificationIds});
  Future<LoginData> updateAvalaibility(
      {required List<DaySchedule> schedule, required BuildContext context});
  Future<GetSelectedQualifications> getSelectedQualifications();
  Future<GetSelectedAvailability> getSelectedAvailability();
  Future<SelectSpecialties> selectSpecialties(
      {required List<int> specialties});

  Future<SelectLanguage> addLanguage({required String languages});

  Future<UpdateUser> updateBio({required String bio});

  Future<UserData> getUserInfo();

  Future<GetSpecialties> getSpecialties();

  Future<Banks> getBanks();

  Future<BankDetails> addBankDetails({
    required String bankCode,
    required String accountNumber,
    required String accountName,
    required String url,
  });

  Future<UploadImage> uploadImage({required File image});

  Future<UpdateUser> updateUserData({
    required String title,
    required String firstname,
    required String lastname,
    required String licenceNumber,
    required int experience,
    required String hospitalAffliated,
    required String phone,
    String? location,
  });
}
