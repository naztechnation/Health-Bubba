import 'dart:convert';

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
}
