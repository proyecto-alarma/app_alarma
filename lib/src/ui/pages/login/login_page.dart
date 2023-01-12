import 'package:flutter/material.dart';
import 'package:project/src/config/theme/theme.dart';
import 'package:project/src/ui/views/loadin.dart';
import 'package:project/src/ui/widgets/button_widget.dart';
import 'package:project/src/ui/widgets/input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Size _size;
  bool _loading = false;
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
            _loading ? LoadingView() : SizedBox(),
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
                      controller: TextEditingController(),
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
                      controller: TextEditingController(),
                    ),
                    SizedBox(
                      height: _size.height * .02,
                    ),
                    ButtomWiget(
                      action: () {
                        _loading = true;
                        setState(() {});

                        Future.delayed(Duration(seconds: 3), () {
                          _loading = false;
                          setState(() {});
                        });
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
      );
}
