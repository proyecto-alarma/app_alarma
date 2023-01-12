import 'package:flutter/material.dart';
import 'package:project/src/config/theme/theme.dart';

class InputWidget extends StatefulWidget {
  const InputWidget({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: purple2Color,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: widget.controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
