class GetProfileStatus {
  bool? ok;
  String? message;
  GetProfileStatusData? data;

  GetProfileStatus({this.ok, this.message, this.data});

  GetProfileStatus.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    data = json['data'] != null ? GetProfileStatusData.fromJson(json['data']) : null;
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

class GetProfileStatusData {
  bool? bio;
  bool? language;
  bool? availability;
  bool? specialty;
  bool? consultationFee;

  GetProfileStatusData(
      {this.bio,
      this.language,
      this.availability,
      this.specialty,
      this.consultationFee});

  GetProfileStatusData.fromJson(Map<String, dynamic> json) {
    bio = json['bio'];
    language = json['language'];
    availability = json['availability'];
    specialty = json['specialty'];
    consultationFee = json['consultationFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bio'] = bio;
    data['language'] = language;
    data['availability'] = availability;
    data['specialty'] = specialty;
    data['consultationFee'] = consultationFee;
    return data;
  }
}
