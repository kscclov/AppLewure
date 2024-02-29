import 'package:flutter/material.dart';
import 'package:lewure2_0/pages/wearApp/girl/fullCartPage.dart';

class cartforshop extends StatefulWidget {

  final String name;
  final String price;
  final String picture;
  final String description;
  final String color;
  final String vendorCode;

  const cartforshop({super.key, required this.name, required this.price, required this.picture, required this.color, required this.description, required this.vendorCode});

  @override
  State<cartforshop> createState() => _cartforshopState();
}

class _cartforshopState extends State<cartforshop> {
  @override
  Widget build(BuildContext context) {
    return Container(
    height: MediaQuery.of(context).size.height / 1.5,
    child: Column(
      children: [
      SizedBox(
        height: 20,
      ),
      Expanded(
      flex: 3,
      child: Container(     
      child: Stack(children: [
      Center(
      child: Image.network(widget.picture,
      fit: BoxFit.cover,
      ),),
      ],)
      ),),
      Padding(
          padding: const EdgeInsets.only(top: 2, left:8 ,bottom: 2, right:8),
          child: Column(children: [
            TextButton(   
            onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => fullCartPage(text: widget.name),
            ),
            );
            },
            child: Text(widget.name,
            style: const TextStyle(
              fontFamily: "latoReg",
              fontSize: 12, 
              color: Colors.black            
            ),),),
            Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Padding(padding: EdgeInsets.only(left: 8),
            child:Text(widget.price + " руб",
            style: const TextStyle(
              fontFamily: "latoReg",
              fontSize: 10,             
            ),),),],),
            ],
          ),
        ),
      ],
    ),
  );
 }
}