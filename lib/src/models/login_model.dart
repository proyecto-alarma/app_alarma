// To parse this JSON data, do
//
//     final LoginModel = LoginModelFromJson(jsonString);

import 'dart:convert';

LoginModel? LoginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String LoginModelToJson(LoginModel? data) => json.encode(data!.toJson());

class LoginModel {
  LoginModel({
    this.code,
    this.message,
    this.data,
  });

  String? code;
  String? message;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"] ?? "",
        message: json["message"] ?? "",
        data: json["data"] == null
            ? Data.fromJson({})
            : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.token,
  });

  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
