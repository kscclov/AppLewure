import 'package:flutter/material.dart';

class textAll extends StatelessWidget {
  final String label;
  const textAll({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(label,
      style: TextStyle(
                    fontFamily: "lato",
                    fontSize: 17,
                    color: Colors.black,
                  ),),
    );
  }
}