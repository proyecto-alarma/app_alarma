import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: _size.height * .2,
        ),
        Center(
          child: Text('Sensor activado'),
        ),
        SizedBox(
          height: _size.height * .04,
        ),
        SvgPicture.asset("assets/secure.svg"),
        SizedBox(
          height: _size.height * .2,
        ),
        Center(
          child: Text('Su hogar esta seguro'),
        ),
      ],
    );
  }
}
