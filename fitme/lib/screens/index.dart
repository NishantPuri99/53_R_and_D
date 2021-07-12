import 'package:fitme/screens/dietTracker_screen.dart';
import 'package:fitme/screens/diet_screen.dart';
import 'package:fitme/screens/meditation_screen/meditation_screen.dart';
import 'package:fitme/screens/physical_screen/physical_screen.dart';
import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class Index extends StatefulWidget {
  static const routeName = '/index';
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentIndex = 0;

  List<Widget> _screensList;

  @override
  void initState() {
    super.initState();

    _screensList = [
      DashboardScreen(),
      PhysicalScreen(),
      MeditationScreen(),
      DietTrackerScreen(),
    ];
  }

  void changeScreen(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _screensList,
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 55,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                DateTime dateTime = DateTime.now();

                changeScreen(0);
              },
              child: Icon(
                Icons.home,
                size: 30,
                color: _currentIndex == 0
                    ? Colors.lightBlue[300]
                    : Colors.grey[300],
              ),
            ),
            GestureDetector(
              onTap: () {
                changeScreen(1);
              },
              child: Icon(
                Icons.run_circle,
                size: 30,
                color: _currentIndex == 1
                    ? Colors.lightBlue[300]
                    : Colors.grey[300],
              ),
            ),
            GestureDetector(
              onTap: () {
                changeScreen(2);
              },
              child: Icon(
                Icons.mediation_outlined,
                size: 30,
                color: _currentIndex == 2
                    ? Colors.lightBlue[300]
                    : Colors.grey[300],
              ),
            ),
            GestureDetector(
              onTap: () {
                changeScreen(3);
              },
              child: Icon(
                Icons.food_bank,
                size: 30,
                color: _currentIndex == 3
                    ? Colors.lightBlue[300]
                    : Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
