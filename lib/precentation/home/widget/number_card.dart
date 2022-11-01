import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/contsants.dart';

class NumberCardwidget extends StatelessWidget {
  const NumberCardwidget({super.key, required this.index});
  final index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            kwidt30,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w220_and_h330_face/f2PVrphK0u81ES256lw3oAZuF3x.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: 1,
          child: BorderedText(
            strokeWidth: 4,
            strokeColor: kwhite,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 120,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  decorationColor: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
