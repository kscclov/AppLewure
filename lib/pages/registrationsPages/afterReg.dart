import 'package:flutter/material.dart';
import 'package:lewure2_0/pages/butvavigation.dart';

class welcome extends StatefulWidget {

  final String nameAccount;
  final String secNameAccount;
  final String login;

  const welcome({super.key, required this.login, required this.nameAccount, required this.secNameAccount});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  
 @override
  Widget build(BuildContext context) {

    // ignore: prefer_const_constructors
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 140, bottom: 30),
        child: Column (
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Text(""),
            ),
          Expanded(
            flex: 6,
            child: Column (children: [
              const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child:Text("Добро пожаловать!",
              style: TextStyle (
              fontFamily: "latoSBold",
              fontSize: 20,
              color: Colors.black,
              ),
              ),
              ),
              const Flexible(
                child: Padding (
                  padding: EdgeInsets.only(left: 20, right: 20),
              child: Text("Для заказа добавьте выбранный товар в корзину и оформите заказ на свой адрес! Приятного шоппинга!",
              textAlign: TextAlign.center,
              style: TextStyle (
              fontFamily: "latoReg",
              fontSize: 15,
              color: Colors.black,
              ),
              ),
              ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset("assets/images/cart.png")
              ),
              TextButton(
                          onPressed: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(login: widget.login, secNameAccount: widget.secNameAccount, nameAccount: widget.nameAccount), 
                              ),
                            );
                          },
                          child: const Text("ПРОДОЛЖИТЬ",
                          style: TextStyle(
                            fontFamily: "lato",
                            fontSize: 18,
                            color: Color.fromARGB(255, 19, 19, 19),
                          ),),
                        ),
              
            ],),
            ),
        ],
      ),
      ),
    );
  }
}