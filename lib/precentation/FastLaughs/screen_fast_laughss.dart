import 'package:flutter/material.dart';
import 'package:netflix_clone/precentation/FastLaughs/widgets/videio_list_item.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            10,
            (index) {
              return VideoListItem(
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}
