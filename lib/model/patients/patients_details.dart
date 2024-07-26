class PatientDetails {
  bool? ok;
  String? message;
  PatientDetailsData? data;

  PatientDetails({this.ok, this.message, this.data});

  PatientDetails.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    data = json['data'] != null ? PatientDetailsData.fromJson(json['data']) : null;
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

class PatientDetailsData {
  List<Patients>? patients;
  Pagination? pagination;

  PatientDetailsData({this.patients, this.pagination});

  PatientDetailsData.fromJson(Map<String, dynamic> json) {
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
  String? username;
  String? picture;
  String? email;
  int? emailVerified;
  int? otpVerified;
  String? firstName;
  String? lastName;
  String? fcmToken;
  String? phone;
  String? dob;
  String? sex;
  String? address;
  String? latitude;
  String? longitude;
  String? bio;
  String? licenceNumber;
  int? licenceNumberVerified;
  String? title;
  String? yearsOfExperience;
  String? clinicAffiliation;
  int? parent;
  String? relationship;
  String? type;
  int? isAdmin;
  List<CurrentMedications>? currentMedications;
  List<HealthConditions>? healthConditions;

  Patients(
      {this.id,
      this.username,
      this.picture,
      this.email,
      this.emailVerified,
      this.otpVerified,
      this.firstName,
      this.lastName,
      this.fcmToken,
      this.phone,
      this.dob,
      this.sex,
      this.address,
      this.latitude,
      this.longitude,
      this.bio,
      this.licenceNumber,
      this.licenceNumberVerified,
      this.title,
      this.yearsOfExperience,
      this.clinicAffiliation,
      this.parent,
      this.relationship,
      this.type,
      this.isAdmin,
      this.currentMedications,
      this.healthConditions});

  Patients.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    picture = json['picture'];
    email = json['email'];
    emailVerified = json['email_verified'];
    otpVerified = json['otp_verified'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fcmToken = json['fcm_token'];
    phone = json['phone'];
    dob = json['dob'];
    sex = json['sex'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    bio = json['bio'];
    licenceNumber = json['licence_number'];
    licenceNumberVerified = json['licence_number_verified'];
    title = json['title'];
    yearsOfExperience = json['years_of_experience'];
    clinicAffiliation = json['clinic_affiliation'];
    parent = json['parent'];
    relationship = json['relationship'];
    type = json['type'];
    isAdmin = json['is_admin'];
     if (json['current_medications'] != null) {
      currentMedications = <CurrentMedications>[];
      json['current_medications'].forEach((v) {
        currentMedications!.add(CurrentMedications.fromJson(v));
      });
    }
    if (json['health_conditions'] != null) {
      healthConditions = <HealthConditions>[];
      json['health_conditions'].forEach((v) {
        healthConditions!.add(HealthConditions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['picture'] = picture;
    data['email'] = email;
    data['email_verified'] = emailVerified;
    data['otp_verified'] = otpVerified;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['fcm_token'] = fcmToken;
    data['phone'] = phone;
    data['dob'] = dob;
    data['sex'] = sex;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['bio'] = bio;
    data['licence_number'] = licenceNumber;
    data['licence_number_verified'] = licenceNumberVerified;
    data['title'] = title;
    data['years_of_experience'] = yearsOfExperience;
    data['clinic_affiliation'] = clinicAffiliation;
    data['parent'] = parent;
    data['relationship'] = relationship;
    data['type'] = type;
    data['is_admin'] = isAdmin;
   if (currentMedications != null) {
      data['current_medications'] =
          currentMedications!.map((v) => v.toJson()).toList();
    }
    if (healthConditions != null) {
      data['health_conditions'] =
          healthConditions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentMedications {
  int? id;
  String? medicationName;
  String? durationStartTime;
  String? durationEndTime;

  CurrentMedications(
      {this.id,
      this.medicationName,
      this.durationStartTime,
      this.durationEndTime});

  CurrentMedications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicationName = json['medication_name'];
    durationStartTime = json['duration_start_time'];
    durationEndTime = json['duration_end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['medication_name'] = medicationName;
    data['duration_start_time'] = durationStartTime;
    data['duration_end_time'] = durationEndTime;
    return data;
  }
}

class HealthConditions {
  int? userHealthConditionId;
  int? healthConditionId;
  int? userId;
  String? healthConditionName;

  HealthConditions(
      {this.userHealthConditionId,
      this.healthConditionId,
      this.userId,
      this.healthConditionName});

  HealthConditions.fromJson(Map<String, dynamic> json) {
    userHealthConditionId = json['user_health_condition_id'];
    healthConditionId = json['health_condition_id'];
    userId = json['user_id'];
    healthConditionName = json['health_condition_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_health_condition_id'] = userHealthConditionId;
    data['health_condition_id'] = healthConditionId;
    data['user_id'] = userId;
    data['health_condition_name'] = healthConditionName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['pages'] = pages;
    data['currentPage'] = currentPage;
    data['perPage'] = perPage;
    return data;
  }
}
