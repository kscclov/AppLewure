import 'package:flutter/material.dart';

class butForm extends StatelessWidget {

final String label;

const butForm({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: label,
            ),           
          ),
    );
  }
}