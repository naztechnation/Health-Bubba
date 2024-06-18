class BankDetails {
  bool? ok;
  dynamic message; 

  BankDetails({this.ok, this.message});

  BankDetails.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    if (json['message'] != null) {
      if (json['message'] is Map<String, dynamic>) {
        message = Message.fromJson(json['message']);
      } else if (json['message'] is String) {
        message = json['message'];
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ok'] = ok;
    if (message != null) {
      if (message is Message) {
        data['message'] = (message as Message).toJson();
      } else if (message is String) {
        data['message'] = message;
      }
    }
    return data;
  }
}

class Message {
  String? message;
  List<BankDetailsData>? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <BankDetailsData>[];
      json['data'].forEach((v) {
        data!.add(BankDetailsData.fromJson(v));
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

class BankDetailsData {
  int? id;
  String? bankName;
  String? accountNumber;
  String? accountName;
  int? userId;

  BankDetailsData(
      {this.id,
      this.bankName,
      this.accountNumber,
      this.accountName,
      this.userId});

  BankDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bank_name'];
    accountNumber = json['account_number'];
    accountName = json['account_name'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bank_name'] = bankName;
    data['account_number'] = accountNumber;
    data['account_name'] = accountName;
    data['user_id'] = userId;
    return data;
  }
}
