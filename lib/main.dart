import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        backgroundColor: const Color(0xffeceff1),
        appBar: AppBar(
          backgroundColor: Color(0xffb2ebf2),
          title: const Center(
            child: Text('Tarefas', style: TextStyle(color: Colors.black),),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                  Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                ),
                  Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                ),
                  Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                ),
                  Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  width: 100,
                  height: 100,
        
                  color: Colors.amber,
                ),
                  Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                ),
                  Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
