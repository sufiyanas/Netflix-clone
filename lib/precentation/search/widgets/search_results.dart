import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/colors/contsants.dart';
import 'package:netflix_clone/precentation/search/widgets/title.dart';

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
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return GridView.count(
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.5,
              shrinkWrap: true,
              crossAxisCount: 3,
              children: List.generate(20, (index) {
                final movie = state.searchResultList[index];
                return MainCard(imageUrl: movie.posterImageUrl);
              }),
            );
          },
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              image: NetworkImage(imageUrl), fit: BoxFit.cover)),
    );
  }
}
