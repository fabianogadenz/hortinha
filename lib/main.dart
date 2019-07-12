import 'package:flutter/material.dart';
import 'package:hortinha/screens/details_screen.dart';
import 'package:hortinha/screens/home_screen.dart';
import 'package:hortinha/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hortinha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Container(),
     // LoginScreen(),
    );
  }
}

