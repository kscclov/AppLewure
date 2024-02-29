import 'package:flutter/material.dart';

class contacts extends StatelessWidget {
  const contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
      ), 
      backgroundColor: Colors.white,
      title: const Text("КОНТАКТЫ",
      style: TextStyle(
        fontFamily: "montaga",
        fontSize: 15,
        color: Colors.black,
      ),
      ),
      centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height / 10,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 1),
              ),
            ],
          ),
          // ignore: prefer_const_constructors
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // распределение пространства между виджетами
            crossAxisAlignment: CrossAxisAlignment.start, // направление выравнивания по верхнему краю
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // выравнивание текстов слева
                mainAxisAlignment: MainAxisAlignment.center, // выравнивание по центру
                children: [
                  Text(
                    'ГОРЯЧАЯ ЛИНИЯ',
                    style: TextStyle(
                      fontFamily: "latoReg",
                      fontSize: 14,
                      color: Color.fromARGB(255, 9, 8, 8),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '8 (937) 637-13-55',
                    style: TextStyle(
                      fontFamily: "latoReg",
                      fontSize: 14,
                      color: Color.fromARGB(255, 9, 8, 8),
                    ),
                  ),
                ],
              ),),
              const Align( // выравнивание текста к верхнему краю
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    '9.00 - 21.00',
                    style: TextStyle(
                      fontFamily: "latoReg",
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}