class GetSelectedQualifications {
  bool? ok;
  Message? message;

  GetSelectedQualifications({this.ok, this.message});

  GetSelectedQualifications.fromJson(Map<String, dynamic> json) {
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
  List<GetSelectedQualificationsData>? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <GetSelectedQualificationsData>[];
      json['data'].forEach((v) {
        data!.add(GetSelectedQualificationsData.fromJson(v));
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

class GetSelectedQualificationsData {
  int? userQualificationId;
  int? qualificationId;
  int? userId;

  GetSelectedQualificationsData({this.userQualificationId, this.qualificationId, this.userId});

  GetSelectedQualificationsData.fromJson(Map<String, dynamic> json) {
    userQualificationId = json['user_qualification_id'];
    qualificationId = json['qualification_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_qualification_id'] = userQualificationId;
    data['qualification_id'] = qualificationId;
    data['user_id'] = userId;
    return data;
  }
}
