

import '../../../model/patients/patients_list.dart';
import '../../../model/user/consultation_data.dart';
import '../../../model/user/user_data.dart';

abstract class UserRepository {

  Future<PatientsLists> getPatientsLists({
      required String page,
      required String limit,
      
     }
     );

     Future<ConsultationData> addConsultationFee({
      required String rate,
      required String duration,
      required String url,
      
     }
     );

      Future<UserData> getUserInfo();

     Future<PatientsLists> getConsultaionStatus( 
      {required String url}
     );

}