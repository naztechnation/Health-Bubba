

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
     

     Future<PatientsLists> createNewMedication( 
      {required String patientId,
      
      required String medicationName,
      required String medicationId,
      required String category,
      required String administrationRouteId,
      required String dosage,
      required String notes,
      required String durationStart,
      required String durationEnd,
      required String frequency,
      required String toBeTaken,
      required List<String> days,
      required List<String> times,
      }
     );

}