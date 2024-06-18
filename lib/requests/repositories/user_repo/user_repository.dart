

import '../../../model/patients/patients_list.dart';

abstract class UserRepository {

  Future<PatientsLists> getPatientsLists({
      required String page,
      required String limit,
      
     }
     );

}