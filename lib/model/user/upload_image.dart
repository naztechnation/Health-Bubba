class UploadImage {
  bool? ok;
  String? message;
  UploadImageData? data;

  UploadImage({this.ok, this.message, this.data});

  UploadImage.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    data = json['data'] != null ? UploadImageData.fromJson(json['data']) : null;
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

class UploadImageData {
  String? picture;

  UploadImageData({this.picture});

  UploadImageData.fromJson(Map<String, dynamic> json) {
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['picture'] = picture;
    return data;
  }
}
