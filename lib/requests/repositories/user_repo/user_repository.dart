import 'dart:io';

import 'package:healthbubba/model/patients/appointment_lists.dart';

import '../../../model/patients/administered_route.dart';
import '../../../model/patients/create_appointment.dart';
import '../../../model/patients/get_medications.dart';
import '../../../model/patients/get_profile_status.dart';
import '../../../model/patients/medication_category.dart';
import '../../../model/patients/medication_sub_category.dart';
import '../../../model/patients/patients_list.dart';
import '../../../model/user/consultation_data.dart';
import '../../../model/user/user_data.dart';

abstract class UserRepository {
  Future<PatientsLists> getPatientsLists({
    required String page,
    required String limit,
  });

  Future<PatientsLists> getPatientsDetails({
    required String patientsId,
      
  });

  Future<ConsultationData> addConsultationFee({
    required String rate,
    required String duration,
    required String url,
  });

  Future<UserData> getUserInfo();

  Future<PatientsLists> getConsultaionStatus({required String url});

  Future<PatientsLists> createNewMedication({
    required String patientId,
    required String medicationName,
    required String medicationId,
    required String category,
    required String administrationRouteId,
    required String dosage,
    required String notes,
    required String durationStart,
    required String durationEnd,
    required String frequency,
    required String toBeTaken,
    required List<String> days,
    required List<String> times,
  });

  Future<MedicationCategory> getMedicationCategories();
  Future<MedicationSubCategory> getMedicationSubCategories(
      {required String categoryId});

  Future<GetMedications> getMedications();
  Future<GetProfileStatus> getProfileStatus();
  Future<AdministeredRoute> getAdministeredRoute();
  Future<AppointmentLists> getAppointmentList();

   Future<CreateAppointment> createAppointment({
    required String date,
    required String time,
    required String complaint,
    required   List<File> images, 
    required String patientsId,
  });


}
