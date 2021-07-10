import 'package:fitme/screens/class_details_screen.dart';
import 'package:flutter/material.dart';

class MeditationCard extends StatelessWidget {
  final String source;
  final String title;

  MeditationCard({
    @required this.source,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return ClassDetailsScreen();
            },
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
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
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
              color: Colors.black26,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
