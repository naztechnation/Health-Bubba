class Banks {
  bool? ok;
  Message? message;

  Banks({this.ok, this.message});

  Banks.fromJson(Map<String, dynamic> json) {
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
  List<BanksData>? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <BanksData>[];
      json['data'].forEach((v) {
        data!.add(BanksData.fromJson(v));
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

class BanksData {
  int? id;
  String? name;
  String? slug;
  String? code;
  String? longcode;
  String? gateway;
  bool? payWithBank;
  bool? supportsTransfer;
  bool? active;
  String? country;
  String? currency;
  String? type;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  BanksData(
      {this.id,
      this.name,
      this.slug,
      this.code,
      this.longcode,
      this.gateway,
      this.payWithBank,
      this.supportsTransfer,
      this.active,
      this.country,
      this.currency,
      this.type,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});

  BanksData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    code = json['code'];
    longcode = json['longcode'];
    gateway = json['gateway'];
    payWithBank = json['pay_with_bank'];
    supportsTransfer = json['supports_transfer'];
    active = json['active'];
    country = json['country'];
    currency = json['currency'];
    type = json['type'];
    isDeleted = json['is_deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['code'] = code;
    data['longcode'] = longcode;
    data['gateway'] = gateway;
    data['pay_with_bank'] = payWithBank;
    data['supports_transfer'] = supportsTransfer;
    data['active'] = active;
    data['country'] = country;
    data['currency'] = currency;
    data['type'] = type;
    data['is_deleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
