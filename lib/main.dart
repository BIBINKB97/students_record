import 'package:flutter/material.dart';
import 'package:student_records/view/home_page/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'student_records',
      home: HomePage(),
    );
  }
}
