import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/precentaion/home/widget/custum_button.dart';

class Backgroudimage extends StatelessWidget {
  const Backgroudimage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 700,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w220_and_h330_face/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg',
                  ),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Custumiconwidget(
                  icon: Icons.add,
                  text: 'My list',
                ),
                _playiconButtonTopRow(),
                Custumiconwidget(icon: Icons.info, text: 'info')
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playiconButtonTopRow() {
    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kwhite),
        ),
        icon: Icon(
          Icons.play_arrow,
          color: kblack,
        ),
        label: Text(
          'Play',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: kblack),
        ));
  }
}
