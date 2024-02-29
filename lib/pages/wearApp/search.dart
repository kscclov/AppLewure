import 'package:flutter/material.dart';
import 'package:lewure2_0/pages/wearApp/girl/cartforcar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {

final supabaseClient = SupabaseClient(
    'https://sdjzoczdntlqfdzixoxn.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkanpvY3pkbnRscWZkeml4b3huIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkzNTU5MDgsImV4cCI6MjAxNDkzMTkwOH0.yRn3u5eBBPqVyXNKkufhhUfmjMGn9KRzHKqQi0Je8KY');
  
  TextEditingController searchController = TextEditingController();

  String extractStringValue(dynamic value) {
    if (value != null) {
      return value.toString();
    } else {
      return '';
    }
  }
  Future<List<dynamic>> searchProducts(String searchText) async {
  if (searchText.isEmpty) {
    return [];
  }

  final intSearchText = int.tryParse(searchText);

  List<Future<dynamic>> queryFutures = [];

  if (intSearchText != null) {
    var query1 = supabaseClient.from('boyProduct').select().filter('vendorCode', 'eq', searchText).execute();
    queryFutures.add(query1);

    var query2 = supabaseClient.from('product').select().filter('vendorCode', 'eq', searchText).execute();
    queryFutures.add(query2);
  }

  List<dynamic> responses = await Future.wait(queryFutures);

  List<Map<String, dynamic>> results = [];
  for (var response in responses) {
    if (response is PostgrestResponse) {
      for (var item in response.data) {
        results.add(item as Map<String, dynamic>);
      }
    } else {
    }
  }
  return results;
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: const Text("ПОИСК",   
        style: TextStyle (
          fontFamily: "montaga",
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    ),
    body: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                // Можно добавить обновление списка при изменении текста в поле поиска
              });
            },
          ),
          SizedBox(height: 20),
          Expanded(
            child: FutureBuilder(
              future: searchProducts(searchController.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Произошла ошибка: ${snapshot.error}'));
                } else {
                  if (snapshot.data != null && (snapshot.data as List).isNotEmpty) {
                    List<Map<String, dynamic>> searchResults = (snapshot.data as List).map((item) => item as Map<String, dynamic>).toList();
                    return ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final product = searchResults[index];
                        return cartforshop(
                          name: product['name'],
                          picture: product['picture'],
                          price: product['price'],
                          color: product['color'],
                          description: product['description'],
                          vendorCode: product['vendorCode'],
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('Ничего не найдено'));
                  }
                }
              }
            ),
          ),
        ],
      ),
    ),
  );
 }
}