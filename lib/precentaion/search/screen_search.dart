import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/contsants.dart';
import 'package:netflix_clone/precentaion/search/widgets/search_idle.dart';
import 'package:netflix_clone/precentaion/search/widgets/search_results.dart';

class ScreeenSearch extends StatelessWidget {
  const ScreeenSearch({super.key});

  @override
  Widget build(BuildContext context) {
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
          ),
          khight,
          Expanded(child: const SearchResultWidget())
        ],
      ),
    )));
  }
}
