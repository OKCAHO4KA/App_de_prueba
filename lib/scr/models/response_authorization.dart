import 'dart:convert';

class ResponseAuthorization {
  final Tokens? tokens;
  final User? user;

  ResponseAuthorization({
    this.tokens,
    this.user,
  });

  factory ResponseAuthorization.fromRawJson(String str) =>
      ResponseAuthorization.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResponseAuthorization.fromJson(Map<String, dynamic> json) =>
      ResponseAuthorization(
        tokens: Tokens.fromJson(json["tokens"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "tokens": tokens!.toJson(),
        "user": user!.toJson(),
      };
}

class Tokens {
  final String? accessToken;
  final String? refreshToken;

  Tokens({
    this.accessToken,
    this.refreshToken,
  });

  factory Tokens.fromRawJson(String str) => Tokens.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

class User {
  final int id;
  final String email;
  final String? nickname;

  User({
    required this.id,
    required this.email,
    this.nickname,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        nickname: json["nickname"] ?? 'Пользователь',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "nickname": nickname,
      };
}
