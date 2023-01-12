import 'package:flutter/material.dart';
import 'package:project/src/config/theme/theme.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: blackColor.withOpacity(.2),
      child: Center(
        child: SizedBox(
          height: 90,
          width: 90,
          child: CircularProgressIndicator(
            color: purple1Color,
            strokeWidth: 10,
            backgroundColor: purple2Color,
          ),
        ),
      ),
    );
  }
}
