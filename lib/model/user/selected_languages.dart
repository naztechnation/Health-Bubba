class SelectedLanguages {
  bool? ok;
  Message? message;

  SelectedLanguages({this.ok, this.message});

  SelectedLanguages.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
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
  List<SelectedLanguagesData>? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <SelectedLanguagesData>[];
      json['data'].forEach((v) {
        data!.add(SelectedLanguagesData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SelectedLanguagesData {
  int? userLanguageId;
  int? languageId;
  int? userId;
  String? username;
  String? languageName;

  SelectedLanguagesData(
      {this.userLanguageId,
      this.languageId,
      this.userId,
      this.username,
      this.languageName});

  SelectedLanguagesData.fromJson(Map<String, dynamic> json) {
    userLanguageId = json['user_language_id'];
    languageId = json['language_id'];
    userId = json['user_id'];
    username = json['username'];
    languageName = json['language_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_language_id'] = userLanguageId;
    data['language_id'] = languageId;
    data['user_id'] = userId;
    data['username'] = username;
    data['language_name'] = languageName;
    return data;
  }
}
