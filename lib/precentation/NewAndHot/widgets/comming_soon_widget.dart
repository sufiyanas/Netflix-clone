import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/contsants.dart';
import 'package:netflix_clone/precentation/NewAndHot/widgets/video_widget.dart';
import 'package:netflix_clone/precentation/home/widget/custum_button.dart';

class CommingSoonWidget extends StatelessWidget {
  const CommingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          height: 450,
          width: 50,
          child: Column(
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                '11',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ],
          ),
        ),
        Container(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
              Row(
                children: const [
                  Text(
                    'TALL GRID 2 ',
                    style: TextStyle(
                      wordSpacing: -5,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Custumiconwidget(
                      textsize: 10,
                      icon: Icons.notifications_outlined,
                      text: 'Remindme'),
                  kwidth,
                  Custumiconwidget(
                      textsize: 10, icon: Icons.info_outlined, text: 'info'),
                  kwidth,
                ],
              ),
              const Text('Comming on friday'),
              khight20,
              const Text(
                'Tall Grid 2',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              khight,
              const Text(
                'Landing the lead in the school musical is a dream come true for Jodi,until the pressure sends her confidance-and her releationship-into a tailspain',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}
