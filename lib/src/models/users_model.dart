// To parse this JSON data, do
//
//     final UsersModel = UsersModelFromJson(jsonString);

import 'dart:convert';

// ignore: non_constant_identifier_names
UsersModel? UsersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String UsersModelToJson(UsersModel? data) => json.encode(data!.toJson());

class UsersModel {
  UsersModel({
    this.code,
    this.message,
    this.data,
  });

  String? code;
  String? message;
  List<Datum?>? data;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.email,
    this.uid,
    this.role,
    this.v,
    this.token,
  });

  String? id;
  String? name;
  String? email;
  String? uid;
  String? role;
  int? v;
  String? token;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        uid: json["uid"],
        role: json["role"],
        v: json["__v"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "uid": uid,
        "role": role,
        "__v": v,
        "token": token,
      };
}
