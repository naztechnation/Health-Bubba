
import 'package:equatable/equatable.dart';
import 'package:healthbubba/model/patients/patients_list.dart';

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

 
 
 

 