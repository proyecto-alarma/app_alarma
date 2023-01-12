import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/src/config/theme/theme.dart';
import 'package:project/src/core/shared/preferences/preferences.dart';
import 'package:project/src/ui/pages/home/home_page.dart';
import 'package:project/src/ui/views/alert_dialog.dart';
import 'package:project/src/ui/views/loadin.dart';
import 'package:project/src/ui/widgets/button_widget.dart';
import 'package:project/src/ui/widgets/input_widget.dart';

import '../../../core/errors/erros.dart';
import '../../../provider/login_provider.dart';
import '../home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginProvider = LoginProvider();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  late Size _size;
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    Future.delayed(const Duration(seconds: 2), () {
      if (PreferencesClass.getString("token").isNotEmpty) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomePageDart()),
          (route) => false,
        );
      } else {
        _loading = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: _size.height * .4,
              color: purple1Color,
            ),
            _container(),
            Container(
              margin: EdgeInsets.only(
                top: _size.height * .05,
              ),
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Icon(
                      Icons.security_rounded,
                      color: Colors.white,
                      size: _size.height * .1,
                    ),
                    SizedBox(
                      height: _size.height * .02,
                    ),
                    Text(
                      "App Secure",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _size.height * .06,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _loading ? const LoadingView() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _container() => Container(
        margin: EdgeInsets.only(
          top: _size.height * .3,
        ),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 3,
                child: Container(
                  width: _size.width * .8,
                  margin: EdgeInsets.symmetric(
                    vertical: _size.height * .02,
                    horizontal: _size.width * .04,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person,
                        color: purple2Color,
                        size: _size.height * .07,
                      ),
                      const SizedBox(
                        height: 04,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Correo electrónico",
                          style: TextStyle(
                            color: blueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      InputWidget(
                        controller: _emailCtrl,
                      ),
                      SizedBox(
                        height: _size.height * .02,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Contraseña",
                          style: TextStyle(
                            color: blueColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      InputWidget(
                        controller: _passCtrl,
                      ),
                      SizedBox(
                        height: _size.height * .02,
                      ),
                      ButtomWiget(
                        action: () async {
                          if (_emailCtrl.text.isEmpty ||
                              _passCtrl.text.isEmpty) {
                            alerDialo(
                              context: context,
                              txt: "Por favor llena todos los campos",
                            );
                            return;
                          }
                          _loading = true;
                          setState(() {});
                          final result = await _loginProvider.login(
                            pass: _passCtrl.text,
                            email: _emailCtrl.text,
                          );
                          if (result) {
                          } else {
                            alerDialo(
                              context: context,
                              txt: getError,
                            );
                          }
                          _loading = false;
                          setState(() {});
                        },
                        txt: "Ingresar",
                        w: _size.width * .4,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _size.height * .04,
              ),
              Text(
                "Olvide mi contraseña",
                style: TextStyle(
                  color: blueColor,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      );
}
