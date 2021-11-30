import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/calculator_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black12,
      ),
      home: const CalculatorBMI(),
    );
  }
}
