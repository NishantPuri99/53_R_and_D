import 'package:fitme/constants.dart';
import 'package:fitme/screens/mindfulness.dart';
import 'package:fitme/widgets/filled_button.dart';
import 'package:fitme/widgets/line_button.dart';
import 'package:fitme/widgets/meditation_card.dart';
import 'package:fitme/widgets/workout_card.dart';
import 'package:flutter/material.dart';

class ClassDetailsScreen extends StatelessWidget {
  final TextEditingController minutesController = TextEditingController();
  final String description;
  final String title;
  final String instructor;
  final String image;

  ClassDetailsScreen({
    @required this.title,
    @required this.description,
    @required this.instructor,
    @required this.image,
  });

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
                  source: image,
                  title: title,
                  descitpion: description,
                  instructor: instructor,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  description,
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
                  instructor,
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
