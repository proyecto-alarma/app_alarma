// To parse this JSON data, do
//
//     final reportModel = reportModelFromJson(jsonString);

import 'dart:convert';

ReportModel? reportModelFromJson(String str) =>
    ReportModel.fromJson(json.decode(str));

String reportModelToJson(ReportModel? data) => json.encode(data!.toJson());

class ReportModel {
  ReportModel({
    this.code,
    this.message,
    this.data,
  });

  String? code;
  String? message;
  Data? data;

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.total,
    this.modes,
  });

  int? total;
  List<Mode?>? modes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        modes: json["modes"] == null
            ? []
            : List<Mode?>.from(json["modes"]!.map((x) => Mode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "modes": modes == null
            ? []
            : List<dynamic>.from(modes!.map((x) => x!.toJson())),
      };
}

class Mode {
  Mode({
    this.id,
    this.status,
    this.mode,
    this.detail,
    this.dateUpd,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? status;
  String? mode;
  String? detail;
  DateTime? dateUpd;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Mode.fromJson(Map<String, dynamic> json) => Mode(
        id: json["_id"],
        status: json["status"],
        mode: json["mode"],
        detail: json["detail"],
        dateUpd: DateTime.parse(json["dateUpd"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "status": status,
        "mode": mode,
        "detail": detail,
        "dateUpd": dateUpd?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
