import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function onTap;

  FilledButton(
      {@required this.title, @required this.color, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            const Radius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
