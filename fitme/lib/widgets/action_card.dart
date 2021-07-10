import 'package:fitme/globals.dart';
import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final String source;
  final String title;
  final String description;
  final String startDate;
  final String time;

  ActionCard({
    @required this.source,
    @required this.title,
    @required this.description,
    @required this.startDate,
    @required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: deviceWidth * 0.7,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            image: DecorationImage(
              image: AssetImage(source),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          width: deviceWidth * 0.7,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),
            color: Colors.black26,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Starts $startDate',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
