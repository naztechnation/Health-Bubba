import 'package:equatable/equatable.dart';

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
 

class AccountLoggedOut extends AccountStates {
  final String message;
  const AccountLoggedOut(this.message);
  @override
  List<Object> get props => [message];
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

 
 
 

 

 
 

 