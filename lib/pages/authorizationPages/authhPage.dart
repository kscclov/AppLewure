import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lewure2_0/pages/registrationsPages/afterReg.dart';

class authhPage extends StatefulWidget {

  const authhPage({super.key});

  @override
  State<authhPage> createState() => _authhPageState();
}

class _authhPageState extends State<authhPage> {

  bool state = false;

  final supabase = Supabase.instance.client;

  final client = SupabaseClient(
  'https://sdjzoczdntlqfdzixoxn.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkanpvY3pkbnRscWZkeml4b3huIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkzNTU5MDgsImV4cCI6MjAxNDkzMTkwOH0.yRn3u5eBBPqVyXNKkufhhUfmjMGn9KRzHKqQi0Je8KY',
  );

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              child: Text("Авторизуйтесь чтобы использовать избранное и сделать заказ",
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
            flex: 3,
            child: Column(
              children: [
            TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Введите логин",
              ), ),
            TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Введите пароль",
              ), ),
              ],                                
          ),
          ),
          TextButton(
              onPressed: () async {
                String email = _emailController.text;
                String password = _passwordController.text;
                String name;
                String secName;
                                      try {
                                        var response = await client
                                        .from('Users')
                                        .select('name, secName') // выбор только нужных колонок
                                        .eq('email', email)
                                        .eq('password', password)
                                        .single() // предполагается, что значение должно быть уникальным
                                        .execute();

                                        if (response.status == 200) {
                                          var data = response.data;                                     
                                          if (data.length > 0) {
                                            Fluttertoast.showToast(
                                              msg: "Вход в систему",
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 3,
                                              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                                              textColor: Colors.white,
                                              fontSize: 16.0,                                            
                                            );      

                                            name = data['name'];
                                            secName = data['secName'];
                                     
                                            // ignore: use_build_context_synchronously
                                            Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => welcome(
                                                nameAccount: name,
                                                secNameAccount: secName,
                                                login: _emailController.text,
                                              ),
                                            ),
                                          );
                                            } else {
                                            Fluttertoast.showToast(
                                              msg: "Введен неверный пароль",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                                              textColor: Colors.white,
                                            );
                                          }
                                        } else {
                                          // Обработка ошибки, если запрос не удался
                                           throw Exception('Ошибка запроса к базе данных');
                                        }
                                        } catch (error) {
                                          // Обработка ошибки
                                          print(error.toString());
                                          Fluttertoast.showToast(
                                              msg: "Пользователь не найден",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                          );
                                      }
                          },
                          child: const Text("ВОЙТИ",
                          style: TextStyle(
                            fontFamily: "lato",
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),),
                        ),
              ],
      ),
      ),
    );
  }
}