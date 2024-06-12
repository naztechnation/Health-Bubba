import '../token/token.dart';
import '../user/user.dart';

class VerifyOtp {
  bool? ok;
  String? message;
  DoctorData? data;

  VerifyOtp({this.ok, this.message, this.data});

  VerifyOtp.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    data = json['data'] != null ? DoctorData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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



