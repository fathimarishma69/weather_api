import 'package:flutter/material.dart';
import 'package:weather_api/screens/screen1.dart';
import 'package:weather_api/screens/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Screen1(),debugShowCheckedModeBanner: false,
    );
  }
}
