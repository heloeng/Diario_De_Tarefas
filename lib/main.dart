import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'src/ui/pages/pages.dart';
import 'src/src.dart';


Future main() async{
WidgetsFlutterBinding.ensureInitialized();
// FirebaseFirestore.instance;
await Firebase.initializeApp();
  
  runApp(const MyApp());

} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const MyHomePage(),
    );
  }
}
