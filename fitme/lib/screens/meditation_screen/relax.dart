import 'package:fitme/widgets/action_tile.dart';
import 'package:fitme/widgets/meditation_card.dart';
import 'package:fitme/widgets/workout_card.dart';
import 'package:flutter/material.dart';

class Relax extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // MeditationCard(
          //   source: 'assets/images/meditation2.jpg',
          //   title: 'Garden Meditation',
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // MeditationCard(
          //   source: 'assets/images/meditation2.jpg',
          //   title: 'Beach Meditation',
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // MeditationCard(
          //   source: 'assets/images/meditation2.jpg',
          //   title: 'Calm Meditation',
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // MeditationCard(
          //   source: 'assets/images/meditation2.jpg',
          //   title: 'Rain Meditation',
          // ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ActionTile(
                      name: 'Yoga',
                      imageUrl: 'assets/images/yoga.jpg',
                      rating: '4.5',
                      numberOfRating: '300',
                      price: '200',
                    ),
                  ),
                  Expanded(
                    child: ActionTile(
                      name: 'Yoga',
                      imageUrl: 'assets/images/yoga.jpg',
                      rating: '4.5',
                      numberOfRating: '300',
                      price: '200',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ActionTile(
                      name: 'Yoga',
                      imageUrl: 'assets/images/yoga.jpg',
                      rating: '4.5',
                      numberOfRating: '300',
                      price: '200',
                    ),
                  ),
                  Expanded(
                    child: ActionTile(
                      name: 'Yoga',
                      imageUrl: 'assets/images/yoga.jpg',
                      rating: '4.5',
                      numberOfRating: '300',
                      price: '200',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ActionTile(
                      name: 'Yoga',
                      imageUrl: 'assets/images/yoga.jpg',
                      rating: '4.5',
                      numberOfRating: '300',
                      price: '200',
                    ),
                  ),
                  Expanded(
                    child: ActionTile(
                      name: 'Yoga',
                      imageUrl: 'assets/images/yoga.jpg',
                      rating: '4.5',
                      numberOfRating: '300',
                      price: '200',
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
