class PatientsLists {
  bool? ok;
  String? message;
  dynamic data;

  PatientsLists({this.ok, this.message, this.data});

  PatientsLists.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    data = json['data'] != null ? PatientsListsData.fromJson(json['data']) : null;
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

class PatientsListsData {
  List<Patients>? patients;
  Pagination? pagination;

  PatientsListsData({this.patients, this.pagination});

  PatientsListsData.fromJson(Map<String, dynamic> json) {
    if (json['patients'] != null) {
      patients = <Patients>[];
      json['patients'].forEach((v) {
        patients!.add(Patients.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (patients != null) {
      data['patients'] = patients!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Patients {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? picture;

  Patients(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.picture});

  Patients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['email'] = email;
    data['picture'] = picture;
    return data;
  }
}

class Pagination {
  int? total;
  int? pages;
  int? currentPage;
  int? perPage;

  Pagination({this.total, this.pages, this.currentPage, this.perPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pages = json['pages'];
    currentPage = json['currentPage'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   <String, dynamic>{};
    data['total'] = total;
    data['pages'] = pages;
    data['currentPage'] = currentPage;
    data['perPage'] = perPage;
    return data;
  }
}
