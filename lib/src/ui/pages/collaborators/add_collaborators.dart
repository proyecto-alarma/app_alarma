import 'package:flutter/material.dart';
import 'package:project/src/config/theme/theme.dart';
import 'package:project/src/core/errors/erros.dart';
import 'package:project/src/core/shared/emtters.dart';
import 'package:project/src/provider/user_provider.dart';
import 'package:project/src/ui/views/alert_dialog.dart';
import 'package:project/src/ui/views/loadin.dart';
import 'package:project/src/ui/widgets/button_widget.dart';
import 'package:project/src/ui/widgets/input_widget.dart';

class AddCollaborators extends StatefulWidget {
  const AddCollaborators({super.key});

  @override
  State<AddCollaborators> createState() => _AddCollaboratorsState();
}

class _AddCollaboratorsState extends State<AddCollaborators> {
  late Size _size;
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _colProvider = UserProvider();
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: _size.height * .04,
            ),
            Center(
              child: Image.asset(
                "assets/colaborator.png",
              ),
            ),
            Center(
              child: Text(
                'Agregar colaborador',
                style: TextStyle(
                  color: purple2Color,
                  fontSize: _size.height * .03,
                ),
              ),
            ),
            SizedBox(
              height: _size.height * .03,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Nombre",
                style: TextStyle(
                  color: blueColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            InputWidget(
              controller: _nameCtrl,
            ),
            SizedBox(
              height: _size.height * .02,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Correo eletronico",
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
              height: _size.height * .06,
            ),
            ButtomWiget(
              action: () async {
                if (_emailCtrl.text.isEmpty || _nameCtrl.text.isEmpty) {
                  alerDialo(
                    context: context,
                    txt: "Por favor, llena todos los campos.",
                  );
                  return;
                }
                loadingE.add(true);
                final result = await _colProvider.addCollaborator(
                  name: _nameCtrl.text,
                  email: _emailCtrl.text,
                );
                if (result) {
                  _emailCtrl.clear();
                  _nameCtrl.clear();
                  alerDialo(
                    context: context,
                    txt: "Colaborador agregado con éxito.",
                  );
                } else {
                  alerDialo(
                    context: context,
                    txt: getError,
                  );
                }
                loadingE.add(false);
              },
              txt: "Agregar",
              w: _size.width * .4,
            ),
          ],
        ),
      ],
    );
  }
}
