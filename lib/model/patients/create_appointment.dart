class CreateAppointment {
  bool? ok;
  String? message;

  CreateAppointment({this.ok, this.message});

  CreateAppointment.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message =
        json['message'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    data['message'] = message;
    return data;
  }
}

class Message {
  String? message;
  int? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
