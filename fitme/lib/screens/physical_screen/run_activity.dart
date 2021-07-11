import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class RunData {
  final double dateOfCreation;
  final List<dynamic> activities;

  RunData({
    this.dateOfCreation,
    this.activities,
  });

  factory RunData.fromJson(Map<String, dynamic> json) {
    var activityList = [];
    var date = 0.0;
    for (var entry in json.entries) {
      if (entry.key == "dateOfCreation") {
        date = json['dateOfCreation'];
      } else {
        activityList.add(entry);
      }
    }
    return RunData(
      dateOfCreation: date,
      activities: activityList,
    );
  }
}

Future<RunData> fetchActivity() async {
  var userID = 1;
  final response = await http.get(
      Uri.parse('https://activity-endpoint.herokuapp.com/get-scores/$userID'));
  if (response.statusCode == 200) {
    var getResponse = RunData.fromJson(jsonDecode(response.body));
    return getResponse;
  } else {
    throw Exception('Failed to get Response');
  }
}

class RunAct extends StatefulWidget {
  @override
  _RunAct createState() => _RunAct();
}

class _RunAct extends State<RunAct> {
  Random random = new Random();
  final List<Color> colors = [
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.cyan,
    Colors.grey
  ];
  Future<RunData> futureRunData;

  @override
  void initState() {
    super.initState();
    futureRunData = fetchActivity();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> itemsArr = [];

    return Scaffold(
        body: Center(
      child: FutureBuilder<RunData>(
        future: futureRunData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (var activity in snapshot.data.activities) {
              print(activity.key);
              print(activity.value);
              itemsArr.add(FancyCard(
                image: Image.asset("distance.jpeg"),
                title: activity.key.toString(),
                distance: "${activity.value['targetDistance_km']} KM",
                time: "${activity.value['timeSpent_mins']} mins",
                date: DateTime.fromMillisecondsSinceEpoch(
                        (activity.value['timeSpent_mins'] * 1000).toInt())
                    .toString(),
              ));
            }
            return Container(
              child: StackedCardCarousel(
                items: itemsArr,
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    ));
  }
}

class FancyCard extends StatelessWidget {
  const FancyCard({
    Key key,
    this.image,
    this.title,
    this.distance,
    this.time,
    this.date,
  }) : super(key: key);

  final Image image;
  final String title;
  final String distance;
  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 250,
              height: 250,
              child: image,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text("Distance: $distance"),
            Text("Time: $time"),
            Text("Date: $date"),
          ],
        ),
      ),
    );
  }
}
