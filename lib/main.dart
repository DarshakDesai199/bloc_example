import 'package:flutter/material.dart';

import 'Increment_Decrement_Example/ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme(color: Colors.black),
      ),
      home: CounterExample(),
    );
  }
}
