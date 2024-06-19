class SelectQualification {
  bool? ok;
  dynamic message;

  SelectQualification({this.ok, this.message});

  SelectQualification.fromJson(Map<String, dynamic> json) {
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
  List<SelectQualificationData>? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <SelectQualificationData>[];
      json['data'].forEach((v) {
        data!.add(SelectQualificationData.fromJson(v));
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

class SelectQualificationData {
  int? userQualificationId;
  int? qualificationId;
  int? userId;

  SelectQualificationData({this.userQualificationId, this.qualificationId, this.userId});

  SelectQualificationData.fromJson(Map<String, dynamic> json) {
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
