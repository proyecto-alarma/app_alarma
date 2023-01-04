import 'package:flutter/material.dart';

class AddCollaborators extends StatefulWidget {
  const AddCollaborators({super.key});

  @override
  State<AddCollaborators> createState() => _AddCollaboratorsState();
}

class _AddCollaboratorsState extends State<AddCollaborators> {
  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Column(
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
          child: Text('Agregar colaborador'),
        ),
        SizedBox(
          height: _size.height * .03,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text("Nombre"),
        ),
        SizedBox(
          height: _size.height * .01,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: _size.height * .02,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text("Telefono"),
        ),
        SizedBox(
          height: _size.height * .01,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          height: _size.height * .06,
        ),
        Container(
          width: _size.width * .4,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(8),
          child: const Text(
            "Agregar",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
