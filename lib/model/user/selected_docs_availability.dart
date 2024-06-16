class GetSelectedAvailability {
  bool? ok;
  String? message;
  List<GetSelectedAvailabilityData>? data;

  GetSelectedAvailability({this.ok, this.message, this.data});

  GetSelectedAvailability.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetSelectedAvailabilityData>[];
      json['data'].forEach((v) {
        data!.add(GetSelectedAvailabilityData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetSelectedAvailabilityData {
  int? id;
  int? doctorId;
  String? dayOfWeek;
  String? startTime;
  String? endTime;

  GetSelectedAvailabilityData({this.id, this.doctorId, this.dayOfWeek, this.startTime, this.endTime});

  GetSelectedAvailabilityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    dayOfWeek = json['day_of_week'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['day_of_week'] = dayOfWeek;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}
