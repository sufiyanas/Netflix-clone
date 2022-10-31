import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class Custumiconwidget extends StatelessWidget {
  const Custumiconwidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
