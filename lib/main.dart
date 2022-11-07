import 'package:flutter/material.dart';
import 'package:lesson49/bottom_bar_screen.dart';
import 'package:lesson49/screens/person1_screen.dart';
import 'package:lesson49/screens/person_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomBarScreen(),
    );
  }
}
