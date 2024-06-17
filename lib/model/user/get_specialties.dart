class GetSpecialties {
  bool? ok;
  Message? message;

  GetSpecialties({this.ok, this.message});

  GetSpecialties.fromJson(Map<String, dynamic> json) {
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
  List<GetSpecialtiesData>? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <GetSpecialtiesData>[];
      json['data'].forEach((v) {
        data!.add(GetSpecialtiesData.fromJson(v));
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

class GetSpecialtiesData {
  int? specialtyId;
  String? specialtyName;

  GetSpecialtiesData({this.specialtyId, this.specialtyName});

  GetSpecialtiesData.fromJson(Map<String, dynamic> json) {
    specialtyId = json['specialty_id'];
    specialtyName = json['specialty_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['specialty_id'] = specialtyId;
    data['specialty_name'] = specialtyName;
    return data;
  }
}
