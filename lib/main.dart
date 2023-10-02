import 'package:flutter/material.dart';
import 'package:kuis_praktikum_124210006/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Penyakit Tanaman',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}
