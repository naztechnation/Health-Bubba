


class User {
  int? id;
  String? username;
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
  int? parent;
  String? relationship;
  String? type;
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
      this.phone,
      this.dob,
      this.sex,
      this.address,
      this.latitude,
      this.longitude,
      this.bio,
      this.licenceNumber,
      this.licenceNumberVerified,
      this.parent,
      this.relationship,
      this.type,
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
    phone = json['phone'];
    dob = json['dob'];
    sex = json['sex'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    bio = json['bio'];
    licenceNumber = json['licence_number'];
    licenceNumberVerified = json['licence_number_verified'];
    parent = json['parent'];
    relationship = json['relationship'];
    type = json['type'];
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
    data['phone'] = phone;
    data['dob'] = dob;
    data['sex'] = sex;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['bio'] = bio;
    data['licence_number'] = licenceNumber;
    data['licence_number_verified'] = licenceNumberVerified;
    data['parent'] = parent;
    data['relationship'] = relationship;
    data['type'] = type;
    data['is_admin'] = isAdmin;
    return data;
  }
}