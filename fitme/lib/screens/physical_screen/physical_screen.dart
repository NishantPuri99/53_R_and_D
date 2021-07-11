import 'package:fitme/screens/google_maps/start_track_screen.dart';
import 'package:fitme/screens/physical_screen/physical_classes.dart';
import 'package:fitme/screens/physical_screen/run_activity.dart';
import 'package:fitme/screens/physical_screen/workout.dart';
import 'package:fitme/widgets/header.dart';
import 'package:flutter/material.dart';

class PhysicalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Header(
              'Physical',
              rightSide: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return StartTrackScreen();
                      },
                    ),
                  );
                },
                child: Container(
                  height: 35.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      'Tracker',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TabBar(
              tabs: <Widget>[
                Container(
                  height: 30.0,
                  child: Tab(
                    text: 'Workout',
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
                  Workout(),
                  PhysicalClasses(),
                  Center(
                    child: Text('Body'),
                  ),
                  Center(
                    child: RunAct(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
