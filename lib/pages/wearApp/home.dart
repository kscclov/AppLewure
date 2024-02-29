import 'package:flutter/material.dart';
import 'package:lewure2_0/pages/wearApp/boy/productFilterB.dart';
import 'package:lewure2_0/pages/wearApp/girl/productFilterG.dart';


class home extends StatefulWidget {

  const home({super.key,});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column (children: [
              Image.asset("assets/images/firBack.jpg"),
              Image.asset("assets/images/secondBack.jpg"),
              Image.asset("assets/images/thirdBack.jpg"),
            ]),),
          Padding(
            padding: EdgeInsets.only(top: 60, left: 20),
            child: Text ("LEWURE",
            style: TextStyle(
              fontFamily: "montaga",
              fontSize: 17,
              color: Colors.white,
            ),
            ),
            ), 
              Align(
              alignment: Alignment.bottomCenter,          
              child: Row ( 
              children: [
              Padding(
                padding: EdgeInsets.only(left: 60, right: 50),
                child: TextButton(
                child: const Text("ЖЕНСКОЕ",
                          style: TextStyle(
                            fontFamily: "lato",
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          ),
                          onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => filterGirlState(), 
                              ),
                            ); }),),
                TextButton (
                  child: const Text("МУЖСКОЕ",
                          style: TextStyle(
                            fontFamily: "lato",
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () { Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => filterBoyState(), 
                              ),
                            ); }),
              ],
            ),
          ),             
        ],
      ),
    );
  }
}