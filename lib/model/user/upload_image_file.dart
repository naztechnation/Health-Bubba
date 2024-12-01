class UploadDoc {
  bool? ok;
  String? message;
  ImageData? data;

  UploadDoc({this.ok, this.message, this.data});

  UploadDoc.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    data = json['data'] != null ?   ImageData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =    <String, dynamic>{};
    data['ok'] = ok;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ImageData {
  String? picture;

  ImageData({this.picture});

  ImageData.fromJson(Map<String, dynamic> json) {
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['picture'] = picture;
    return data;
  }
}
