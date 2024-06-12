import 'dart:io';

import 'package:healthbubba/model/auth_model/verify_otp.dart';

import '../../../model/auth_model/login.dart';
import '../../../model/auth_model/register.dart';

 
abstract class AccountRepository {

  Future<RegisterUser> registerUser({
    
    required String email,
    required String password,
     

  });

  Future<RegisterUser> initiateResetPassword({
    
    required String email,
     

  });

  Future<VerifyOtp> verifyOtp({
    
    required String email,
    required String otp,
    required String url,
     

  });

  Future<LoginData> loginUser({
    
    required String email,
    required String password,
     

  });
   

  Future<RegisterUser> resetPassword({
    
    required String email,
    required String otp,
    required String newPassword,
     

  });
}
