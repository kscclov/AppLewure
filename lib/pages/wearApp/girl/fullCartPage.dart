import 'package:flutter/material.dart';
import 'package:lewure2_0/styles/cartofproduct/fullProduct.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class fullCartPage extends StatefulWidget {
  final String text;

  const fullCartPage({super.key, required this.text,});

  @override
  _fullCartPageState createState() => _fullCartPageState();
}

class _fullCartPageState extends State<fullCartPage> {

    Future<dynamic> getProductData() async {
      final response = await supabase.from("product").select().eq('name', widget.text).execute();
      final boyResponse = await supabase.from("boyProduct").select().eq('name', widget.text).execute();

      if (response.data != null && response.data.length > 0) {
        return response.data[0];
      } else if (boyResponse.data != null && boyResponse.data.length > 0) {
        return boyResponse.data[0];
      }

      return null;
    }

  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getProductData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Произошла ошибка: ${snapshot.error}');
            } else if (snapshot.hasData) {
              var productData = snapshot.data;
              if (productData != null) {
                return fullCart(
                  name: productData['name'],
                  picture: productData['picture'],
                  price: productData['price'],
                  color: productData['color'],
                  description: productData['description'],
                  vendorCode: productData['vendorCode'],
                );
              }
            }
            
            return Text('Данные не найдены');
          },
        ),
      ),
    );
  }
}