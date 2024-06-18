class LoginData {
  bool? ok;
  String? message;
  DoctorData? data;

  LoginData({this.ok, this.message, this.data});

  LoginData.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    data = json['data'] != null ? DoctorData.fromJson(json['data']) : null;
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

class DoctorData {
  User? user;
  String? token;

  DoctorData({this.user, this.token});

  DoctorData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? type;
  String? picture;
  String? email;
  int? emailVerified;
  int? otpVerified;
  String? firstName;
  String? lastName;
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
  int? yearsOfExperience;
  String? clinicAffiliation;
  int? parent;
  String? relationship;
  int? isAdmin;

  User(
      {this.id,
      this.username,
      this.type,
      this.picture,
      this.email,
      this.emailVerified,
      this.otpVerified,
      this.firstName,
      this.lastName,
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
      this.isAdmin});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    type = json['type'];
    picture = json['picture'];
    email = json['email'];
    emailVerified = json['email_verified'];
    otpVerified = json['otp_verified'];
    firstName = json['first_name'];
    lastName = json['last_name'];
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
    isAdmin = json['is_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['type'] = type;
    data['picture'] = picture;
    data['email'] = email;
    data['email_verified'] = emailVerified;
    data['otp_verified'] = otpVerified;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
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
    data['is_admin'] = isAdmin;
    return data;
  }
}
