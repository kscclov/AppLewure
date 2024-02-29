import 'package:flutter/material.dart';
import 'package:lewure2_0/styles/buttonlike.dart';

class fullCart extends StatefulWidget {

  final String name;
  final String price;
  final String description;
  final String vendorCode;
  final String color;
  final String picture;

  const fullCart({super.key, required this.name, required this.price, required this.description, required this.vendorCode, required this.color, required this.picture});

  @override
  State<fullCart> createState() => _fullCartState();
}

class _fullCartState extends State<fullCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
        Stack(children: [
        Expanded(flex: 1,
          child: Center (
          child: Image.network(widget.picture,
          fit: BoxFit.fill)
          )),
        Padding(padding: EdgeInsets.only(top: 25, left: 20),
          child: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back,
          color: Colors.black,)),),],),
          Expanded(flex: 2,
          child:Padding(padding: EdgeInsets.all(15),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row( 
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Flexible(
              child: Text(widget.name,
              style: const TextStyle(
                fontFamily: "latoReg",
                fontSize: 14, 
                color: Colors.black            
              ),),
            ),
            Align(
              child: buttonlike(name: widget.name, price: widget.price, picture: widget.picture, color: widget.color, size: 'S'),
            )]),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              // ignore: prefer_interpolation_to_compose_strings
              child: Text(widget.price + ' руб.',
              style: const TextStyle(
                fontFamily: "latoReg",
                fontSize: 15,             
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              // ignore: prefer_interpolation_to_compose_strings
              child: Text('Артикул: ' + widget.vendorCode,
              style: const TextStyle(
                fontFamily: "latoReg",
                fontSize: 12, 
                color: Color.fromARGB(255, 49, 49, 49)            
              ),),
            ),
              Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Flexible(child: Text(widget.description,
              style: const TextStyle(
                fontFamily: "latoReg",
                fontSize: 12,             
              ),),),
            ),
            const Row(
            children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(//widget.vendorCode
              'Размер',
              style: TextStyle(
                fontFamily: "latoReg",
                fontSize: 15, 
                color: Color.fromARGB(255, 49, 49, 49)            
              ),),
            ),
            SizedBox(
              width: 10,
            ),
            Row(children: [

            ],)
            ],),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              // ignore: prefer_interpolation_to_compose_strings
              child: Text('Цвет: ' + widget.color,
              style: const TextStyle(
                fontFamily: "latoReg",
                fontSize: 15,             
              ),),
            ),
            ],),),),
      ],),
    );
  }
}