class CancelAppointment {
  bool? ok;
  Message? message;

  CancelAppointment({this.ok, this.message});

  CancelAppointment.fromJson(Map<String, dynamic> json) {
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
  CancelAppointmentData? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? CancelAppointmentData.fromJson(json['data']) : null;
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

class CancelAppointmentData {
  int? appointmentId;
  int? patientId;
  int? doctorId;
  String? date;
  String? time;
  String? complain;
  int? status;

  CancelAppointmentData(
      {this.appointmentId,
      this.patientId,
      this.doctorId,
      this.date,
      this.time,
      this.complain,
      this.status});

  CancelAppointmentData.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointment_id'];
    patientId = json['patient_id'];
    doctorId = json['doctor_id'];
    date = json['date'];
    time = json['time'];
    complain = json['complain'];
    status = json['status'];
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
    return data;
  }
}
