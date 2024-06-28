class AdministeredRoute {
  bool? ok;
  String? message;
  List<AdministeredRouteData>? data;

  AdministeredRoute({this.ok, this.message, this.data});

  AdministeredRoute.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AdministeredRouteData>[];
      json['data'].forEach((v) {
        data!.add(AdministeredRouteData.fromJson(v));
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

class AdministeredRouteData {
  int? id;
  String? name;

  AdministeredRouteData({this.id, this.name});

  AdministeredRouteData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
