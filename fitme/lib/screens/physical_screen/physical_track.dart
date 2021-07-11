import 'package:fitme/models/exercise.dart';
import 'package:fitme/screens/physical_screen/activity_timer.dart';
import 'package:fitme/widgets/filled_button.dart';
import 'package:fitme/widgets/line_button.dart';
import 'package:fitme/widgets/next_step.dart';
import 'package:fitme/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class PhysicalTrack extends StatelessWidget {
  final Exercise exercise;

  PhysicalTrack({
    @required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.exercise.title,
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    height: 90.0,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(231, 241, 255, 1.0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 55.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Time',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.blueGrey[300]),
                              ),
                              Text(
                                '${this.exercise.time}',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.lightBlue,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 45.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Intensity',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.blueGrey[300],
                                ),
                              ),
                              Text(
                                this.exercise.difficult,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: <Widget>[
                        NextStep(
                          image: 'assets/images/image005.jpg',
                          title: 'Plank',
                          seconds: 50,
                        ),
                        NextStep(
                          image: 'assets/images/image006.jpg',
                          title: 'Push-ups',
                          seconds: 50,
                        ),
                        NextStep(
                          image: 'assets/images/image007.jpg',
                          title: 'Lateral Raise',
                          seconds: 50,
                        ),
                        NextStep(
                            image: 'assets/image/squat.jpg',
                            title: 'Squats',
                            seconds: 50),
                        NextStep(
                            image: 'assets/image/lunges.jpg',
                            title: 'Lunges',
                            seconds: 50),
                        NextStep(
                            image: 'assets/image/jumpingjacks.jpg',
                            title: 'Jumping Jacks',
                            seconds: 50),
                        NextStep(
                            image: 'assets/image/burpee.jpg',
                            title: 'Burpees',
                            seconds: 50),
                        NextStep(
                            image: 'assets/image/situp.jpg',
                            title: 'Sit Ups',
                            seconds: 50),
                        NextStep(
                            image: 'assets/image/crunch.jpg',
                            title: 'Crunches',
                            seconds: 50),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: LineButton(
                title: 'Cancel',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: FilledButton(
                title: 'Start',
                color: Colors.lightBlue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return ActivityTimer();
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
