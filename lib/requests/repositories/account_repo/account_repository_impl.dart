import 'dart:io';

 
import 'package:healthbubba/model/auth_model/verify_otp.dart';

import '../../../model/auth_model/login.dart';
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

  @override
  Future<VerifyOtp> verifyOtp({required String email, required String otp, required String url}) 
  async{ final map = await Requests().post(url, body: {
       
      "email": email,
      "otp": otp,
      "url": url,
       
    });
    return VerifyOtp.fromJson(map);
  }
  
  @override
  Future<LoginData> loginUser({required String email, required String password}) async {
    final map = await Requests().post(AppStrings.loginUrl, body: {
       
      "email": email,
      "password": password,
       
    });
    return LoginData.fromJson(map);
  }
  
  @override
  Future<RegisterUser> initiateResetPassword({required String email}) async {
    final map = await Requests().post(AppStrings.initiatePasswordResetUrl, body: {
       
      "email": email,
       
    });
    return RegisterUser.fromJson(map);
  }
  
  @override
  Future<RegisterUser> resetPassword({required String email, required String otp, 
  required String newPassword}) async{ final map = await Requests().post(AppStrings.resetPasswordUrl, body: {
       
      "email": email,
      "otp": otp,
      "newPassword": newPassword,
       
    });
    return RegisterUser.fromJson(map);
  }
}