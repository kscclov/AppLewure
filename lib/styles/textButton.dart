import 'package:flutter/material.dart';

class textBut extends StatelessWidget {

final String label;

const textBut({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.all(8),
          child: TextButton(
            onPressed: () {  },
            child: Text(label,
            style: const TextStyle (
        fontFamily: "montaga",
        fontSize: 14,
        color: Colors.black,
        ),
            ),
            )           
    );
  }
}