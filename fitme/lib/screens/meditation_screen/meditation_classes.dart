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
            descitpion:
                'Get rid of all the stress you have in life, blend in with nature and explore a world of peacefulness and calmness. Join me and learn how to lead a life full of joy and laughter.',
            instructor: 'Prithvi Manda',
          ),
          SizedBox(
            height: 20,
          ),
          MeditationCard(
            source: 'assets/images/coral.jpg',
            title: 'Beach Meditation',
            descitpion:
                'Get rid of all the stress you have in life, blend in with nature and explore a world of peacefulness and calmness. Join me and learn how to lead a life full of joy and laughter.',
            instructor: 'Krishna Marich',
          ),
          SizedBox(
            height: 20,
          ),
          MeditationCard(
            source: 'assets/images/yoga.jpg',
            title: 'Yoga Classes',
            descitpion:
                'Get rid of all the stress you have in life, blend in with nature and explore a world of peacefulness and calmness. Join me and learn how to lead a life full of joy and laughter.',
            instructor: 'Devdut Graman',
          ),
          SizedBox(
            height: 20,
          ),
          MeditationCard(
            source: 'assets/images/meditation2.jpg',
            title: 'Rain Meditation',
            descitpion:
                'Get rid of all the stress you have in life, blend in with nature and explore a world of peacefulness and calmness. Join me and learn how to lead a life full of joy and laughter.',
            instructor: 'Shirish Madhav',
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
