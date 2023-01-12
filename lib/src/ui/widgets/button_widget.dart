import 'package:flutter/material.dart';
import 'package:project/src/config/theme/theme.dart';

class ButtomWiget extends StatefulWidget {
  const ButtomWiget({
    super.key,
    required this.action,
    required this.txt,
    required this.w,
  });
  final double w;
  final Function() action;
  final String txt;

  @override
  State<ButtomWiget> createState() => _ButtomWigetState();
}

class _ButtomWigetState extends State<ButtomWiget> {
  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.action,
      child: Container(
        height: _size.height * .05,
        width: widget.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: purple1Color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.txt,
          style: TextStyle(
            color: Colors.white,
            fontSize: _size.height * .02,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
