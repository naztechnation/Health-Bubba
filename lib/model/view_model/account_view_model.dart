import '../../handlers/secure_handler.dart';
 
import '../../res/enum.dart';
import '../user/get_specialties.dart';
import '../user/languages.dart';
import 'base_viewmodel.dart';

class AccountViewModel extends BaseViewModel {
 

  List<LanguagesData> _platformLanguages = [];

  List<GetSpecialtiesData> _platformSpecialties = [];

  AccountViewModel() {
    getToken();
  }

  String _token = "";
   
 

  setToken(String token) async {
    _token = token;

    StorageHandler.saveUserToken(_token);
    setViewState(ViewState.success);
  }

   savePlatformLanguages(List<LanguagesData> platformLanguages){

    _platformLanguages = platformLanguages;
      setViewState(ViewState.success);

  }

  savePlatformSpecialties(List<GetSpecialtiesData> platformSpecialties){

    _platformSpecialties = platformSpecialties;
      setViewState(ViewState.success);

  }

    

  getToken() async {
    _token = await StorageHandler.getUserToken() ?? '';
    setViewState(ViewState.success);
  }

   

  
 

  List<LanguagesData> get plaformLanguages => _platformLanguages;
  List<GetSpecialtiesData> get platformSpecialties => _platformSpecialties;
  

  String get token => _token;
 
}
