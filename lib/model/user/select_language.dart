class SelectLanguage {
  bool? ok;
  dynamic message;

  SelectLanguage({this.ok, this.message});

  SelectLanguage.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    if (json['message'] != null) {
      if (json['message'] is String) {
        message = json['message'];
      } else {
        message = Message.fromJson(json['message']);
      }
    }
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
  SelectLanguageData? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? SelectLanguageData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SelectLanguageData {
  int? languageId;
  String? languageName;

  SelectLanguageData({this.languageId, this.languageName});

  SelectLanguageData.fromJson(Map<String, dynamic> json) {
    languageId = json['language_id'];
    languageName = json['language_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['language_id'] = languageId;
    data['language_name'] = languageName;
    return data;
  }
}
