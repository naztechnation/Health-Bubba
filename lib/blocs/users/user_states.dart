
import 'package:equatable/equatable.dart';
import 'package:healthbubba/model/patients/patients_list.dart';

import '../../model/user/consultation_data.dart';
import '../../model/user/user_data.dart';

abstract class UserStates extends Equatable {
  const UserStates();
}

class InitialState extends UserStates {
  const InitialState();
  @override
  List<Object> get props => [];
}

class PatientsListLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class PatientsListLoaded extends UserStates {
  final PatientsLists patientsLists;
  const PatientsListLoaded(this.patientsLists);
  @override
  List<Object> get props => [patientsLists];
}

class ConsultaionFeeLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class ConsultaionFeeLoaded extends UserStates {
  final ConsultationData fee;
  const ConsultaionFeeLoaded(this.fee);
  @override
  List<Object> get props => [fee];
}

class CheckConsultaionStatusLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class CheckConsultaionStatusLoaded extends UserStates {
  final PatientsLists fee;
  const CheckConsultaionStatusLoaded(this.fee);
  @override
  List<Object> get props => [fee];
}

class CheckLanguageStatusLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class CheckLanguageStatusLoaded extends UserStates {
  final PatientsLists language;
  const CheckLanguageStatusLoaded(this.language);
  @override
  List<Object> get props => [language];
}

class CheckAvailabilityStatusLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class CheckAvalaibilityStatusLoaded extends UserStates {
  final PatientsLists availability;
  const CheckAvalaibilityStatusLoaded(this.availability);
  @override
  List<Object> get props => [availability];
}

class CheckSpecialtyStatusLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class CheckSpecialtyStatusLoaded extends UserStates {
  final PatientsLists specialty;
  const CheckSpecialtyStatusLoaded(this.specialty);
  @override
  List<Object> get props => [specialty];
}

class UserDataLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class UserDataLoaded extends UserStates {
  final UserData userData;
  const UserDataLoaded(this.userData);
  @override
  List<Object> get props => [userData];
}

class UserNetworkErr extends UserStates {
  final String? message;
  const UserNetworkErr(this.message);
  @override
  List<Object> get props => [message!];
}

class UserApiErr extends UserStates {
  final String? message;
  const UserApiErr(this.message);
  @override
  List<Object> get props => [message!];
}

 
 
 

 