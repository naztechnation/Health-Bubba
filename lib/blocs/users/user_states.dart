import 'package:equatable/equatable.dart';
import 'package:healthbubba/model/patients/appointment_lists.dart';
import 'package:healthbubba/model/patients/create_appointment.dart';
import 'package:healthbubba/model/patients/get_profile_status.dart';
import 'package:healthbubba/model/patients/patients_list.dart';

import '../../model/patients/administered_route.dart';
import '../../model/patients/appointment_details.dart';
import '../../model/patients/consultation_result.dart';
import '../../model/patients/get_medications.dart';
import '../../model/patients/medication_category.dart';
import '../../model/patients/medication_sub_category.dart';
import '../../model/patients/patients_details.dart';
import '../../model/user/cancel_appointment.dart';
import '../../model/user/consultation_data.dart';
import '../../model/user/doctors_analytics.dart';
import '../../model/user/medication_details.dart';
import '../../model/user/notification_settings.dart';
import '../../model/user/notifications_data.dart';
import '../../model/user/reg_with_google.dart';
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

class NotificationsLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class NotificationsLoaded extends UserStates {
  final NotificationsData notificationsData;
  const NotificationsLoaded(this.notificationsData);
  @override
  List<Object> get props => [notificationsData];
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

class AnalyticsLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class AnalyticsLoaded extends UserStates {
  final DoctorsAnalytics doctorsAnalytics;
  const AnalyticsLoaded(this.doctorsAnalytics);
  @override
  List<Object> get props => [doctorsAnalytics];
}

class CreateMedicationLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class CreateMedicationLoaded extends UserStates {
  final PatientsLists createNewMedication;
  const CreateMedicationLoaded(this.createNewMedication);
  @override
  List<Object> get props => [createNewMedication];
}

class MedicationCategoryLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class MedicationCategoryLoaded extends UserStates {
  final MedicationCategory medicationCategory;
  const MedicationCategoryLoaded(this.medicationCategory);
  @override
  List<Object> get props => [medicationCategory];
}

class MedicationSubCategoryLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class MedicationSubCategoryLoaded extends UserStates {
  final MedicationSubCategory medicationSubCategory;
  const MedicationSubCategoryLoaded(this.medicationSubCategory);
  @override
  List<Object> get props => [medicationSubCategory];
}

class MedicationsLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class MedicationsLoaded extends UserStates {
  final GetMedications medications;
  const MedicationsLoaded(this.medications);
  @override
  List<Object> get props => [medications];
}

class AdministeredRouteLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class AdministeredRouteLoaded extends UserStates {
  final AdministeredRoute route;
  const AdministeredRouteLoaded(this.route);
  @override
  List<Object> get props => [route];
}

class ProfileStatusLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class ProfileStatusLoaded extends UserStates {
  final GetProfileStatus status;
  const ProfileStatusLoaded(this.status);
  @override
  List<Object> get props => [status];
}

class PatientDetailsLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class PatientDetailsLoaded extends UserStates {
  final PatientsLists patientsLists;
  const PatientDetailsLoaded(this.patientsLists);
  @override
  List<Object> get props => [patientsLists];
}

class UpdateNotifyLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class UpdateNotifyLoaded extends UserStates {
  final NotificationSettings notificationSettings;
  const UpdateNotifyLoaded(this.notificationSettings);
  @override
  List<Object> get props => [notificationSettings];
}

class GetNotifyLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class GetNotifyLoaded extends UserStates {
  final NotificationSettings notificationSettings;
  const GetNotifyLoaded(this.notificationSettings);
  @override
  List<Object> get props => [notificationSettings];
}

class CancelAppointmentLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class CancelAppointmentLoaded extends UserStates {
  final CancelAppointment cancelAppointment;
  const CancelAppointmentLoaded(this.cancelAppointment);
  @override
  List<Object> get props => [cancelAppointment];
}

class CreateAppointmentLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class ConsultationStatusLoaded extends UserStates {
  final ConsultationFeeData consultationFeeData;
  const ConsultationStatusLoaded(this.consultationFeeData);
  @override
  List<Object> get props => [consultationFeeData];
}

class ConsultationFeeDataLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class CreateAppointmentLoaded extends UserStates {
  final CreateAppointment createAppointment;
  const CreateAppointmentLoaded(this.createAppointment);
  @override
  List<Object> get props => [createAppointment];
}

class AppointmentListLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class AppointmentListLoaded extends UserStates {
  final AppointmentLists appointmentLists;
  const AppointmentListLoaded(this.appointmentLists);
  @override
  List<Object> get props => [appointmentLists];
}

class AppointmentDetailsLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class AppointmentDetailsLoaded extends UserStates {
  final AppointmentDetails appointmentDetails;
  const AppointmentDetailsLoaded(this.appointmentDetails);
  @override
  List<Object> get props => [appointmentDetails];
}

class MedicationDetailsLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class MedicationDetailsLoaded extends UserStates {
  final MedicationDetails medicationDetails;
  const MedicationDetailsLoaded(this.medicationDetails);
  @override
  List<Object> get props => [medicationDetails];
}

class PatientsDetailsLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class PatientsDetailsLoaded extends UserStates {
  final PatientDetails patientDetails;
  const PatientsDetailsLoaded(this.patientDetails);
  @override
  List<Object> get props => [patientDetails];
}

class DeactivateAccountLoading extends UserStates {
  @override
  List<Object> get props => [];
}

class DeactivateAccountLoaded extends UserStates {
  final UserData userAccount;
  const DeactivateAccountLoaded(this.userAccount);
  @override
  List<Object> get props => [userAccount];
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
