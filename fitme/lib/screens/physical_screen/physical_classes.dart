import 'package:fitme/widgets/meditation_card.dart';
import 'package:flutter/material.dart';

class PhysicalClasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MeditationCard(
            source: 'assets/images/walktrack.jpg',
            title: 'Basic stretches and brisk walking',
            descitpion:
                'Get rid of all the stress you have in life, blend in with nature and explore a world of peacefulness and calmness. Join me and learn how to lead a life full of joy and laughter.',
            instructor: 'Vindhya Sharma',
          ),
          SizedBox(
            height: 20,
          ),
          MeditationCard(
            source: 'assets/images/jog.jpg',
            title: 'Jog with Josh',
            descitpion:
                'Get rid of all the stress you have in life, blend in with nature and explore a world of peacefulness and calmness. Join me and learn how to lead a life full of joy and laughter.',
            instructor: 'R Madhavi',
          ),
          SizedBox(
            height: 20,
          ),
          MeditationCard(
            source: 'assets/images/run.jpg',
            title: 'Get Ripped Fast',
            descitpion:
                'Get rid of all the stress you have in life, blend in with nature and explore a world of peacefulness and calmness. Join me and learn how to lead a life full of joy and laughter.',
            instructor: 'Alastair Marshall',
          ),
          SizedBox(
            height: 20,
          ),
          MeditationCard(
            source: 'assets/images/jog2.jpg',
            title: 'Fitness 101',
            descitpion:
                'Get rid of all the stress you have in life, blend in with nature and explore a world of peacefulness and calmness. Join me and learn how to lead a life full of joy and laughter.',
            instructor: 'Benjamin Pross',
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
