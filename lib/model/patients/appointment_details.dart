class AppointmentDetails {
  bool? ok;
  Message? message;

  AppointmentDetails({this.ok, this.message});

  AppointmentDetails.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    if (message != null) {
      data['message'] = message!.toJson();
    }
    return data;
  }
}

class Message {
  String? message;
  AppointmentDetailsData? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? AppointmentDetailsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AppointmentDetailsData {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic dob;
  dynamic weight;
  dynamic sex;
  String? date;
  String? time;
  String? complain;
  String? healthConditions;

  AppointmentDetailsData(
      {this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.dob,
      this.weight,
      this.sex,
      this.date,
      this.time,
      this.complain,
      this.healthConditions});

  AppointmentDetailsData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    dob = json['dob'];
    weight = json['weight'];
    sex = json['sex'];
    date = json['date'];
    time = json['time'];
    complain = json['complain'];
    healthConditions = json['health_conditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['dob'] = dob;
    data['weight'] = weight;
    data['sex'] = sex;
    data['date'] = date;
    data['time'] = time;
    data['complain'] = complain;
    data['health_conditions'] = healthConditions;
    return data;
  }
}
