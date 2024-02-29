import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class buttonlike extends StatefulWidget {

  final String name;
  final String price;
  final String picture;
  final String color;
  final String size;

  const buttonlike({super.key, required this.name, required this.price, required this.picture, required this.color, required this.size});

  @override
  _buttonlikeState createState() => _buttonlikeState();
}

class _buttonlikeState extends State<buttonlike> {

  bool isFavourite = false;

  final supabase = Supabase.instance.client; 

  final supabaseClient = SupabaseClient(
    'https://sdjzoczdntlqfdzixoxn.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkanpvY3pkbnRscWZkeml4b3huIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkzNTU5MDgsImV4cCI6MjAxNDkzMTkwOH0.yRn3u5eBBPqVyXNKkufhhUfmjMGn9KRzHKqQi0Je8KY');

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavourite ? Icons.shopping_cart_sharp : Icons.add_shopping_cart,
        color: isFavourite ? const Color.fromARGB(255, 0, 0, 0) : null,
      ),
      onPressed: () async {     
          // ignore: unused_local_variable
          final response = await supabaseClient
          .from('favorite')
          .upsert([
          {
          'name': widget.name,
          'picture': widget.picture,
          'price': widget.price,
          'color': widget.color,
          'size': widget.size,
          },
          ])
          .execute();

          setState(() {
          isFavourite = !isFavourite;
          });

          }
            );
            }
            }