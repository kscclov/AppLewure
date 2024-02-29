import 'package:flutter/material.dart';
import 'package:lewure2_0/pages/wearApp/cartAndOrder/payComplete.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class order extends StatefulWidget {

  final String nameAccount;
  final String secNameAccount;
  final String login;

  const order({super.key, required this.login, required this.nameAccount, required this.secNameAccount});

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {

final TextEditingController _numberController = TextEditingController();
final TextEditingController _dateController = TextEditingController();
final TextEditingController _CVCController = TextEditingController();
final TextEditingController _addressController = TextEditingController();

 final client = SupabaseClient(
  'https://sdjzoczdntlqfdzixoxn.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkanpvY3pkbnRscWZkeml4b3huIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkzNTU5MDgsImV4cCI6MjAxNDkzMTkwOH0.yRn3u5eBBPqVyXNKkufhhUfmjMGn9KRzHKqQi0Je8KY'
  );
 
 void createNewUser() async {

  // ignore: unused_local_variable
  final response =  client.from('orders').insert([
    {
    "numberCard": _numberController.text,
    "dateCard": _dateController.text,
    "CVCCard": _CVCController.text,
    "address": _addressController.text,
    }
  ]).execute();
 }
    
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column (children: [
                  TextFormField(
                  controller: _numberController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Введите номер карты',
                      ),           
                    ),
                  TextFormField(
                    controller: _dateController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Введите срок карты',
                      ),           
                    ),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextFormField(
                  controller: _CVCController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'CVC',
                      ),           
                    ),
                  ),
                ]),
              ),
              Container(
                alignment: Alignment.center,
                child: TextFormField(
                  controller: _addressController,

                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Введите адресс доставки',
                      ),           
                    ),
              ),
            SizedBox(height: 20),
            ElevatedButton(
            onPressed: () {
              createNewUser();
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => pay(login: widget.login, secNameAccount: widget.secNameAccount, nameAccount: widget.nameAccount)
      ),
    );

            },
            // ignore: prefer_const_constructors
            child: Text('Оформить заказ'),
            style: ElevatedButton.styleFrom(
            primary: Colors.black,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            ),
            minimumSize: Size(300, 50),
              ),
            ),
            ],
          ),
      ),
    ),
  );
}}