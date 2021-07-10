import 'package:fitme/constants.dart';
import 'package:fitme/screens/mindfulness.dart';
import 'package:fitme/widgets/filled_button.dart';
import 'package:fitme/widgets/line_button.dart';
import 'package:fitme/widgets/meditation_card.dart';
import 'package:fitme/widgets/workout_card.dart';
import 'package:flutter/material.dart';

class ClassDetailsScreen extends StatelessWidget {
  final TextEditingController minutesController = TextEditingController();

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
                  source: 'assets/images/meditation2.jpg',
                  title: 'Meditate',
                ),
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
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Text('Enter the duration'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: minutesController,
                                decoration: inputDecoration.copyWith(
                                  labelText: 'Duration in minutes',
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              LineButton(
                                title: 'JOIN',
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return Mindfulness(
                                          minutes:
                                              int.parse(minutesController.text),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
