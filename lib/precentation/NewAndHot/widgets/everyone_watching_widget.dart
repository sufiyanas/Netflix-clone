import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/contsants.dart';
import 'package:netflix_clone/precentation/NewAndHot/widgets/video_widget.dart';
import 'package:netflix_clone/precentation/home/widget/custum_button.dart';

class EveryoneWatching extends StatelessWidget {
  const EveryoneWatching({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        khight,
        const Text(
          'Friends',
          style: TextStyle(
              color: kwhite, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        khight,
        const Text(
          'This hit sitcom follos the merry misadvenchuers of six 20- something pals asthey negartive the pitfalls of works,life and love in 1990s Manhadhan ',
          style: TextStyle(color: Colors.grey),
        ),
        khight50,
        const VideoWidget(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Custumiconwidget(
                textsize: 16, iconsize: 25, icon: Icons.share, text: 'share'),
            kwidth,
            Custumiconwidget(
                textsize: 16, iconsize: 25, icon: Icons.add, text: 'My List'),
            kwidth,
            Custumiconwidget(
                textsize: 15,
                iconsize: 25,
                icon: Icons.play_arrow_rounded,
                text: 'Play'),
            kwidth
          ],
        )
      ],
    );
  }
}
