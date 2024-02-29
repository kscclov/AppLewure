import 'package:flutter/material.dart';

class noneBuy extends StatelessWidget {

  noneBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Корзина пуста',
              style: const TextStyle(
                fontFamily: "latoSBold",
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/nocart.png'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text('Добавляйте товары в корзину и они появятся здесь - добавляйте все товары в одну корзину и они поступят к вам одним заказом!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "latoReg",
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
