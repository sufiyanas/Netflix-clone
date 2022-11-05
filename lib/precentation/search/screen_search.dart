import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/colors/contsants.dart';
import 'package:netflix_clone/precentation/search/widgets/search_idle.dart';
import 'package:netflix_clone/precentation/search/widgets/search_results.dart';

class ScreeenSearch extends StatelessWidget {
  const ScreeenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            backgroundColor: Colors.grey.withOpacity(0.4),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
            ),
            suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                color: Colors.grey),
            style: const TextStyle(color: Colors.grey),
            onChanged: (value) {
              BlocProvider.of<SearchBloc>(context)
                  .add(Searchmovie(movieQuery: value));
            },
          ),
          khight,
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchResultList.isEmpty) {
                return const Expanded(child: SearchIdlewidget());
              } else {
                return const Expanded(child: SearchResultWidget());
              }

              // return Expanded(child: const SearchIdlewidget());
            },
          ),
          //  Expanded(child: const SearchIdlewidget())
        ],
      ),
    )));
  }
}
