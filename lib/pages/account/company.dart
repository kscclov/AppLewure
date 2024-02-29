import 'package:flutter/material.dart';

class company extends StatelessWidget {
  const company({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.of(context).pop(),
      ), 
      backgroundColor: Colors.white,
      title: const Text("О КОМПАНИИ",
      style: TextStyle(
        fontFamily: "montaga",
        fontSize: 15,
        color: Colors.black,
      ),
      ),
      centerTitle: true,
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Text('БРЕНД МОДНОЙ ОДЕЖДЫ, СОЗДАННЫЙ В 2023 ГОДУ.',
            style: TextStyle(
                  fontFamily: "latoSReg",
                  fontSize: 13,
                  color: Colors.black,
                ),),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Flexible(
              child: Text('Наши дизайнеры вдохновлялись последними мировыми трендами для того, чтобы дать каждому человеку возможность подобрать то, что лучше всего подходит именно ему и отражает его индивидуальность.',
              style: TextStyle(
                  fontFamily: "lato",
                  fontSize: 13,
                  color: Colors.black,
                ),)),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Flexible(child: Text('Мы внимательно относимся к выбору материалов, чтобы созданные нами изделия в течении долгого времени сохраняли первоначальный вид.',
            style: TextStyle(
                  fontFamily: "lato",
                  fontSize: 13,
                  color: Colors.black,
                ),)),
          )
        ],)),
    );
  }
}