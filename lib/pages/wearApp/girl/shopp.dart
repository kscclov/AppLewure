import 'package:flutter/material.dart';
import 'package:lewure2_0/pages/wearApp/girl/cartforcar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class shopp extends StatefulWidget {

  final String text;
  const shopp({super.key, required this.text});

  @override
  State<shopp> createState() => _shoppState();
}

class _shoppState extends State<shopp> {

  Future<dynamic> getProductList() async {
    List<dynamic> productList = await supabase.from("product")
    .select<List<dynamic>>()
    .eq('category', widget.text);

    return productList;
  }

  final supabase = Supabase.instance.client; 

  final supabaseClient = SupabaseClient(
    'https://sdjzoczdntlqfdzixoxn.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkanpvY3pkbnRscWZkeml4b3huIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkzNTU5MDgsImV4cCI6MjAxNDkzMTkwOH0.yRn3u5eBBPqVyXNKkufhhUfmjMGn9KRzHKqQi0Je8KY');
    
    Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
          ), 
          backgroundColor: Colors.white,
          title: Text(widget.text,
          style: const TextStyle(
            fontFamily: "montaga",
            fontSize: 15,
            color: Colors.black,
          ),),
          centerTitle: true,
          ),
          body: SafeArea(
            child: Center(          
              child: FutureBuilder(        
              future: getProductList(),
              builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
              } else {
              if (snapshot.hasError) {
              return Text('Произошла ошибка: ${snapshot.error}');
              } else if (snapshot.hasData) {
              var productsData = snapshot.data;
              if(productsData != null) {
              return ListView.builder(
              itemCount: productsData.length,
              itemBuilder: (context, index) {
              var productD = productsData[index];
                return cartforshop(
                  name: productD['name'],
                  picture: productD['picture'],
                  price: productD['price'],
                  color: productD['color'],
                  description: productD['description'],
                  vendorCode: productD['vendorCode'],
                  );
                    }
                 );
                 } else {
                  return Text('Ошибка');
                }
                } else {
                  return Text('Нет данных');
                }
              }
              }
                  )
                 ),
          )
      );
  }
}