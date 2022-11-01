import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/contsants.dart';
import 'package:netflix_clone/precentation/search/widgets/title.dart';

const imageurl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/tFlSDoWQsAZ2qjICKzfP5Yw6zM5.jpg';

class SearchIdlewidget extends StatelessWidget {
  const SearchIdlewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleTile(title: 'Top Searches'),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const Topsearchitemtile(),
              separatorBuilder: (context, index) => khight20,
              itemCount: 15),
        )
      ],
    );
  }
}

class Topsearchitemtile extends StatelessWidget {
  const Topsearchitemtile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.35,
          height: 120,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageurl),
            ),
          ),
        ),
        const Expanded(
            child: Text(
          'Movie Name',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        const CircleAvatar(
          backgroundColor: kwhite,
          radius: 22,
          child: CircleAvatar(
            backgroundColor: kblack,
            radius: 20,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhite,
            ),
          ),
        )
      ],
    );
  }
}
