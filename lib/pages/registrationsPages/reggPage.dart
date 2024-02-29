import 'package:flutter/material.dart';
import 'package:lewure2_0/pages/registrationsPages/afterReg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class reqqPage extends StatefulWidget {
  const reqqPage({super.key});

  @override
  State<reqqPage> createState() => _reqqPageState();
}

class _reqqPageState extends State<reqqPage> {

final TextEditingController _nameController = TextEditingController();
final TextEditingController _secNameController = TextEditingController();
final TextEditingController _numberController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

bool isLoading = false;
bool state = false;

final client = SupabaseClient(
  'https://sdjzoczdntlqfdzixoxn.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkanpvY3pkbnRscWZkeml4b3huIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkzNTU5MDgsImV4cCI6MjAxNDkzMTkwOH0.yRn3u5eBBPqVyXNKkufhhUfmjMGn9KRzHKqQi0Je8KY'
  );
 
 void createNewUser() async {

  // ignore: unused_local_variable
  final response =  client.from('Users').insert([
    {
    "name": _nameController.text,
    "secName": _secNameController.text,
    "number": _numberController.text,
    "email": _emailController.text,
    "password": _passwordController.text
    }
  ]).execute();
 }


  void navigateToAccountPage() {
    String nameAccount = _nameController.text;
    String secNameAccount = _secNameController.text;
    String login = _emailController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => welcome(
          nameAccount: nameAccount,
          secNameAccount: secNameAccount,
          login: login,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 140, bottom: 30),
        child: Column (
        children: <Widget>[
          Container(
            child: const Flexible(
              flex: 2,
              child: Text("Зарегистрируйтесь чтобы использовать избранное и сделать заказ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "latoReg",
                fontSize: 16,
                color: Colors.black,
              ),)),
          ),
          const SizedBox(
            width: 320,
            height: 30,
          ),
          Expanded (
            flex: 6,
            child: Padding (
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Введите имя",
              ), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _secNameController,
                decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Введите фамилию",
              ), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _numberController,
                decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Введите номер телефона",
              ), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Электронная почта",
              ), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Введите пароль",
              ), ),
            ), ],) ),),
         Expanded(
          flex: 1,
          child: Padding(
          padding: EdgeInsets.only(top: 35),
          child: TextButton(
                          onPressed: () {
                          createNewUser();
                          navigateToAccountPage();
                          },
                          child: const Text("ЗАРЕГИСТРИРОВАТЬСЯ",
                          style: TextStyle(
                            fontFamily: "lato",
                            fontSize: 18,
                            color: Color.fromARGB(255, 19, 19, 19),
                          ),),
                        ),),),
                        

        ],
      ),
      ),
    );
  }
}