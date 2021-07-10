import 'package:fitme/widgets/meditation_card.dart';
import 'package:flutter/material.dart';

class MeditationClasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MeditationCard(
            source: 'assets/images/trees.jpg',
            title: 'Garden Meditation',
          ),
          SizedBox(
            height: 20,
          ),
          MeditationCard(
            source: 'assets/images/coral.jpg',
            title: 'Beach Meditation',
          ),
          SizedBox(
            height: 20,
          ),
          MeditationCard(
            source: 'assets/images/yoga.jpg',
            title: 'Yoga Classes',
          ),
          SizedBox(
            height: 20,
          ),
          MeditationCard(
            source: 'assets/images/meditation2.jpg',
            title: 'Rain Meditation',
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
