import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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
    const url = "http://192.168.201.101:3000/api/v1/user/get-all/COLLABORATOR";
    final result = await _dio.get(url);
    usersModel = UsersModel.fromJson(result.data);
    return usersModel;
  }

  Future<bool> updateUser() async {
    bool status = false;
    try {
      final token = PreferencesClass.getString("token");
      final decodeToken = JwtDecoder.decode(token);
      final url =
          "http://192.168.201.101:3000/api/v1/user/update-user/${decodeToken["id"]}";

      final updateUser = await _dio.patch(url,
          data: {"token": PreferencesClass.getString("tokendevice")});
      log("------ ${updateUser.data}", name: url);
      if (updateUser.data!["code"] == "200") {
        setErrMesage = "";
        status = true;
      }
    } on DioError catch (e) {
      log("${e}", name: "Update user");
    } catch (e) {
      log("$e", name: "update user 2");
    }
    return status;
  }
}
