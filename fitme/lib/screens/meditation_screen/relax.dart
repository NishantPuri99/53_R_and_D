import 'package:fitme/databases/data.dart';
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
                      nextStep: nextStepss[0],
                    ),
                  ),
                  Expanded(
                    child: ActionTile(
                      name: 'Breathing',
                      imageUrl: 'assets/images/breathing.jpg',
                      rating: '4.5',
                      numberOfRating: '300',
                      price: '200',
                      nextStep: nextStepss[0],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ActionTile(
                      name: 'Relaxing',
                      imageUrl: 'assets/images/relaxing.jpg',
                      rating: '4.5',
                      numberOfRating: '300',
                      price: '200',
                      nextStep: nextStepss[0],
                    ),
                  ),
                  Expanded(
                    child: ActionTile(
                      name: 'Unwinding',
                      imageUrl: 'assets/images/unwinding.jpg',
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
