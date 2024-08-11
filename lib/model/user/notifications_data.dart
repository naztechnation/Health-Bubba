class NotificationsData {
  bool? ok;
  String? message;
  List<NotifyData>? data;

  NotificationsData({this.ok, this.message, this.data});

  NotificationsData.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    if (json['data'] != null) {
      data = <NotifyData>[];
      json['data'].forEach((v) {
        data!.add(NotifyData.fromJson(v));
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

class NotifyData {
  int? id;
  int? userId;
  String? title;
  String? description;
  String? type;
  int? read;
  String? date;

  NotifyData(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.type,
      this.read,
      this.date});

  NotifyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    read = json['read'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    data['read'] = read;
    data['date'] = date;
    return data;
  }
}
