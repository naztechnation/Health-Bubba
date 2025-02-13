import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthbubba/blocs/users/users.dart';

import '../../model/view_model/user_view_model.dart';
import '../../requests/repositories/user_repo/user_repository.dart';
import '../../utils/exceptions.dart';
import 'user_states.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit({required this.userRepository, required this.viewModel})
      : super(const InitialState());
  final UserRepository userRepository;
  final UserViewModel viewModel;

  Future<void> getPatientsLists({
    required String page,
    required String limit,
  }) async {
    try {
      emit(PatientsListLoading());

      final patients =
          await userRepository.getPatientsLists(page: page, limit: limit);
     viewModel.savePatietList(patients);
      emit(PatientsListLoaded(patients));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> addConsultationFee({
    required String rate,
    required String duration,
    required String url,
  }) async {
    try {
      emit(ConsultaionFeeLoading());

      final user = await userRepository.addConsultationFee(
          rate: rate, duration: duration, url: url);

      emit(ConsultaionFeeLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> userData() async {
    try {
      emit(UserDataLoading());

      final user = await userRepository.getUserInfo();


      emit(UserDataLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getNotificationsData() async {
    try {
      emit(NotificationsLoading());

      final user = await userRepository.getNotifications();

      await viewModel.filterNotification(user);


       
      emit(NotificationsLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> checkConsultationStatus({required String url}) async {
    try {
      emit(CheckConsultaionStatusLoading());

      final user = await userRepository.getConsultaionStatus(url: url);

      emit(CheckConsultaionStatusLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }
  Future<void> getConsultationStatus() async {
    try {
      emit(ConsultationFeeDataLoading());

      final user = await userRepository.getConsultaionStats();

      emit(ConsultationStatusLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> checkSpecialtyStatus({required String url}) async {
    try {
      emit(CheckSpecialtyStatusLoading());

      final user = await userRepository.getConsultaionStatus(url: url);

      emit(CheckSpecialtyStatusLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> checkAvailabilityStatus({required String url}) async {
    try {
      emit(CheckAvailabilityStatusLoading());

      final user = await userRepository.getConsultaionStatus(url: url);

      emit(CheckAvalaibilityStatusLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> checkLanguageStatus({required String url}) async {
    try {
      emit(CheckLanguageStatusLoading());

      final user = await userRepository.getConsultaionStatus(url: url);

      emit(CheckLanguageStatusLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> createNewMedication({
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
    try {
      emit(CreateMedicationLoading());

      final user = await userRepository.createNewMedication(
          patientId: patientId,
          medicationName: medicationName,
          medicationId: medicationId,
          category: category,
          administrationRouteId: administrationRouteId,
          dosage: dosage,
          notes: notes,
          durationStart: durationStart,
          durationEnd: durationEnd,
          frequency: frequency,
          toBeTaken: toBeTaken,
          days: days,
          times: times);

      emit(CreateMedicationLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getMedicationCategory() async {
    try {
      emit(MedicationCategoryLoading());

      final user = await userRepository.getMedicationCategories();

      emit(MedicationCategoryLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getMedicationSubCategory({required String categoryId}) async {
    try {
      emit(MedicationSubCategoryLoading());

      final user = await userRepository.getMedicationSubCategories(
          categoryId: categoryId);

      emit(MedicationSubCategoryLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getMedications() async {
    try {
      emit(MedicationsLoading());

      final medics = await userRepository.getMedications();
      viewModel.saveMedicalList(medics);
      emit(MedicationsLoaded(medics));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getProfileStatus() async {
    try {
      emit(ProfileStatusLoading());

      final status = await userRepository.getProfileStatus();

      viewModel.saveProfileStatus(status);

      emit(ProfileStatusLoaded(status));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getAdministeredRoute() async {
    try {
      emit(AdministeredRouteLoading());

      final user = await userRepository.getAdministeredRoute();

      emit(AdministeredRouteLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> createAppointment({
    required String patientsId,
    required String date,
    required String time,
    required String complaint,
    required List<File> images,
  }) async {
    try {
      emit(CreateAppointmentLoading());

      final user = await userRepository.createAppointment(
        patientsId: patientsId,
        date: date,
        time: time,
        complaint: complaint,
        images: images,
      );

      emit(CreateAppointmentLoaded(user));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getAppointmentList() async {
    try {
      emit(AppointmentListLoading());

      final appointment = await userRepository.getAppointmentList();
      await viewModel.setAppointmentData(appointment.message?.data ?? []);
      emit(AppointmentListLoaded(appointment));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getAppointmentDetails({required String appointmentId}) async {
    try {
      emit(AppointmentDetailsLoading());

      final appointment = await userRepository.getAppointmentDetails(
          appointmentId: appointmentId);
      emit(AppointmentDetailsLoaded(appointment));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getMedicationDetails({required String medicationId}) async {
    try {
      emit(MedicationDetailsLoading());

      final medics =
          await userRepository.getMedicationDetails(medicationId: medicationId);
      emit(MedicationDetailsLoaded(medics));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getPatientDetails({required String patientId}) async {
    try {
      emit(PatientsDetailsLoading());

      final patient =
          await userRepository.getPatientDetails(patientId: patientId);
      emit(PatientsDetailsLoaded(patient));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getNotificationSettings() async {
    try {
      emit(GetNotifyLoading());

      final patient = await userRepository.getNotificationSettings();
      emit(GetNotifyLoaded(patient));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> updateNotificationSettings({
    required String upcomingAlert,
    required String medicationReminder,
    required String orderAlert,
  }) async {
    try {
      emit(UpdateNotifyLoading());

      final patient = await userRepository.updateNotificationSettings(
          upcomingAlert: upcomingAlert,
          medicationReminder: medicationReminder,
          orderAlert: orderAlert);
      emit(UpdateNotifyLoaded(patient));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> cancelAppointment({
    required String appointmentId,
    required String reason,
  }) async {
    try {
      emit(CancelAppointmentLoading());

      final patient = await userRepository.cancelAppointment(
        appointmentId: appointmentId,
        reason: reason,
      );
      emit(CancelAppointmentLoaded(patient));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> completeAppointment({required String appointmentId}) async {
    try {
      emit(CancelAppointmentLoading());

      final patient = await userRepository.completeAppointment(
        appointmentId: appointmentId,
      );
      emit(CancelAppointmentLoaded(patient));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> deactivateUserAccount(
      {required String reason, required String details}) async {
    try {
      emit(DeactivateAccountLoading());

      final patient = await userRepository.deactivateAccount(
          reason: reason, details: details);
      emit(DeactivateAccountLoaded(patient));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> doctorsAnalyticsAccount(
    {required String days}
     ) async {
    try {
      emit(AnalyticsLoading());

      final analytics = await userRepository.getAnalytics(days
           );

           viewModel.saveAnalytics(analytics);
      emit(AnalyticsLoaded(analytics));
    } on ApiException catch (e) {
      emit(UserApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(UserNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }
 


}
