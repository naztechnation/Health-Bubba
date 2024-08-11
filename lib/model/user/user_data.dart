import '../patients/appointment_lists.dart';
import '../patients/patients_details.dart';

class UserData {
  bool? ok;
  String? message;
  List<MyData>? data;

  UserData({this.ok, this.message, this.data});

  UserData.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MyData>[];
      json['data'].forEach((v) {
        data!.add(MyData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyData {
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
  int? yearsOfExperience;
  String? clinicAffiliation;
  int? parent;
  String? relationship;
  String? type;
  int? isAdmin;
  List<CurrentMedications>? currentMedications;
  List<HealthConditions>? healthConditions;
  String? lastAppointmentDate;
  String? nextAppointmentDate;
  List<AppointmentListsData>? upcomingAppointments;
  int? upcomingAppointmentsCount;
  int? consultationsCount;

  MyData(
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
      this.healthConditions,
      this.lastAppointmentDate,
      this.nextAppointmentDate,
      this.upcomingAppointments,
      this.upcomingAppointmentsCount,
      this.consultationsCount});

  MyData.fromJson(Map<String, dynamic> json) {
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
    lastAppointmentDate = json['last_appointment_date'];
    nextAppointmentDate = json['next_appointment_date'];
    if (json['upcoming_appointments'] != null) {
      upcomingAppointments = <AppointmentListsData>[];
      json['upcoming_appointments'].forEach((v) {
        upcomingAppointments!.add(AppointmentListsData.fromJson(v));
      });
    }
    upcomingAppointmentsCount = json['upcoming_appointments_count'];
    consultationsCount = json['consultations_count'];
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
    data['last_appointment_date'] = lastAppointmentDate;
    data['next_appointment_date'] = nextAppointmentDate;
    if (upcomingAppointments != null) {
      data['upcoming_appointments'] =
          upcomingAppointments!.map((v) => v.toJson()).toList();
    }
    data['upcoming_appointments_count'] = upcomingAppointmentsCount;
    data['consultations_count'] = consultationsCount;
    return data;
  }
}

class UpcomingAppointments {
  int? appointmentId;
  String? date;
  String? time;
  int? status;
  int? patientId;
  String? patientName;
  String? patientPicture;
  int? doctorId;
  String? doctorName;
  String? doctorPicture;

  UpcomingAppointments(
      {this.appointmentId,
      this.date,
      this.time,
      this.status,
      this.patientId,
      this.patientName,
      this.patientPicture,
      this.doctorId,
      this.doctorName,
      this.doctorPicture});

  UpcomingAppointments.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointment_id'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    patientPicture = json['patient_picture'];
    doctorId = json['doctor_id'];
    doctorName = json['doctor_name'];
    doctorPicture = json['doctor_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appointment_id'] = appointmentId;
    data['date'] = date;
    data['time'] = time;
    data['status'] = status;
    data['patient_id'] = patientId;
    data['patient_name'] = patientName;
    data['patient_picture'] = patientPicture;
    data['doctor_id'] = doctorId;
    data['doctor_name'] = doctorName;
    data['doctor_picture'] = doctorPicture;
    return data;
  }
}
