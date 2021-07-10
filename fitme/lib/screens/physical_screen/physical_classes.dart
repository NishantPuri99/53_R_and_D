import 'package:fitme/widgets/meditation_card.dart';
import 'package:flutter/material.dart';

class PhysicalClasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MeditationCard(
            source: 'assets/images/jog.jpg',
            title: 'Jog with Josh',
          ),
          SizedBox(
            height: 20,
          ),
          MeditationCard(
            source: 'assets/images/run.jpg',
            title: 'Get Ripped Fast',
          ),
          SizedBox(
            height: 20,
          ),
          MeditationCard(
            source: 'assets/images/jog2.jpg',
            title: 'Fitness 101',
          ),
          SizedBox(
            height: 20,
          ),
          MeditationCard(
            source: 'assets/images/push_ups.jpg',
            title: 'Home Workouts',
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
