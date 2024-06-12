
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
 
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

  
  }

