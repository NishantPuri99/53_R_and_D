import 'package:fitme/models/appUser.dart';
import 'package:fitme/providers/auth_provider.dart';
import 'package:fitme/screens/additional_details_screen.dart';
import 'package:fitme/services/authentication_services.dart';
import 'package:fitme/widgets/action_card.dart';
import 'package:fitme/widgets/filled_button.dart';
import 'package:fitme/widgets/stats.dart';
import 'package:fitme/widgets/workout_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/meditation_card.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    final AppUser user =
        Provider.of<AuthProvider>(context, listen: false).getAppUser;
    if (user.weight == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text('Welcome to the App'),
              content: Text('Let\'s quickly fill up some details'),
              actions: [
                FilledButton(
                    title: 'Let\'s Go',
                    color: Colors.lightBlue,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return AdditionalDetailsScreen();
                          },
                        ),
                      );
                    })
              ],
            );
          },
        );
      });
    }
  }

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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return AdditionalDetailsScreen();
                        },
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.person,
                  ),
                ),

                // Profile
                IconButton(
                  onPressed: () {
                    AuthenticationServices().googleSignOut(context: context);
                  },
                  icon: Icon(
                    Icons.logout,
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
                    Consumer<AuthProvider>(
                      builder: (_, authProvider, child) {
                        return Text(
                          authProvider.getAppUser.name,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
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
            MeditationCard(
              source: 'assets/images/meditation.jpg',
              title: 'Meditate',
            ),
            SizedBox(
              height: 10,
            ),
            WorkoutCard(
              source: 'assets/images/jog.jpg',
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
                    source: 'assets/images/jog2.jpg',
                    time: 'Mon-Thu\n6:00PM',
                    title: 'Sweat\nIt',
                    description:
                        'Join the live classes for stretching exercises and more.',
                    startDate: '21-04-2021',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ActionCard(
                    source: 'assets/images/push_ups.jpg',
                    time: 'Mon-Thu\n4:00PM',
                    title: 'Calisthenics\nBurnout',
                    startDate: '27-04-2021',
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
