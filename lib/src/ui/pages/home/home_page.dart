import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/src/models/model_alarma_model.dart';
import 'package:project/src/provider/mode_alarma_provider.dart';
import '../../../config/theme/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size _size;
  final _modeProvider = ModeAlarmaProvider();
  late Future<ModeAlarma> _future;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() {
    _future = _modeProvider.getModelAlarma();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return FutureBuilder<ModeAlarma>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                height: 90,
                width: 90,
                child: CircularProgressIndicator(
                  color: purple1Color,
                  strokeWidth: 10,
                  backgroundColor: purple2Color,
                ),
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: _size.height * .07,
              ),
              Row(
                children: [
                  Text(
                    'Modo:',
                    style: TextStyle(
                      color: purple1Color,
                      fontSize: _size.height * .03,
                    ),
                  ),
                  SizedBox(
                    width: _size.width * .01,
                  ),
                  Text(
                    '${snapshot.data!.data![0]?.mode!}',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: _size.height * .03,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _size.height * .06,
              ),
              SizedBox(
                height: _size.height * .04,
              ),
              Center(child: SvgPicture.asset("assets/secure.svg")),
              SizedBox(
                height: _size.height * .2,
              ),
              const Center(
                child:
                    Text('El sensor se encuentra vigilando en tu ausencia...'),
              ),
            ],
          );
        });
  }
}
