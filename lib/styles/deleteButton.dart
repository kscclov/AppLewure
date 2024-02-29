import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class deleteButton extends StatefulWidget {
  final String name;
  final void Function() onDelete; // Добавляем значение onDelete

  const deleteButton({super.key, required this.name, required this.onDelete});

  @override
  _deleteButtonState createState() => _deleteButtonState();
}

class _deleteButtonState extends State<deleteButton> {
  final supabaseClient = SupabaseClient(
    'https://sdjzoczdntlqfdzixoxn.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNkanpvY3pkbnRscWZkeml4b3huIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTkzNTU5MDgsImV4cCI6MjAxNDkzMTkwOH0.yRn3u5eBBPqVyXNKkufhhUfmjMGn9KRzHKqQi0Je8KY');

  bool delete = false;

  Future<void> deleteItem(bool deleteState) async {
    // ignore: unused_local_variable
    final response = await supabaseClient
        .from('favorite')
        .delete()
        .eq('name', widget.name)
        .execute();

    setState(() {
      delete = deleteState;
    });
    widget.onDelete(); // Вызов функции onDelete после удаления
  }

  @override
  Widget build(BuildContext context) {
    if (delete) {
      return SizedBox();
    } else {
      return ElevatedButton(
        child: Text(
          "Удалить из корзины",
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontFamily: 'latoReq',
            fontSize: 14,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          deleteItem(true); // Передача значения true
        },
      );
    }
  }
}
