import 'dart:convert';
import 'dart:io';

import 'package:healthbubba/model/patients/administered_route.dart';
import 'package:healthbubba/model/patients/appointment_lists.dart';
import 'package:healthbubba/model/patients/create_appointment.dart';
import 'package:healthbubba/model/patients/get_medications.dart';
import 'package:healthbubba/model/patients/get_profile_status.dart';
import 'package:healthbubba/model/patients/medication_category.dart';
import 'package:healthbubba/model/patients/medication_sub_category.dart';

import '../../../handlers/secure_handler.dart';
import '../../../model/patients/patients_list.dart';
import '../../../model/user/consultation_data.dart';
import '../../../model/user/user_data.dart';
import '../../../res/app_strings.dart';
import '../../setup/requests.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<PatientsLists> getPatientsLists(
      {required String page, required String limit}) async {
    final map = await Requests().get(
      AppStrings.patientsListsUrl(page: page, limit: limit),
    );
    return PatientsLists.fromJson(map);
  }

  @override
  Future<ConsultationData> addConsultationFee(
      {required String rate,
      required String duration,
      required String url}) async {
    final map =
        await Requests().post(AppStrings.consultationFeeUrl(url: url), body: {
      'rate': rate,
      'duration': duration,
    });
    return ConsultationData.fromJson(map);
  }

  @override
  Future<PatientsLists> getConsultaionStatus({required String url}) async {
    final map = await Requests().post(
      AppStrings.profileStatusUrl(url: url),
    );
    return PatientsLists.fromJson(map);
  }

  @override
  Future<UserData> getUserInfo() async {
    final map = await Requests().get(
      AppStrings.getUserDataUrl,
    );
    return UserData.fromJson(map);
  }

  @override
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
  }) async {
    final accessToken = await StorageHandler.getUserToken() ?? '';

    var payload = {
      "patient_id": patientId,
      "medication_name": medicationName,
      "medication_id": medicationId,
      "category": category,
      "administration_route_id": administrationRouteId,
      "dosage": dosage,
      "notes": notes,
      "duration_start_time": durationStart,
      "duration_end_time": durationEnd,
      "to_be_taken": toBeTaken,
      "frequency": frequency,
      "days": days,
      "times": times
    };
    final map = await Requests().post(AppStrings.createNewMedicationUrl,
        body: jsonEncode(payload),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $accessToken",
        });
    return PatientsLists.fromJson(map);
  }

  @override
  Future<MedicationCategory> getMedicationCategories() async {
    final map = await Requests().get(
      AppStrings.medicationCategoriesUrl,
    );
    return MedicationCategory.fromJson(map);
  }

  @override
  Future<MedicationSubCategory> getMedicationSubCategories(
      {required String categoryId}) async {
    final map = await Requests().get(
      AppStrings.medicationSubCategoryUrl(categoryId: categoryId),
    );
    return MedicationSubCategory.fromJson(map);
  }

  @override
  Future<GetMedications> getMedications() async {
    final map = await Requests().get(
      AppStrings.medicationsUrl,
    );
    return GetMedications.fromJson(map);
  }

  @override
  Future<GetProfileStatus> getProfileStatus() async {
    final map = await Requests().post(
      AppStrings.getProfileStatusUrl,
    );
    return GetProfileStatus.fromJson(map);
  }

  @override
  Future<AdministeredRoute> getAdministeredRoute() async {
    final map = await Requests().get(
      AppStrings.getAdministeredRouteUrl,
    );
    return AdministeredRoute.fromJson(map);
  }

  @override
  Future<PatientsLists> getPatientsDetails({required String patientsId}) async {
    final map = await Requests().get(
      AppStrings.getPatientsDetailsUrl(patientId: patientsId),
    );
    return PatientsLists.fromJson(map);
  }

  @override
  Future<CreateAppointment> createAppointment(
      {required String patientsId,
      required String date,
      required String time,
      required String complaint,
      required List<File> images}) async {
    final map = await Requests().post(AppStrings.createAppointmentUrl, files: {
      'files': images,
    }, body: {
      'patient_id': patientsId,
      'date': date,
      'time': time,
      'complain': complaint,
    });
    return CreateAppointment.fromJson(map);
  }

  @override
  Future<AppointmentLists> getAppointmentList() async {
    final map = await Requests().get(
      AppStrings.appointmentListUrl,
    );
    return AppointmentLists.fromJson(map);
  }
}