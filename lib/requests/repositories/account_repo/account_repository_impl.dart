import 'dart:io';

 
import '../../../model/auth_model/register.dart';
import '../../../res/app_strings.dart';
 
import '../../setup/requests.dart';
import 'account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  @override
  Future<RegisterUser> registerUser({
    required String email,
    required String password,
     
  }) async {
    final map = await Requests().post(AppStrings.registerUserUrl, body: {
       
      "email": email,
      "password": password,
       
    });
    return RegisterUser.fromJson(map);
  }

}