class SelectSpecialties {
  bool? ok;
  dynamic message; 

  SelectSpecialties({this.ok, this.message});

  SelectSpecialties.fromJson(Map<String, dynamic> json) {
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
      if (message is String) {
        data['message'] = message;
      } else if (message is Message) {
        data['message'] = (message as Message).toJson();
      }
    }
    return data;
  }
}

class Message {
  String? message;
  List<SelectSpecialtiesData>? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <SelectSpecialtiesData>[];
      json['data'].forEach((v) {
        data!.add(SelectSpecialtiesData.fromJson(v));
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

class SelectSpecialtiesData {
  int? userSpecialtyId;
  int? specialtyId;
  int? userId;

  SelectSpecialtiesData({this.userSpecialtyId, this.specialtyId, this.userId});

  SelectSpecialtiesData.fromJson(Map<String, dynamic> json) {
    userSpecialtyId = json['user_specialty_id'];
    specialtyId = json['specialty_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_specialty_id'] = userSpecialtyId;
    data['specialty_id'] = specialtyId;
    data['user_id'] = userId;
    return data;
  }
}
