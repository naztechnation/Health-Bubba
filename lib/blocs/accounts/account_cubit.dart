
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthbubba/blocs/accounts/account.dart';
 
import '../../model/view_model/account_view_model.dart';
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
  
  Future<void> loadLanguages( ) async {
    try {
      emit(LanguagesLoading());

      final user = await accountRepository.getLanguages(
        
         
        
      );

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

  }

