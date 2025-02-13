class GetBankDetails {
  bool? ok;
  Message? message;

  GetBankDetails({this.ok, this.message});

  GetBankDetails.fromJson(Map<String, dynamic> json) {
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
  BankDetailsData? data;

  Message({this.message, this.data});

  Message.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? BankDetailsData.fromJson(json['data']) : null;
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

class BankDetailsData {
  String? bankName;
  String? bankCode;
  String? accountNumber;
  String? accountName;

  BankDetailsData({this.bankName, this.bankCode, this.accountNumber, this.accountName});

  BankDetailsData.fromJson(Map<String, dynamic> json) {
    bankName = json['bank_name'];
    bankCode = json['bank_code'];
    accountNumber = json['account_number'];
    accountName = json['account_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bank_name'] = bankName;
    data['bank_code'] = bankCode;
    data['account_number'] = accountNumber;
    data['account_name'] = accountName;
    return data;
  }
}
