import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project/src/core/shared/preferences/preferences.dart';

import '../core/errors/erros.dart';
import '../models/login_model.dart';
import 'user_provider.dart';

class LoginProvider {
  final _dio = Dio();
  final _userProvider = UserProvider();

  Future<bool> login({
    required String pass,
    required String email,
  }) async {
    const url = "http://192.168.201.101:3000/api/v1/auth/login";
    bool status = false;
    LoginModel loginModel = LoginModel();

    try {
      final result = await _dio.post(
        url,
        data: {
          "email": email,
          "password": pass,
        },
      );
      loginModel = LoginModel.fromJson(result.data);
      if (loginModel.data!.token!.isNotEmpty) {
        status = true;
        PreferencesClass.setString("token", loginModel.data!.token!);
        _userProvider.updateUser();
      } else {
        setErrMesage = loginModel.message!;
      }
      log(" ... . . ${jsonEncode((result.data))}");
    } on DioError catch (e) {
      setErrMesage = e.response!.data["message"];

      log(getError, name: "23423");
    } catch (e) {
      log("$e");
    }

    return status;
  }
}
