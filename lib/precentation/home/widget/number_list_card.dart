import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/contsants.dart';
import 'package:netflix_clone/precentation/home/widget/number_card.dart';
import 'package:netflix_clone/precentation/search/widgets/title.dart';

class Numbertitlecard extends StatelessWidget {
  const Numbertitlecard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: SearchTitleTile(title: 'Top 10 shows in india today'),
      ),
      khight,
      LimitedBox(
        maxHeight: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 14,
          itemBuilder: (context, index) {
            return NumberCardwidget(
              index: index,
            );
          },
        ),
      ),
    ]);
  }
}
