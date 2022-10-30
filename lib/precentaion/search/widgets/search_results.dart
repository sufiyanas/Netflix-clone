import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/colors/contsants.dart';
import 'package:netflix_clone/precentaion/search/widgets/search_idle.dart';
import 'package:netflix_clone/precentaion/search/widgets/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleTile(
          title: " Movies & TV",
        ),
        khight,
        Expanded(
            child: GridView.count(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1 / 1.5,
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(20, (index) {
            return const MainCard();
          }),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: const DecorationImage(
              image: NetworkImage(imageurl), fit: BoxFit.cover)),
    );
  }
}
