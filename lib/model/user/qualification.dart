class Qualification {
  bool? ok;
  Message? message;

  Qualification({this.ok, this.message});

  Qualification.fromJson(Map<String, dynamic> json) {
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
  List<QualificationData>? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <QualificationData>[];
      json['data'].forEach((v) {
        data!.add(QualificationData.fromJson(v));
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

class QualificationData {
  int? qualificationId;
  String? qualificationName;

  QualificationData({this.qualificationId, this.qualificationName});

  QualificationData.fromJson(Map<String, dynamic> json) {
    qualificationId = json['qualification_id'];
    qualificationName = json['qualification_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['qualification_id'] = qualificationId;
    data['qualification_name'] = qualificationName;
    return data;
  }
}
