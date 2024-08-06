class NotificationSettings {
  bool? ok;
  Message? message;

  NotificationSettings({this.ok, this.message});

  NotificationSettings.fromJson(Map<String, dynamic> json) {
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
  NotificationSettingsData? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? NotificationSettingsData.fromJson(json['data']) : null;
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

class NotificationSettingsData {
  int? id;
  int? userId;
  int? upcomingAppointmentAlert;
  int? medicationsReminder;
  int? orderAlert;

  NotificationSettingsData(
      {this.id,
      this.userId,
      this.upcomingAppointmentAlert,
      this.medicationsReminder,
      this.orderAlert});

  NotificationSettingsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    upcomingAppointmentAlert = json['upcoming_appointment_alert'];
    medicationsReminder = json['medications_reminder'];
    orderAlert = json['order_alert'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['upcoming_appointment_alert'] = upcomingAppointmentAlert;
    data['medications_reminder'] = medicationsReminder;
    data['order_alert'] = orderAlert;
    return data;
  }
}
