class AppointmentLists {
  bool? ok;
  Message? message;

  AppointmentLists({this.ok, this.message});

  AppointmentLists.fromJson(Map<String, dynamic> json) {
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
  List<AppointmentListsData>? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <AppointmentListsData>[];
      json['data'].forEach((v) {
        data!.add(AppointmentListsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppointmentListsData {
  int? appointmentId;
  int? patientId;
  int? doctorId;
  String? date;
  String? time;
  String? complain;
  int? status;
  String? patientFirstName;
  String? patientLastName;
  String? patientEmail;
  String? patientPicture;
  List<String>? images;

  AppointmentListsData(
      {this.appointmentId,
      this.patientId,
      this.doctorId,
      this.date,
      this.time,
      this.complain,
      this.status,
      this.patientFirstName,
      this.patientLastName,
      this.patientEmail,
      this.patientPicture,
      this.images});

  AppointmentListsData.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointment_id'];
    patientId = json['patient_id'];
    doctorId = json['doctor_id'];
    date = json['date'];
    time = json['time'];
    complain = json['complain'];
    status = json['status'];
    patientFirstName = json['patient_first_name'];
    patientLastName = json['patient_last_name'];
    patientEmail = json['patient_email'];
    patientPicture = json['patient_picture'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointment_id'] = appointmentId;
    data['patient_id'] = patientId;
    data['doctor_id'] = doctorId;
    data['date'] = date;
    data['time'] = time;
    data['complain'] = complain;
    data['status'] = status;
    data['patient_first_name'] = patientFirstName;
    data['patient_last_name'] = patientLastName;
    data['patient_email'] = patientEmail;
    data['patient_picture'] = patientPicture;
    data['images'] = images;
    return data;
  }
}
