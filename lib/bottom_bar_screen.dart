import 'package:flutter/material.dart';
import 'package:lesson49/screens/location_screen/location_screen.dart';
import 'package:lesson49/screens/person1_screen.dart';
import 'package:lesson49/screens/person_card.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);
  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = [
    Person1Screen(),
    LocationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Персонажи',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Локациии',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_rounded),
              label: 'Эпизоды',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Настройки',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed
          // selectedIconTheme: IconThemeData(color: Colors.red),
          // unselectedIconTheme: IconThemeData(color: Colors.black),
          // iconSize: 30,
          // selectedLabelStyle: TextStyle(fontSize: 40),
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          // backgroundColor: Colors.red,
          // selectedItemColor: Colors.green,
          // unselectedItemColor: Colors.red,
          // fixedColor: Colors.amber,
          ),
    );
  }
}
