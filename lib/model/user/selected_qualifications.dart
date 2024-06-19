class GetSelectedQualifications {
  bool? ok;
  dynamic message;

  GetSelectedQualifications({this.ok, this.message});

  GetSelectedQualifications.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
   if (json['message'] != null) {
      if (json['message'] is String) {
        message = json['message'];
      } else {
        message = Message.fromJson(json['message']);
      }
    }
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
  String? qualificationName;

  GetSelectedQualificationsData(
      {this.userQualificationId,
      this.qualificationId,
      this.userId,
      this.qualificationName});

  GetSelectedQualificationsData.fromJson(Map<String, dynamic> json) {
    userQualificationId = json['user_qualification_id'];
    qualificationId = json['qualification_id'];
    userId = json['user_id'];
    qualificationName = json['qualification_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_qualification_id'] = userQualificationId;
    data['qualification_id'] = qualificationId;
    data['user_id'] = userId;
    data['qualification_name'] = qualificationName;
    return data;
  }
}
