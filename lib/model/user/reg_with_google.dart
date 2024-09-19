class RegWithGoogle {
  bool? ok;
  String? message;
  RegWithGoogleData? data;

  RegWithGoogle({this.ok, this.message, this.data});

  RegWithGoogle.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    data = json['data'] != null ?   RegWithGoogleData.fromJson(json['data']) : null;
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

class RegWithGoogleData {
  User? user;
  Token? token;

  RegWithGoogleData({this.user, this.token});

  RegWithGoogleData.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (token != null) {
      data['token'] = token!.toJson();
    }
    return data;
  }
}

class User {
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
  dynamic dob;
  dynamic sex;
  String? address;
  String? latitude;
  String? longitude;
  String? bio;
  dynamic licenceNumber;
  int? licenceNumberVerified;
  String? title;
  dynamic yearsOfExperience;
  String? clinicAffiliation;
  int? parent;
  String? relationship;
  String? type;
  String? loginType;
  int? isAdmin;

  User(
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
      this.loginType,
      this.isAdmin});

  User.fromJson(Map<String, dynamic> json) {
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
    loginType = json['login_type'];
    isAdmin = json['is_admin'];
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
    data['login_type'] = loginType;
    data['is_admin'] = isAdmin;
    return data;
  }
}

class Token {
  int? id;
  int? userId;
  String? accessToken;
  String? accessTokenExpires;

  Token({this.id, this.userId, this.accessToken, this.accessTokenExpires});

  Token.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    accessToken = json['access_token'];
    accessTokenExpires = json['access_token_expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['access_token'] = accessToken;
    data['access_token_expires'] = accessTokenExpires;
    return data;
  }
}
