import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project/src/core/shared/preferences/preferences.dart';

import '../core/errors/erros.dart';
import '../models/users_model.dart';

class UserProvider {
  final _dio = Dio();
  Future<bool> addCollaborator({
    required String name,
    required String email,
  }) async {
    bool status = false;
    try {
      const url = "http://192.168.201.101:3000/api/v1/user/create-user";
      final result = await _dio.post(
        url,
        data: {
          "name": name,
          "email": email,
          "role": "COLLABORATOR",
        },
        options: Options(
          headers: {
            "token": PreferencesClass.getString("token"),
          },
        ),
      );
      if (result.data!["code"] == "201") {
        setErrMesage = "";
        status = true;
      }
    } on DioError catch (e) {
      setErrMesage = e.response!.data!["message"];
      log("1 ${e.response}");
    } catch (e) {
      log("2 $e");
    }
    return status;
  }

  Future<UsersModel> getusers() async {
    UsersModel usersModel = UsersModel();
    const url = "http://192.168.201.101:3000/api/v1/user/get-all";
    final result = await _dio.get(url);
    usersModel = UsersModel.fromJson(result.data);
    return usersModel;
  }
}
