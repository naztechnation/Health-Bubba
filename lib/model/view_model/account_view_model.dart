import 'package:cloud_firestore/cloud_firestore.dart';
 

import '../../handlers/secure_handler.dart';  
import '../../res/app_strings.dart';
import '../../res/enum.dart'; 
import '../user/get_specialties.dart';
import '../user/languages.dart';
import 'base_viewmodel.dart';

class AccountViewModel extends BaseViewModel {
  List<LanguagesData> _platformLanguages = [];

  List<GetSpecialtiesData> _platformSpecialties = [];

  bool _isUptoDate = true;

  int _countdown = 90;
  bool _callOnce = true;
  bool _isCountdownComplete = false;

    Future<void> startCountdown() async {
    for (int i = 90; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      
        _countdown = i;
    setViewState(ViewState.success);
      
    }
    
      _isCountdownComplete = true;
    

    setViewState(ViewState.success);

  }


  AccountViewModel() {
    getToken();
    
  }

  String _token = "";

  setIsCompleted({required bool isCompleted}){

    _isCountdownComplete = isCompleted;
    setViewState(ViewState.success);

  }

   

  setCallOnce({required bool call}){
    _callOnce = call;
    setViewState(ViewState.success);

  }

  setToken(String token) async {
    _token = token;

    StorageHandler.saveUserToken(_token);
    setViewState(ViewState.success);
  }

  savePlatformLanguages(List<LanguagesData> platformLanguages) {
    final uniqueLanguages = <String, LanguagesData>{};

  for (var lang in platformLanguages) {
    String formattedLanguage = lang.languageName.toString().toLowerCase().trim();

    if (!uniqueLanguages.containsKey(formattedLanguage)) {
      uniqueLanguages[formattedLanguage] = lang;
    }
  }

  _platformLanguages = uniqueLanguages.values.toList();
  setViewState(ViewState.success);
  }

  savePlatformSpecialties(List<GetSpecialtiesData> platformSpecialties) {
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
  bool get isCountdownComplete => _isCountdownComplete;
  int get countdown => _countdown;
  bool get isUptoDate => _isUptoDate;
  bool get callOnce => _callOnce;
}
