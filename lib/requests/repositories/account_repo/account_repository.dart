import 'dart:io';

import '../../../model/auth_model/register.dart';

 
abstract class AccountRepository {

  Future<RegisterUser> registerUser({
    
    required String email,
    required String password,
     

  });

  
   

}
