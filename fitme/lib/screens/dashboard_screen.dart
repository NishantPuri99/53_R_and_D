import 'package:fitme/services/authentication_services.dart';
import 'package:fitme/widgets/action_card.dart';
import 'package:fitme/widgets/stats.dart';
import 'package:flutter/material.dart';

import '../widgets/workout_card.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hamburger and Profile
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Hamburger
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.apps,
                  ),
                ),

                // Profile
                IconButton(
                  onPressed: () {
                    AuthenticationServices().googleSignOut(context: context);
                  },
                  icon: Icon(
                    Icons.person,
                  ),
                ),
              ],
            ),

            // Name and Greetings
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'D Ajay Kumar',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),

            // stats
            Stats(),

            SizedBox(
              height: 30,
            ),

            Text(
              'Classes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(
              height: 10,
            ),
            WorkoutCard(
              source: 'https://picsum.photos/200/300',
              title: 'Meditate',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutCard(
              source: 'https://picsum.photos/200/300',
              title: 'Run with Josh',
            ),
            SizedBox(
              height: 30,
            ),

            Text(
              'Upcoming Live Sessions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 320,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ActionCard(
                    source: 'assets/images/stretching.jpg',
                    time: 'Mon-Thu\n4:00PM',
                    title: 'Stretch\nOut',
                    startDate: '21-04-2021',
                    description:
                        'Join the live classes for stretching exercises and more.',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ActionCard(
                    source: 'assets/images/stretching.jpg',
                    time: 'Mon-Thu\n4:00PM',
                    title: 'Stretch\nOut',
                    description:
                        'Join the live classes for stretching exercises and more.',
                    startDate: '21-04-2021',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ActionCard(
                    source: 'assets/images/stretching.jpg',
                    time: 'Mon-Thu\n4:00PM',
                    title: 'Stretch\nOut',
                    startDate: '21-04-2021',
                    description:
                        'Join the live classes for stretching exercises and more.',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
