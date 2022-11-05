import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/contsants.dart';
import 'package:netflix_clone/core/colors/strings.dart';
import 'package:netflix_clone/precentation/search/widgets/title.dart';

class SearchIdlewidget extends StatelessWidget {
  const SearchIdlewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleTile(title: 'Top Searches'),
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text(
                    'Error Occuid',
                    style: TextStyle(color: kwhite),
                  ),
                );
              } else if (state.idleList.isEmpty) {
                const Center(
                  child: Text(
                    'List Is Empty',
                    style: TextStyle(color: kwhite),
                  ),
                );
              }

              return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = state.idleList[index];
                    return Topsearchitemtile(
                        title: movie.title ?? 'No title provided',
                        imageURL: '$imageAppendUrl${movie.postarPath}');
                  },
                  separatorBuilder: (context, index) => khight20,
                  itemCount: state.idleList.length);
            },
          ),
        )
      ],
    );
  }
}

class Topsearchitemtile extends StatelessWidget {
  const Topsearchitemtile(
      {super.key, required this.title, required this.imageURL});
  final String title;
  final String imageURL;
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenwidth * 0.35,
          height: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageURL),
            ),
          ),
        ),
        Expanded(
            child: Text(
          title,
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
