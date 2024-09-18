class SelectedUserSpecialties {
  bool? ok;
  Message? message;

  SelectedUserSpecialties({this.ok, this.message});

  SelectedUserSpecialties.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message =
        json['message'] != null ? new Message.fromJson(json['message']) : null;
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
  List<SelectedUserSpecialtiesData>? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <SelectedUserSpecialtiesData>[];
      json['data'].forEach((v) {
        data!.add(  SelectedUserSpecialtiesData.fromJson(v));
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

class SelectedUserSpecialtiesData {
  int? userSpecialtyId;
  int? specialtyId;
  int? userId;
  String? specialtyName;

  SelectedUserSpecialtiesData(
      {this.userSpecialtyId,
      this.specialtyId,
      this.userId,
      this.specialtyName});

  SelectedUserSpecialtiesData.fromJson(Map<String, dynamic> json) {
    userSpecialtyId = json['user_specialty_id'];
    specialtyId = json['specialty_id'];
    userId = json['user_id'];
    specialtyName = json['specialty_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_specialty_id'] = userSpecialtyId;
    data['specialty_id'] = specialtyId;
    data['user_id'] = userId;
    data['specialty_name'] = specialtyName;
    return data;
  }
}
