import 'package:flutter/material.dart';
import 'package:lewure2_0/pages/WelcomeScreen.dart';
import 'package:lewure2_0/pages/account/company.dart';
import 'package:lewure2_0/pages/account/contacts.dart';
import 'package:lewure2_0/pages/account/info.dart';


class account extends StatefulWidget {

  final String nameAccount;
  final String secNameAccount;
  final String login;

  const account({super.key, required this.login, required this.nameAccount, required this.secNameAccount});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  
  @override
   Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar( 
      backgroundColor: Colors.white,
      title: const Text("ЛИЧНЫЙ КАБИНЕТ",   
        style: TextStyle (
        fontFamily: "montaga",
        fontSize: 14,
        color: Colors.black,
        ),
      ),
      centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
        children: [
        Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              SizedBox(width: 20),
              Text(widget.nameAccount,
              style: TextStyle(
                  fontFamily: "montaga",
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10),
              Text(widget.secNameAccount,
              style: TextStyle(
                  fontFamily: "montaga",
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],),  
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(widget.login,
                style: TextStyle(
                    fontFamily: "montaga",
                    fontSize: 12,
                    color: const Color.fromARGB(255, 91, 91, 91),
                  ),
                ),
            ),
          ],
        ),
        ),
        Expanded(
        flex: 1,
        child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'ЗАКАЗЫ',
                style: TextStyle(
                  fontFamily: "montaga",
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => info(login: widget.login), 
                              ),
                            );
              },
              child: const Text(
                'МОИ ДАННЫЕ',
                style: TextStyle(
                  fontFamily: "montaga",
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => contacts(), 
                              ),
                            );},
              child: Text(
                'КОНТАКТЫ',
                style: const TextStyle(
                  fontFamily: "montaga",
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => company(), 
                              ),
                            );
              },
              child: Text(
                'КОМПАНИЯ',
                style: const TextStyle(
                  fontFamily: "montaga",
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
        Expanded(
        flex: 1,
        child: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WelcomeScreen(
                  ),
                ),
              );
              },
              child: Text('ВЫЙТИ'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                minimumSize: Size(300, 50),
            ),),
            Expanded(
            child: SizedBox())
              ],
            ),
          ), 
        )
        ],
        )    
      )  
      );
  }
}