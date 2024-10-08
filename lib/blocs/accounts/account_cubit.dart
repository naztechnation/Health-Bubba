import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthbubba/blocs/accounts/account.dart';

import '../../model/view_model/account_view_model.dart';
import '../../model/working_hours.dart';
import '../../requests/repositories/account_repo/account_repository.dart';
import '../../utils/exceptions.dart';

import 'account_states.dart';

class AccountCubit extends Cubit<AccountStates> {
  AccountCubit({required this.accountRepository, required this.viewModel})
      : super(const InitialState());
  final AccountRepository accountRepository;
  final AccountViewModel viewModel;

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      emit(AccountProcessing());

      final user = await accountRepository.registerUser(
        email: email,
        password: password,
      );

      emit(AccountLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> verifyOtp({
    required String email,
    required String otp,
    required String url,
  }) async {
    try {
      emit(VerifyOtpLoading());

      final user = await accountRepository.verifyOtp(
        email: email,
        otp: otp,
        url: url,
      );

      emit(VerifyOtpLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      emit(AccountLoading());

      final user = await accountRepository.loginUser(
        email: email,
        password: password,
      );

      emit(LoginLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      emit(ChangePasswordProcessing());

      final user = await accountRepository.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );

      emit(ChangePasswordLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> initiateResetPassword({
    required String email,
  }) async {
    try {
      emit(ResetPasswordLoading());

      final user = await accountRepository.initiateResetPassword(
        email: email,
      );

      emit(ResetPasswordLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> resetPassword({
    required String email,
    required String otp,
    required String newPassword,
  }) async {
    try {
      emit(AccountProcessing());

      final user = await accountRepository.resetPassword(
        email: email,
        otp: otp,
        newPassword: newPassword,
      );

      emit(AccountLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> loadLanguages() async {
    try {
      emit(LanguagesLoading());

      final user = await accountRepository.getLanguages();
      viewModel.savePlatformLanguages(user.message?.data ?? []);
      emit(LanguagesLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> loadQualifications() async {
    try {
      emit(QualificationsLoading());

      final user = await accountRepository.getQualifications();

      emit(QualificationsLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> selectSpecialties({required List<int> specialties}) async {
    try {
      emit(SelectSpecialtiesLoading());

      final user =
          await accountRepository.selectSpecialties(specialties: specialties);

      emit(SelectSpecialtiesLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> selectQualifications(
      {required List<int> qualificationIds}) async {
    try {
      emit(SelectQualificationsLoading());

      final user = await accountRepository.selectQualifications(
          qualificationIds: qualificationIds);

      emit(SelectQualificationsLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> selectLanguages({required String languages}) async {
    try {
      emit(SelectLanguageLoading());

      final user = await accountRepository.addLanguage(languages: languages);

      emit(SelectLanguagesLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> selectedLanguages() async {
    try {
      emit(SelectedLanguageLoading());

      final user = await accountRepository.selectedLanguages();

      emit(SelectedLanguagesLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> selectedQualification() async {
    try {
      emit(SelectedQualificationsLoading());

      final user = await accountRepository.getSelectedQualifications();

      emit(SelectedQualificationsLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> selectedAvailability() async {
    try {
      emit(SelectedAvailabilitysLoading());

      final user = await accountRepository.getSelectedAvailability();

      emit(SelectedAvailabilitysLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> updateAvailability(
      {required List<DaySchedule> schedule,
      required BuildContext context}) async {
    try {
      emit(UpdateAvailabilitysLoading());

      final user = await accountRepository.updateAvalaibility(
        schedule: schedule,
        context: context,
      );

      emit(UpdateAvailabilitysLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> updateBio({required String bio}) async {
    try {
      emit(UpdateBioLoading());

      final user = await accountRepository.updateBio(
        bio: bio,
      );

      emit(UpdateBioLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> updateUserData({
    required String title,
    required String firstname,
    required String lastname,
    required String licenceNumber,
    required int experience,
    required String hospitalAffliated,
    required String phone,
    String? location,
  }) async {
    try {
      emit(UpdateUserLoading());

      final user = await accountRepository.updateUserData(
          title: title,
          firstname: firstname,
          lastname: lastname,
          licenceNumber: licenceNumber,
          experience: experience,
          hospitalAffliated: hospitalAffliated,
          phone: phone);

      emit(UpdateUserLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> userData() async {
    try {
      emit(UserDataLoading());

      final user = await accountRepository.getUserInfo();

      emit(UserDataLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getSpecialties() async {
    try {
      emit(GetSpecialtiesLoading());

      final specialties = await accountRepository.getSpecialties();
      viewModel.savePlatformSpecialties(specialties.message?.data ?? []);
      emit(GetSpecialtiesLoaded(specialties));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> uploadImage({required File image}) async {
    try {
      emit(UploadImageLoading());

      final user = await accountRepository.uploadImage(image: image);

      emit(UploadImageLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> chooseLanguage({required List<int> language}) async {
    try {
      emit(ChooseLanguageLoading());

      final user =
          await accountRepository.chooseLanguages(languageId: language);

      emit(ChooseLanguagesLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> getBanks() async {
    try {
      emit(BanksDataLoading());

      final user = await accountRepository.getBanks();

      emit(BanksDataLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> addBankDetails(
      {required String bankCode,
      required String accountNumber,
      required String accountName,
      required String url}) async {
    try {
      emit(AddBanksDataLoading());

      final user = await accountRepository.addBankDetails(
          bankCode: bankCode,
          accountNumber: accountNumber,
          accountName: accountName,
          url: url);

      emit(AddBanksDataLoaded(user));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> regWithGoogle(
      {required String dob,
      required String sex,
      required String firstname,
      required String email,
      required String fcm}) async {
    try {
      emit(GoogleRegLoading());

      final google = await accountRepository.regWithGoogleA(
          dob: dob, sex: sex, firstname: firstname, email: email, fcm: fcm);

      emit(GoogleRegLoaded(google));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> loginWithGoogle({required String email}) async {
    try {
      emit(GoogleLoginLoading());

      final google = await accountRepository.loginWithGoogleA(
        email: email,
      );

      emit(GoogleLoginLoaded(google));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> regWithApple({
    required String dob,
    required String sex,
    required String firstname,
    required String email,
    required String fcm,
    required String appleId,
  }) async {
    try {
      emit(AppleRegLoading());

      final apple = await accountRepository.regWithAppleA(
          dob: dob,
          sex: sex,
          firstname: firstname,
          email: email,
          fcm: fcm,
          appleId: appleId);

      emit(AppleRegLoaded(apple));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> resendOtp({
    required String email,
  }) async {
    try {
      emit(ResendOtpLoading());

      final apple = await accountRepository.resendOtp(
        email: email,
      );

      emit(ResendOtpLoaded(apple));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }

  Future<void> loginWithApple({
    required String email,
    required String appleId,
  }) async {
    try {
      emit(AppleLoginLoading());

      final google = await accountRepository.loginWithAppleA(
        email: email,
        appleId: appleId,
      );

      emit(AppleLoginLoaded(google));
    } on ApiException catch (e) {
      emit(AccountApiErr(e.message));
    } catch (e) {
      if (e is NetworkException ||
          e is BadRequestException ||
          e is UnauthorisedException ||
          e is FileNotFoundException ||
          e is AlreadyRegisteredException) {
        emit(AccountNetworkErr(e.toString()));
      } else {
        rethrow;
      }
    }
  }
}
