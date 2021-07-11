import 'package:fitme/databases/data.dart';
import 'package:fitme/widgets/action_tile.dart';
import 'package:fitme/widgets/meditation_card.dart';
import 'package:fitme/widgets/workout_card.dart';
import 'package:flutter/material.dart';

class Workout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ActionTile(
                      name: 'Chest',
                      imageUrl: 'assets/images/push_ups.jpg',
                      rating: '4.5',
                      numberOfRating: '300',
                      price: '200',
                      nextStep: nextStepss[0],
                    ),
                  ),
                  Expanded(
                    child: ActionTile(
                      name: 'Legs',
                      imageUrl: 'assets/images/legs.jpg',
                      rating: '4.5',
                      numberOfRating: '300',
                      price: '200',
                      nextStep: nextStepss[1],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ActionTile(
                      name: 'Core',
                      imageUrl: 'assets/images/core.jpg',
                      rating: '4.5',
                      numberOfRating: '300',
                      price: '200',
                      nextStep: nextStepss[2],
                    ),
                  ),
                  Expanded(
                    child: ActionTile(
                      name: 'Arms',
                      imageUrl: 'assets/images/arms.jpg',
                      rating: '4.5',
                      numberOfRating: '300',
                      price: '200',
                      nextStep: nextStepss[0],
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
