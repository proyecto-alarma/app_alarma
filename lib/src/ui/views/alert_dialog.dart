import 'package:flutter/material.dart';

void alerDialo({
  required BuildContext context,
  required String txt,
}) =>
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Container(
          height: 60,
          alignment: Alignment.center,
          child: Text(txt),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Ok"),
          )
        ],
      ),
    );
