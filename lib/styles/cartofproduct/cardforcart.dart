import 'package:flutter/material.dart';
import 'package:lewure2_0/styles/deleteButton.dart';

class cardforcart extends StatefulWidget {

  final String name;
  final String price;
  final String picture;
  final String color;
  final String size;

const cardforcart ({super.key, required this.name, required this.price, required this.picture, required this.color, required this.size});

  @override
  State<cardforcart > createState() => _cardforcartState();
}

class _cardforcartState extends State<cardforcart> {

  bool deleteState = false;

  void onDelete() {
    setState(() {
      deleteState = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (deleteState) {
      return SizedBox();
    } else {
    return Container(
    height: MediaQuery.of(context).size.height / 3,
    child: Padding(
    padding: EdgeInsets.all(16.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: Image.network(widget.picture, fit: BoxFit.fill),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: "latoSBold",
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15),
                Text(widget.color,
                  style: const TextStyle(
                    fontFamily: "latoReg",
                    fontSize: 14,
                    color: Color.fromARGB(255, 9, 8, 8),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  widget.size,
                  style: const TextStyle(
                    fontFamily: "latoReg",
                    fontSize: 14,
                    color: Color.fromARGB(255, 9, 8, 8),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  widget.price + " руб.",
                  style: const TextStyle(
                    fontFamily: "latoReg",
                    fontSize: 14,
                    color: Color.fromARGB(255, 9, 8, 8),
                  ),
                ),
                SizedBox(height: 15),
                deleteButton(name: widget.name, onDelete: onDelete),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);}}}