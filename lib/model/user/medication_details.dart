class MedicationDetails {
  bool? ok;
  String? message;
  List<MedicationDetailsData>? data;

  MedicationDetails({this.ok, this.message, this.data});

  MedicationDetails.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MedicationDetailsData>[];
      json['data'].forEach((v) {
        data!.add(MedicationDetailsData.fromJson(v));
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

class MedicationDetailsData {
  int? id;
  int? doctorId;
  int? patientId;
  String? medicationName;
  int? medicationId;
  String? category;
  int? administrationRouteId;
  String? dosage;
  String? notes;
  String? durationStartTime;
  String? durationEndTime;
  String? toBeTaken;
  String? frequency;
  int? patientMedicationId;
  String? patientUsername;
  String? patientFirstName;
  String? patientLastName;
  String? patientEmail;
  String? patientPhone;
  String? administrationRouteName;
  int? medicationTimeId;
  String? medicationTime;
  int? medicationDayId;
  String? medicationDay;
  List<MedicationTimes>? medicationTimes;
  List<MedicationDays>? medicationDays;

  MedicationDetailsData(
      {this.id,
      this.doctorId,
      this.patientId,
      this.medicationName,
      this.medicationId,
      this.category,
      this.administrationRouteId,
      this.dosage,
      this.notes,
      this.durationStartTime,
      this.durationEndTime,
      this.toBeTaken,
      this.frequency,
      this.patientMedicationId,
      this.patientUsername,
      this.patientFirstName,
      this.patientLastName,
      this.patientEmail,
      this.patientPhone,
      this.administrationRouteName,
      this.medicationTimeId,
      this.medicationTime,
      this.medicationDayId,
      this.medicationDay,
      this.medicationTimes,
      this.medicationDays});

  MedicationDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    medicationName = json['medication_name'];
    medicationId = json['medication_id'];
    category = json['category'];
    administrationRouteId = json['administration_route_id'];
    dosage = json['dosage'];
    notes = json['notes'];
    durationStartTime = json['duration_start_time'];
    durationEndTime = json['duration_end_time'];
    toBeTaken = json['to_be_taken'];
    frequency = json['frequency'];
    patientMedicationId = json['patient_medication_id'];
    patientUsername = json['patient_username'];
    patientFirstName = json['patient_first_name'];
    patientLastName = json['patient_last_name'];
    patientEmail = json['patient_email'];
    patientPhone = json['patient_phone'];
    administrationRouteName = json['administration_route_name'];
    medicationTimeId = json['medication_time_id'];
    medicationTime = json['medication_time'];
    medicationDayId = json['medication_day_id'];
    medicationDay = json['medication_day'];
    if (json['medication_times'] != null) {
      medicationTimes = <MedicationTimes>[];
      json['medication_times'].forEach((v) {
        medicationTimes!.add(MedicationTimes.fromJson(v));
      });
    }
    if (json['medication_days'] != null) {
      medicationDays = <MedicationDays>[];
      json['medication_days'].forEach((v) {
        medicationDays!.add(MedicationDays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['patient_id'] = patientId;
    data['medication_name'] = medicationName;
    data['medication_id'] = medicationId;
    data['category'] = category;
    data['administration_route_id'] = administrationRouteId;
    data['dosage'] = dosage;
    data['notes'] = notes;
    data['duration_start_time'] = durationStartTime;
    data['duration_end_time'] = durationEndTime;
    data['to_be_taken'] = toBeTaken;
    data['frequency'] = frequency;
    data['patient_medication_id'] = patientMedicationId;
    data['patient_username'] = patientUsername;
    data['patient_first_name'] = patientFirstName;
    data['patient_last_name'] = patientLastName;
    data['patient_email'] = patientEmail;
    data['patient_phone'] = patientPhone;
    data['administration_route_name'] = administrationRouteName;
    data['medication_time_id'] = medicationTimeId;
    data['medication_time'] = medicationTime;
    data['medication_day_id'] = medicationDayId;
    data['medication_day'] = medicationDay;
    if (medicationTimes != null) {
      data['medication_times'] =
          medicationTimes!.map((v) => v.toJson()).toList();
    }
    if (medicationDays != null) {
      data['medication_days'] =
          medicationDays!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MedicationTimes {
  int? id;
  String? time;

  MedicationTimes({this.id, this.time});

  MedicationTimes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['time'] = time;
    return data;
  }
}

class MedicationDays {
  int? id;
  String? day;

  MedicationDays({this.id, this.day});

  MedicationDays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    return data;
  }
}
