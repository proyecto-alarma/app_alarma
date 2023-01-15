import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project/src/models/model_alarma_model.dart';
import 'package:project/src/models/report_model.dart';

class ModeAlarmaProvider {
  final _dio = Dio();

  Future<ModeAlarma> getModelAlarma() async {
    ModeAlarma modeAlarma = ModeAlarma();
    try {
      await Future.delayed(
        const Duration(seconds: 3),
      );
      const url = "http://192.168.201.101:3000/api/v1/mode/get-mode";
      final result = await _dio.get(url);
      modeAlarma = ModeAlarma.fromJson(result.data);
    } on DioError catch (e) {
      log("$e .....", name: "error 1 getMode alarma");
    } catch (e) {
      log("$e .....", name: "error 2 getMode alarma");
    }
    return modeAlarma;
  }

  Future<ReportModel> report() async {
    ReportModel reportModel = ReportModel();
    try {
      const url = "http://192.168.201.101:3000/api/v1/alarma/report";
      final getReport = await _dio.get(url);

      reportModel = ReportModel.fromJson(getReport.data);
    } on DioError catch (e) {
      log("$e .....", name: "error 1 getReport alarma");
    } catch (e) {
      log("$e .....", name: "error 2 getReport alarma");
    }

    return reportModel;
  }
}
