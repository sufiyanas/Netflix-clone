import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/colors/contsants.dart';
import 'package:netflix_clone/precentation/home/widget/main_card.dart';
import 'package:netflix_clone/precentation/search/widgets/title.dart';

class MainTitleCardWidget extends StatelessWidget {
  const MainTitleCardWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SearchTitleTile(title: title),
      ),
      khight,
      LimitedBox(
        maxHeight: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 14,
          itemBuilder: (context, index) {
            return const Maincard();
          },
        ),
      ),
    ]);
  }
}
