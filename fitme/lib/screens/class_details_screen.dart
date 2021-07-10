import 'package:fitme/widgets/filled_button.dart';
import 'package:fitme/widgets/workout_card.dart';
import 'package:flutter/material.dart';

class ClassDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WorkoutCard(
                  source: 'https://picsum.photos/200/300',
                  title: 'Meditate',
                ),
                // ActionCard(
                //   source: 'assets/images/stretching.jpg',
                //   title: 'Stretch\nOut',
                //   description:
                //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                //   startDate: '21-04-2021',
                //   time: 'Mon-Thu\n4:00PM',
                // ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Yoga by the Ocean',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut\nlabore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Instructor',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'MS Dhoni',
                  style: TextStyle(),
                ),
                SizedBox(
                  height: 10,
                ),
                FilledButton(
                  title: 'JOIN',
                  color: Colors.lightBlue[300],
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
