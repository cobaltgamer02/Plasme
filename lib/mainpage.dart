import 'package:flutter/material.dart';
import 'package:plasma_donor/screens/updatedetails..dart';
import 'screens/searchdonors.dart';
import 'screens/homepage.dart';
class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final screens = [HomePage(), Search(), UpdateDetails(),];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PLASME APP'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: screens[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: selectedindex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: (index) => setState(() => selectedindex = index),
      ),
    );
  }
}
