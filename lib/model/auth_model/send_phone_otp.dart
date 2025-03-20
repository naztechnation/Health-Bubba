

class PhoneOtp {
  bool? ok;
  String? message;
  var data;

  PhoneOtp({this.ok, this.message, this.data});

  PhoneOtp.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
