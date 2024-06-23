

import '../../../model/patients/patients_list.dart';
import '../../../model/user/consultation_data.dart';
import '../../../model/user/user_data.dart';
import '../../../res/app_strings.dart';
import '../../setup/requests.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {


   @override
  Future<PatientsLists> getPatientsLists({required String page, required String limit})async {
    final map = await Requests().get(
      AppStrings.patientsListsUrl(page: page, limit: limit),
    );
    return PatientsLists.fromJson(map);
  }
  
  @override
  Future<ConsultationData> addConsultationFee({required String rate, required String duration,
  required String url}) async {
    final map = await Requests().post(
      AppStrings.consultationFeeUrl(url: url),
      body: {
        'rate': rate,
        'duration': duration,
      }
    );
    return ConsultationData.fromJson(map);
  }
  
  @override
  Future<PatientsLists> getConsultaionStatus({required String url}) async {
    final map = await Requests().post(
      AppStrings.profileStatusUrl(url: url),
    );
    return PatientsLists.fromJson(map);
  }

    @override
  Future<UserData> getUserInfo() async {
    final map = await Requests().get(
      AppStrings.getUserDataUrl,
    );
    return UserData.fromJson(map);
  }
  
}