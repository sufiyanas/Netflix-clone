import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/mqsPyyeDCBAghXyjbw4TfEYwljw.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 0,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_off,
                  color: kwhite,
                  size: 30,
                )),
          ),
        ),
      ],
    );
  }
}
