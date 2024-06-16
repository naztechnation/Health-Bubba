import 'package:equatable/equatable.dart';
import 'package:healthbubba/model/auth_model/login.dart';
import 'package:healthbubba/model/auth_model/verify_otp.dart';
import 'package:healthbubba/model/user/languages.dart';
import 'package:healthbubba/model/user/qualification.dart';
import 'package:healthbubba/model/user/select_qualifications.dart';

import '../../model/auth_model/register.dart';
 
 

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

 
 
 

 

 
 

 