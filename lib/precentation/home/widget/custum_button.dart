import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class Custumiconwidget extends StatelessWidget {
  const Custumiconwidget(
      {Key? key,
      required this.icon,
      required this.text,
      this.iconsize = 18,
      this.textsize = 18})
      : super(key: key);
  final IconData icon;
  final String text;
  final double iconsize;
  final double textsize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhite,
          size: iconsize,
        ),
        Text(
          text,
          style: TextStyle(fontSize: textsize, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
