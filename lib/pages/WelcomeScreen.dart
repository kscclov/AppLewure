import 'package:flutter/material.dart';
import 'package:lewure2_0/pages/authorizationPages/authhPage.dart';
import 'package:lewure2_0/pages/registrationsPages/reggPage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.gif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                const Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "LEWURE",
                      style: TextStyle(
                        fontFamily: "montaga",
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          width: 200,
                          height: 90,
                        ),
                        TextButton(
                          onPressed: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => authhPage(), 
                              ),
                            );
                          },
                          
                          child: const Text("ВХОД",
                          style: TextStyle(
                            fontFamily: "lato",
                            fontSize: 18,
                            color: Colors.white,
                          ),),
                        ),
                        const SizedBox(
                          width: 200,
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => reqqPage(), 
                              ),
                            );
                          },
                          
                          child: const Text("РЕГИСТРАЦИЯ",
                          style: TextStyle(
                            fontFamily: "lato",
                            fontSize: 18,
                            color: Colors.white,
                          ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}