import 'package:fitme/widgets/header.dart';
import 'package:fitme/widgets/lottie_card.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class DietScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Header(
            'Diet',
            rightSide: Container(
              height: 35.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(100, 140, 255, 1.0),
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
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: LottieCard(
                      title: 'Eat Green\nVegetables',
                      source: 'assets/lotties/food0.json',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: LottieCard(
                      title: 'Have Balanced\nMeals',
                      source: 'assets/lotties/food1.json',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: LottieCard(
                      title: 'Drink lots of\nWater',
                      source: 'assets/lotties/food3.json',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: LottieCard(
                      title: 'Take walk after\nMeals',
                      source: 'assets/lotties/walk.json',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
