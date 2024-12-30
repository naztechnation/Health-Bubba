class UserData {
	bool? ok;
	String? message;
	MyData? data;

	UserData({this.ok, this.message, this.data});

	UserData.fromJson(Map<String, dynamic> json) {
		ok = json['ok'];
		message = json['message'];
		data = json['data'] != null ? new MyData.fromJson(json['data']) : null;
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

class MyData {
	int? id;
	var username;
	var appleId;
	String? picture;
	String? email;
	int? emailVerified;
	int? otpVerified;
	String? firstName;
	String? lastName;
	String? fcmToken;
	String? phone;
	var dob;
	var sex;
	var address;
	var latitude;
	var longitude;
	String? bio;
	String? licenceNumber;
	int? licenceNumberVerified;
	String? title;
	int? yearsOfExperience;
	String? clinicAffiliation;
	var parent;
	var relationship;
	String? type;
	String? loginType;
	String? doctorsLicense;
	String? otherDocuments;
	int? isAdmin;
	int? isDoctorVerified;
	String? password;
	String? createdAt;
	String? updatedAt;
	var weight;
	var referralCode;
	var height;
	var weightUnit;
	var heightUnit;
 
	 

	MyData({this.id,
   this.username,
   this.appleId, 
   this.doctorsLicense, 
   this.picture, 
   this.otherDocuments, 
   this.email, 
   this.emailVerified, 
   this.otpVerified, this.firstName, 
   this.lastName, this.fcmToken, this.phone, 
   this.dob, this.sex,
   this.address, this.latitude, this.longitude, 
   this.bio, this.licenceNumber, this.licenceNumberVerified, 
   this.title, this.yearsOfExperience, this.clinicAffiliation, 
   this.parent, this.relationship, this.type, this.loginType, 
   this.isAdmin, this.isDoctorVerified, this.password, this.createdAt,
    this.updatedAt, this.weight, this.referralCode, this.height, 
    this.weightUnit, this.heightUnit, });

	MyData.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		username = json['username'];
		appleId = json['apple_id'];
		picture = json['picture'];
		email = json['email'];
		doctorsLicense = json['doctor_license'];
		otherDocuments = json['other_document'];
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
		isDoctorVerified = json['is_doctor_verified'];
		password = json['password'];
		createdAt = json['created_at'];
		updatedAt = json['updated_at'];
		weight = json['weight'];
		referralCode = json['referral_code'];
		height = json['height'];
		weightUnit = json['weight_unit'];
		heightUnit = json['height_unit'];
		  
		 
		 
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['id'] = id;
		data['username'] = username;
		data['apple_id'] = appleId;
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
		data['is_doctor_verified'] = isDoctorVerified;
		data['password'] = password;
		data['created_at'] = createdAt;
		data['updated_at'] = updatedAt;
		data['weight'] = weight;
		data['referral_code'] = referralCode;
		data['height'] = height;
		data['weight_unit'] = weightUnit;
		data['height_unit'] = heightUnit;
	 
	 
		return data;
	}
}

 
