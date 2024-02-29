import 'package:flutter/material.dart';
import 'package:lewure2_0/pages/wearApp/boy/shopBoy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class filterBoyState extends StatefulWidget {
  const filterBoyState({super.key});

  @override
  State<filterBoyState> createState() => _filterBoyState();
}

class _filterBoyState extends State<filterBoyState> {

  final supabaseClient = SupabaseClient(
    'https://sdjzoczdntlqfdzixoxn.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkanpvY3pkbnRscWZkeml4b3huIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkzNTU5MDgsImV4cCI6MjAxNDkzMTkwOH0.yRn3u5eBBPqVyXNKkufhhUfmjMGn9KRzHKqQi0Je8KY');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(
      icon: const Icon(Icons.close, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
      ), 
      backgroundColor: Colors.white,
      title: const Text("МУЖСКОЕ",
      style: TextStyle(
        fontFamily: "montaga",
        fontSize: 15,
        color: Colors.black,
      ),
      ),
      centerTitle: true,
      ),
      body: Padding(
      padding: EdgeInsets.only(top: 30, left: 0),
      child:
      FutureBuilder(        
      future: supabaseClient.from('boyCategory')
      .select()
      .execute(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData ||
          snapshot.data == null || snapshot.data?.data == null) {
            return Text('No data found');
            } else {
              final data = snapshot.data!.data;
              return ListView.builder(             
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
        return TextButton(
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => shopBoy(text: item['name'].toString()),
            ),
            );
            },
        child: Text(item['name'].toString(),
        style: TextStyle(        
        fontFamily: "latoReg",
        fontSize: 16,
        color: Colors.black,
              ),),
            );
           },
          );
         }
        },
       ),
      ),
    );
  }
}