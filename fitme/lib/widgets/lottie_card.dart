import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class LottieCard extends StatelessWidget {
  final String title;
  final String source;

  LottieCard({@required this.title, @required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(
          const Radius.circular(10.0),
        ),
      ),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 10,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 40,
            right: 10,
            bottom: 10,
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Lottie.asset(
              source,
            ),
          ),
        ),
      ]),
    );
  }
}
