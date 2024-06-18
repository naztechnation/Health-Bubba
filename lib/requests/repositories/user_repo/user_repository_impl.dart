

import '../../../model/patients/patients_list.dart';
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
}