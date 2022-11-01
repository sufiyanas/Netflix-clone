import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, this.index});
  final index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_off,
                        color: kwhite,
                        size: 30,
                      )),
                ),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://www.themoviedb.org/t/p/w220_and_h330_face/z2yahl2uefxDCl0nogcRBstwruJ.jpg'),
                      ),
                    ),
                    VideoActionswidget(
                        title: 'Lol', icon: Icons.emoji_emotions),
                    VideoActionswidget(title: 'My List', icon: Icons.add),
                    VideoActionswidget(title: 'Share', icon: Icons.share),
                    VideoActionswidget(title: 'play ', icon: Icons.play_arrow)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionswidget extends StatelessWidget {
  const VideoActionswidget(
      {super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: kwhite,
          ),
          Text(
            title,
            style: TextStyle(color: kwhite, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
