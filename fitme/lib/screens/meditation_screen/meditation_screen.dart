import 'package:fitme/screens/meditation_screen/meditation_classes.dart';
import 'package:fitme/screens/meditation_screen/relax.dart';
import 'package:fitme/widgets/header.dart';
import 'package:fitme/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class MeditationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Header('Mindfulness'),
            TabBar(
              tabs: <Widget>[
                Container(
                  height: 30.0,
                  child: Tab(
                    text: 'Relax',
                  ),
                ),
                Container(
                  height: 30.0,
                  child: Tab(
                    text: 'Classes',
                  ),
                ),
                Container(
                  height: 30.0,
                  child: Tab(
                    text: 'Digest',
                  ),
                ),
                Container(
                  height: 30.0,
                  child: Tab(
                    text: 'Journal',
                  ),
                ),
              ],
              labelColor: Colors.black87,
              unselectedLabelColor: Colors.grey[400],
              indicatorWeight: 4.0,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Color.fromRGBO(215, 225, 255, 1.0),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Relax(),
                  MeditationClasses(),
                  Center(
                    child: Text('Body'),
                  ),
                  Center(
                    child: Text('Body'),
                  ),
                  // TabViewBase(
                  //   tabName: 'Breakfast',
                  // ),
                  // TabViewBase(
                  //   tabName: 'Lunch',
                  // ),
                  // TabViewBase(
                  //   tabName: 'Dinner',
                  // ),
                  // TabViewBase(
                  //   tabName: 'Snacks',
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
