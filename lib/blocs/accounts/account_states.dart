import 'package:equatable/equatable.dart';
import 'package:healthbubba/model/auth_model/login.dart';
import 'package:healthbubba/model/auth_model/verify_otp.dart';
import 'package:healthbubba/model/user/bank_details.dart';
import 'package:healthbubba/model/user/get_specialties.dart';
import 'package:healthbubba/model/user/languages.dart';
import 'package:healthbubba/model/user/qualification.dart';
import 'package:healthbubba/model/user/select_qualifications.dart';
import 'package:healthbubba/model/user/user_data.dart';

import '../../model/auth_model/register.dart';
import '../../model/user/banks.dart';
import '../../model/user/login_with_google.dart';
import '../../model/user/reg_with_google.dart';
import '../../model/user/select_language.dart';
import '../../model/user/select_specialties.dart';
import '../../model/user/selected_docs_availability.dart';
import '../../model/user/selected_languages.dart';
import '../../model/user/selected_qualifications.dart';
import '../../model/user/selected_user_specialties.dart';
import '../../model/user/update_user.dart';
import '../../model/user/upload_image.dart';
 
 

abstract class AccountStates extends Equatable {
  const AccountStates();
}

class InitialState extends AccountStates {
  const InitialState();
  @override
  List<Object> get props => [];
}

class AccountLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class AccountProcessing extends AccountStates {
  @override
  List<Object> get props => [];
}

class LoginLoaded extends AccountStates {
  final LoginData loginData;
  const LoginLoaded(this.loginData);
  @override
  List<Object> get props => [loginData];
}

class ChangePasswordProcessing extends AccountStates {
  @override
  List<Object> get props => [];
}

class ChangePasswordLoaded extends AccountStates {
  final LoginData changePassword;
  const ChangePasswordLoaded(this.changePassword);
  @override
  List<Object> get props => [changePassword];
}

class ResetPasswordLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class ResetPasswordLoaded extends AccountStates {
  final RegisterUser userData;
  const ResetPasswordLoaded(this.userData);
  @override
  List<Object> get props => [userData];
}

class VerifyOtpLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class VerifyOtpLoaded extends AccountStates {
  final VerifyOtp verifyOtp;
  const VerifyOtpLoaded(this.verifyOtp);
  @override
  List<Object> get props => [verifyOtp];
}

class LanguagesLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class LanguagesLoaded extends AccountStates {
  final Languages languages;
  const LanguagesLoaded(this.languages);
  @override
  List<Object> get props => [languages];
}

class QualificationsLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class QualificationsLoaded extends AccountStates {
  final Qualification qualification;
  const QualificationsLoaded(this.qualification);
  @override
  List<Object> get props => [qualification];
}

class SelectSpecialtiesLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class SelectSpecialtiesLoaded extends AccountStates {
  final SelectSpecialties selectSpecialties;
  const SelectSpecialtiesLoaded(this.selectSpecialties);
  @override
  List<Object> get props => [selectSpecialties];
}

class SelectQualificationsLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class SelectQualificationsLoaded extends AccountStates {
  final SelectQualification qualification;
  const SelectQualificationsLoaded(this.qualification);
  @override
  List<Object> get props => [qualification];
}

class SelectLanguageLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class SelectLanguagesLoaded extends AccountStates {
  final SelectLanguage language;
  const SelectLanguagesLoaded(this.language);
  @override
  List<Object> get props => [language];
}

class SelectedLanguageLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class SelectedLanguagesLoaded extends AccountStates {
  final SelectedLanguages language;
  const SelectedLanguagesLoaded(this.language);
  @override
  List<Object> get props => [language];
}

class ChooseLanguageLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class ChooseLanguagesLoaded extends AccountStates {
  final SelectedLanguages language;
  const ChooseLanguagesLoaded(this.language);
  @override
  List<Object> get props => [language];
}
class SelectedQualificationsLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class SelectedQualificationsLoaded extends AccountStates {
  final SelectedUserSpecialties qualificationsData;
  const SelectedQualificationsLoaded(this.qualificationsData);
  @override
  List<Object> get props => [qualificationsData];
}

class SelectedAvailabilitysLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class SelectedAvailabilitysLoaded extends AccountStates {
  final GetSelectedAvailability availability;
  const SelectedAvailabilitysLoaded(this.availability);
  @override
  List<Object> get props => [availability];
}

class UpdateAvailabilitysLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class UpdateAvailabilitysLoaded extends AccountStates {
  final LoginData availability;
  const UpdateAvailabilitysLoaded(this.availability);
  @override
  List<Object> get props => [availability];
}

class UpdateBioLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class UpdateBioLoaded extends AccountStates {
  final UpdateUser bio;
  const UpdateBioLoaded(this.bio);
  @override
  List<Object> get props => [bio];
}

class UpdateUserLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class UpdateUserLoaded extends AccountStates {
  final UpdateUser updateUser;
  const UpdateUserLoaded(this.updateUser);
  @override
  List<Object> get props => [updateUser];
}

class UserDataLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class UserDataLoaded extends AccountStates {
  final UserData userData;
  const UserDataLoaded(this.userData);
  @override
  List<Object> get props => [userData];
}

class GetSpecialtiesLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class GetSpecialtiesLoaded extends AccountStates {
  final GetSpecialties specialties;
  const GetSpecialtiesLoaded(this.specialties);
  @override
  List<Object> get props => [specialties];
}

class UploadImageLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class UploadImageLoaded extends AccountStates {
  final UploadImage uploadImage;
  const UploadImageLoaded(this.uploadImage);
  @override
  List<Object> get props => [uploadImage];
}



class DeletingUserLoading extends AccountStates {
  @override
  List<Object> get props => [];
}
 

class AccountLoaded extends AccountStates {
  final RegisterUser userData;
  const AccountLoaded(this.userData);
  @override
  List<Object> get props => [userData];
}
 

class AccountPasswordChanged extends AccountStates {
  final String message;
  const AccountPasswordChanged(this.message);
  @override
  List<Object> get props => [message];
}

class OTPResent extends AccountStates {
    final RegisterUser userData;

  const OTPResent(this.userData);
  @override
  List<Object> get props => [userData];
}

class BanksDataLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class BanksDataLoaded extends AccountStates {
  final Banks banks;
  const BanksDataLoaded(this.banks);
  @override
  List<Object> get props => [banks];
}

class AddBanksDataLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class AddBanksDataLoaded extends AccountStates {
  final BankDetails bankDetails;
  const AddBanksDataLoaded(this.bankDetails);
  @override
  List<Object> get props => [bankDetails];
}

class GoogleRegLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class GoogleRegLoaded extends AccountStates {
  final RegWithGoogle google;
  const GoogleRegLoaded(this.google);
  @override
  List<Object> get props => [google];
}

class GoogleLoginLoading extends AccountStates {
  @override
  List<Object> get props => [];
}

class GoogleLoginLoaded extends AccountStates {
  final LoginWithGoogle google;
  const GoogleLoginLoaded(this.google);
  @override
  List<Object> get props => [google];
}

class AccountNetworkErr extends AccountStates {
  final String? message;
  const AccountNetworkErr(this.message);
  @override
  List<Object> get props => [message!];
}

class AccountApiErr extends AccountStates {
  final String? message;
  const AccountApiErr(this.message);
  @override
  List<Object> get props => [message!];
}

 
 
 

 

 
 

 