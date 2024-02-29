import 'package:flutter/material.dart';
import 'package:lewure2_0/pages/wearApp/cartAndOrder/order.dart';
import 'package:lewure2_0/styles/cartofproduct/cardforcart.dart';
import 'package:lewure2_0/styles/noneBuy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class cart extends StatefulWidget {

  final String nameAccount;
  final String secNameAccount;
  final String login;

  const cart({super.key, required this.login, required this.nameAccount, required this.secNameAccount});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {

  Future<dynamic> getProductList() async {
    List<dynamic> productList = await supabase.from("favorite")
    .select<List<dynamic>>();

    return productList;
  }

  final supabase = Supabase.instance.client; 

  final supabaseClient = SupabaseClient(
    'https://sdjzoczdntlqfdzixoxn.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkanpvY3pkbnRscWZkeml4b3huIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkzNTU5MDgsImV4cCI6MjAxNDkzMTkwOH0.yRn3u5eBBPqVyXNKkufhhUfmjMGn9KRzHKqQi0Je8KY');
    
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder(
              future: getProductList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Произошла ошибка: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  var productsData = snapshot.data;
                  if (productsData != null) {
                    if (productsData.isEmpty) {
                      return noneBuy();
                    } else {
                      return ListView.builder(
                        itemCount: productsData.length,
                        itemBuilder: (context, index) {
                          var productD = productsData[index];
                          return cardforcart(
                            name: productD['name'],
                            price: productD['price'],
                            picture: productD['picture'],
                            color: productD['color'],
                            size: productD['size'],
                          );
                        },
                      );
                    }
                  } else {
                    return Center(child: Text('Что-то пошло не так'));
                  }
                } else {
                  return Center(child: Text('Данные не найдены'));
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => order(login: widget.login, secNameAccount: widget.secNameAccount, nameAccount: widget.nameAccount)
              ),
            );
            },
            child: Text('Оформить заказ'),
            style: ElevatedButton.styleFrom(
            primary: Colors.black,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            ),
            minimumSize: Size(300, 50),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}}