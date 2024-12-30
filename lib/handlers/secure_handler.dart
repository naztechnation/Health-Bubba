import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class StorageHandler {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  static Future<void> saveUserName([String? username]) async {
    if (username != null) await storage.write(key: 'USER', value: username);
  }

  static Future<void> saveUserFirstName([String? name]) async {
    if (name != null) await storage.write(key: 'FIRSTNAME', value: name);
  }

  static Future<void> saveUserTitle([String? title]) async {
    if (title != null) await storage.write(key: 'TITLE', value: title);
  }

  static Future<void> saveDoctorState([String? state]) async {
    if (state != null) await storage.write(key: 'DSTATE', value: state);
  }

  static Future<void> saveEmail([String? username]) async {
    if (username != null) await storage.write(key: 'EMAIL', value: username);
  }

  static Future<void> saveUserPicture([String? picture]) async {
    if (picture != null) await storage.write(key: 'DP', value: picture);
  }

  static Future<void> saveUserPhone([String? phone]) async {
    if (phone != null) await storage.write(key: 'PHONE', value: phone);
  }

  static Future<void> saveUserId([String? userId]) async {
    if (userId != null) await storage.write(key: 'ID', value: userId);
  }
  static Future<void> saveDocLicense([String? userId]) async {
    if (userId != null) await storage.write(key: 'LICENSE', value: userId);
  }
  static Future<void> saveOtherDoc([String? userId]) async {
    if (userId != null) await storage.write(key: 'OTHERDOC', value: userId);
  }

  static Future<void> saveUserPassword([String? password]) async {
    if (password != null) await storage.write(key: 'PASSWORD', value: password);
  }

  static Future<void> saveOnboardState([String? onBoard]) async {
    if (onBoard != null) await storage.write(key: 'ONBOARD', value: onBoard);
  }

  static Future<void> saveIsLoggedIn([String? isLoggedIn]) async {
    if (isLoggedIn != null) {
      await storage.write(key: 'LOGGEDIN', value: isLoggedIn);
    }
  }

  static Future<void> saveFcmToken([String? token]) async {
    if (token != null) {
      await storage.write(key: 'FCM', value: token);
    }
  }

  static Future<void> saveLastName([String? token]) async {
    if (token != null) {
      await storage.write(key: 'LASTNAME', value: token);
    }
  }

  static Future<void> saveUserToken([String? token]) async {
    if (token != null) await storage.write(key: 'TOKEN', value: token);
  }

  static Future<String> getUserName() async {
    String? value = await storage.read(key: 'USER');
    String? username;
    String? data = value;
    if (data != null) {
      username = data;
    } else {
      username = '';
    }
    return username;
  }
  static Future<String> getOtherDoc() async {
    String? value = await storage.read(key: 'OTHERDOC');
    String? username;
    String? data = value;
    if (data != null) {
      username = data;
    } else {
      username = '';
    }
    return username;
  }
  static Future<String> getDocLicense() async {
    String? value = await storage.read(key: 'LICENSE');
    String? username;
    String? data = value;
    if (data != null) {
      username = data;
    } else {
      username = '';
    }
    return username;
  }

  static Future<String> getDoctorState() async {
    String? value = await storage.read(key: 'DSTATE');
    String? state;
    String? data = value;
    if (data != null) {
      state = data;
    } else {
      state = '';
    }
    return state;
  }

  static Future<String> getUserTitle() async {
    String? value = await storage.read(key: 'TITLE');
    String? title;
    String? data = value;
    if (data != null) {
      title = data;
    } else {
      title = '';
    }
    return title;
  }

 

  static Future<String?> getUserFCM() async {
    Map<String, String> value = await storage.readAll();
    String? user;
    String? data = value['FCM'];
    if (data != null) {
      user = data;
    }
    return user;
  }

  static Future<String> getUserToken() async {
    String? value = await storage.read(key: 'TOKEN');
    String? token;
    String? data = value;
    if (data != null) {
      token = data;
    } else {
      token = '';
    }
    return token;
  }

  static Future<String> getFirstName() async {
    String? value = await storage.read(key: 'FIRSTNAME');
    String? name;
    String? data = value;
    if (data != null) {
      name = data;
    } else {
      name = '';
    }
    return name;
  }

static Future<String> getTitle() async {
    String? value = await storage.read(key: 'TITLE');
    String? name;
    String? data = value;
    if (data != null) {
      name = data;
    } else {
      name = '';
    }
    return name;
  }
  static Future<String> getMedicalLicenceNumber() async {
    String? value = await storage.read(key: 'MEDICAL');
    String? name;
    String? data = value;
    if (data != null) {
      name = data;
    } else {
      name = '';
    }
    return name;
  }

   static Future<void> saveMedicalLicenceNumber([String? username]) async {
    if (username != null) await storage.write(key: 'MEDICAL', value: username);
  }

  static Future<String> getMedicalQualification() async {
    String? value = await storage.read(key: 'QUALIFICATIONS');
    String? name;
    String? data = value;
    if (data != null) {
      name = data;
    } else {
      name = '';
    }
    return name;
  }

   static Future<void> saveMedicalQualification([String? username]) async {
    if (username != null) await storage.write(key: 'QUALIFICATIONS', value: username);
  }
  
  static Future<String> getYear() async {
    String? value = await storage.read(key: 'YEAR');
    String? name;
    String? data = value;
    if (data != null) {
      name = data;
    } else {
      name = '';
    }
    return name;
  }
  static Future<void> saveYear([String? username]) async {
    if (username != null) await storage.write(key: 'YEAR', value: username);
  }
  static Future<String> getAffliate() async {
    String? value = await storage.read(key: 'AFFLIATE');
    String? name;
    String? data = value;
    if (data != null) {
      name = data;
    } else {
      name = '';
    }
    return name;
  }
  static Future<void> saveAffliate([String? username]) async {
    if (username != null) await storage.write(key: 'AFFLIATE', value: username);
  }
  static Future<String> getPhone() async {
    String? value = await storage.read(key: 'PHONE');
    String? name;
    String? data = value;
    if (data != null) {
      name = data;
    } else {
      name = '';
    }
    return name;
  }
   static Future<void> savePhone([String? username]) async {
    if (username != null) await storage.write(key: 'PHONE', value: username);
  }
  static Future<String> getLocation() async {
    String? value = await storage.read(key: 'LOCATION');
    String? name;
    String? data = value;
    if (data != null) {
      name = data;
    } else {
      name = '';
    }
    return name;
  } 

  static Future<void> saveLocation([String? username]) async {
    if (username != null) await storage.write(key: 'LOCATION', value: username);
  }
  static Future<String> getLastName() async {
    String? value = await storage.read(key: 'LASTNAME');
    String? name;
    String? data = value;
    if (data != null) {
      name = data;
    } else {
      name = '';
    }
    return name;
  }

  static Future<String> getFirebaseToken() async {
    String? value = await storage.read(key: 'FCM');
    String? token;
    String? data = value;
    if (data != null) {
      token = data;
    } else {
      token = '';
    }
    return token;
  }

  static Future<String> getUserPicture() async {
    String? value = await storage.read(key: 'DP');
    String? dp;
    String? data = value;
    if (data != null) {
      dp = data;
    } else {
      dp = '';
    }
    return dp;
  }

  static Future<String> getUserEmail() async {
    String? value = await storage.read(key: 'EMAIL');
    String? email;
    String? data = value;
    if (data != null) {
      email = data;
    } else {
      email = '';
    }
    return email;
  }

  static Future<String> getUserPetState() async {
    String? value = await storage.read(key: 'PETSTATE');
    String? userId;
    String? data = value;
    if (data != null) {
      userId = data;
    } else {
      userId = '';
    }
    return userId;
  }

  static Future<String> getUserId() async {
    String? value = await storage.read(key: 'ID');
    String? userId;
    String? data = value;
    if (data != null) {
      userId = data;
    } else {
      userId = '';
    }
    return userId;
  }

  static Future<String> getUserPhone() async {
    String? value = await storage.read(key: 'PHONE');
    String? userId;
    String? data = value;
    if (data != null) {
      userId = data;
    } else {
      userId = '';
    }
    return userId;
  }

  static Future<String> getOnBoardState() async {
    String? value = await storage.read(key: 'ONBOARD');
    String? onboard;
    String? data = value;
    if (data != null) {
      onboard = data;
    } else {
      onboard = '';
    }
    return onboard;
  }

  static Future<String> getLoggedInState() async {
    String? value = await storage.read(key: 'LOGGEDIN');
    String? loggedin;
    String? data = value;
    if (data != null) {
      loggedin = data;
    } else {
      loggedin = '';
    }
    return loggedin;
  }

  static Future<String> getUserType() async {
    String? value = await storage.read(key: 'USERTYPE');
    String? usertype;
    String? data = value;
    if (data != null) {
      usertype = data;
    } else {
      usertype = '';
    }
    return usertype;
  }

  static Future<String> getUserPassword() async {
    String? value = await storage.read(key: 'PASSWORD');
    String? password;
    String? data = value;
    if (data != null) {
      password = data;
    } else {
      password = '';
    }
    return password;
  }

  static Future<void> clearCache() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();

    await storage.delete(key: 'LOGGEDIN');
    await storage.delete(key: 'FIRSTNAME');
    await storage.delete(key: 'LASTNAME');
    await storage.deleteAll();
  }
}
