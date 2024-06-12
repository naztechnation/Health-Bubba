

class Token {
  int? id;
  int? userId;
  String? accessToken;
  String? accessTokenExpires;

  Token({this.id, this.userId, this.accessToken, this.accessTokenExpires});

  Token.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    accessToken = json['access_token'];
    accessTokenExpires = json['access_token_expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['access_token'] = accessToken;
    data['access_token_expires'] = accessTokenExpires;
    return data;
  }
}
