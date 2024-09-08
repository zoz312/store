import 'package:flutter/material.dart';
import 'package:storapp/services/Update.dart';
import 'package:storapp/views/pages/Home.dart';
import 'package:storapp/views/pages/Update.dart';


void main() {
//updateProduct().updatepost();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       routes: {
    'home': (context) => const Home(),
    'update': (context) => const Update(),
  },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}

