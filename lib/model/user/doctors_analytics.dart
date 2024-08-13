class DoctorsAnalytics {
  bool? ok;
  String? message;
  DoctorsAnalyticsData? data;

  DoctorsAnalytics({this.ok, this.message, this.data});

  DoctorsAnalytics.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    data = json['data'] != null ?   DoctorsAnalyticsData.fromJson(json['data']) : null;
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

class DoctorsAnalyticsData {
  int? prescriptions;
  int? consultations;
  int? revenue;
  int? male;
  int? female;

  DoctorsAnalyticsData(
      {this.prescriptions,
      this.consultations,
      this.revenue,
      this.male,
      this.female});

  DoctorsAnalyticsData.fromJson(Map<String, dynamic> json) {
    prescriptions = json['prescriptions'];
    consultations = json['consultations'];
    revenue = json['revenue'];
    male = json['male'];
    female = json['female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prescriptions'] = prescriptions;
    data['consultations'] = consultations;
    data['revenue'] = revenue;
    data['male'] = male;
    data['female'] = female;
    return data;
  }
}
