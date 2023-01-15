import 'dart:convert';

ModeAlarma? modeFromJson(String str) => ModeAlarma.fromJson(json.decode(str));

String modeToJson(ModeAlarma? data) => json.encode(data!.toJson());

class ModeAlarma {
  ModeAlarma({
    this.code,
    this.message,
    this.data,
  });

  String? code;
  String? message;
  List<DatumModeAlarm?>? data;

  factory ModeAlarma.fromJson(Map<String, dynamic> json) => ModeAlarma(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DatumModeAlarm?>.from(
                json["data"]!.map((x) => DatumModeAlarm.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x!.toJson())),
      };
}

class DatumModeAlarm {
  DatumModeAlarm({
    this.createdAt,
    this.updatedAt,
    this.id,
    this.mode,
    this.v,
  });

  DateTime? createdAt;
  DateTime? updatedAt;
  String? id;
  String? mode;
  int? v;

  factory DatumModeAlarm.fromJson(Map<String, dynamic> json) => DatumModeAlarm(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["_id"],
        mode: json["mode"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "_id": id,
        "mode": mode,
        "__v": v,
      };
}
