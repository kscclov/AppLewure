import 'package:flutter/material.dart';
import 'package:lewure2_0/styles/allText.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class info extends StatefulWidget {
  final String login;
  const info({super.key, required this.login});

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  final client = SupabaseClient(
    'https://sdjzoczdntlqfdzixoxn.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkanpvY3pkbnRscWZkeml4b3huIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkzNTU5MDgsImV4cCI6MjAxNDkzMTkwOH0.yRn3u5eBBPqVyXNKkufhhUfmjMGn9KRzHKqQi0Je8KY',
  );

  String name = '';
  String secName = '';
  String number = '';
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

    Future<void> fetchData() async {
      try {
        var response = await client
            .from('Users')
            .select('name, secName, number')
            .eq('email', widget.login)
            .single()
            .execute();

        if (response.status == 200) {
          var data = response.data;

          if (data != null) {
            name = data['name'];
            secName = data['secName'];
            number = data['number'];
          }
        }
      } catch (error) {
      } finally {
        setState(() {
          loading = false;
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        backgroundColor: Colors.white,
        title: const Text(
          "ЛИЧНЫЕ ДАННЫЕ",
          style: TextStyle(
            fontFamily: "montaga",
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: loading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(flex: 1,
                child: Text('')),
                Expanded( flex: 3,
                child: Column(children: [
                textAll(label: 'Имя: ' + name),
                textAll(label: 'Фамилия: ' + secName),
                textAll(label: 'Номер телефона: ' + number),
                textAll(label: 'Почта: ' + widget.login),
            ],),),
          ],
        ),
      ),
    );
  }
}