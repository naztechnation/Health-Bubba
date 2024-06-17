class UpdateUser {
  bool? ok;
  String? message;
  int? data;

  UpdateUser({this.ok, this.message, this.data});

  UpdateUser.fromJson(Map<String, dynamic> json) {
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
