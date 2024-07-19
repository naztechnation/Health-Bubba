import '../token/token.dart';
import '../user/user.dart';

class VerifyOtp {
  bool? ok;
  String? message;
  dynamic data;

  VerifyOtp({this.ok, this.message, this.data});

  VerifyOtp.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
   if (json['data'] != null) {
      if (json['data'] is String) {
        data = json['data'];
      } else {
        data = DoctorData.fromJson(json['data']);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    data['message'] = message;
    if (this.data != null) {
          if (this.data is String) {
        data['data'] = this.data;
      } else {
        data['data'] = (this.data as DoctorData).toJson();
      }
    }
    return data;
  }
}

class DoctorData {
  User? user;
  Token? token;

  DoctorData({this.user, this.token});

  DoctorData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (token != null) {
      data['token'] = token!.toJson();
    }
    return data;
  }
}



