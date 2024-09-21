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

  AccountViewModel() {
    getToken();
    changeScreen();
  }

  String _token = "";

  setToken(String token) async {
    _token = token;

    StorageHandler.saveUserToken(_token);
    setViewState(ViewState.success);
  }

  savePlatformLanguages(List<LanguagesData> platformLanguages) {
    _platformLanguages = platformLanguages;
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
  changeScreen( ) async {
    Map<String, dynamic>? data;
    try {
      final firestoreRef = FirebaseFirestore.instance
          .collection('app_version')
          .doc('version_number');

      DocumentSnapshot snapshot = await firestoreRef.get();

      if (snapshot.exists) {
        data = snapshot.data() as Map<String, dynamic>;

        if (data['current_version'] as int > AppStrings.appVersion) {
          _isUptoDate = false;
          setViewState(ViewState.success);
        } else {
          _isUptoDate = false;
          setViewState(ViewState.success);

        }
      }
    } catch (error) {
      if (error is FirebaseException) {
        if (error.code == 'unavailable') {
           
        }

          _isUptoDate = true;

      }
    }
  }

  List<LanguagesData> get plaformLanguages => _platformLanguages;
  List<GetSpecialtiesData> get platformSpecialties => _platformSpecialties;

  String get token => _token;
  bool get isUptoDate => _isUptoDate;
}
