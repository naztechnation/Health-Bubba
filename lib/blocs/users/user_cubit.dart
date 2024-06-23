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

      final user =
          await userRepository.getPatientsLists(page: page, limit: limit);

      emit(PatientsListLoaded(user));
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
}
