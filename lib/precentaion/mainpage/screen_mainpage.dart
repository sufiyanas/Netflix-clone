import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/precentaion/FastLaughs/screen_fast_laughss.dart';
import 'package:netflix_clone/precentaion/NewAndHot/new_and_hot.dart';
import 'package:netflix_clone/precentaion/downloads/screen_downloads.dart';
import 'package:netflix_clone/precentaion/home/Screen_home.dart';
import 'package:netflix_clone/precentaion/mainpage/widgets/bottom_nav.dart';
import 'package:netflix_clone/precentaion/search/screen_search.dart';

class ScreenMainpage extends StatelessWidget {
  ScreenMainpage({super.key});
  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaughs(),
    ScreeenSearch(),
    ScreenDownload()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgrountcolor,
        body: ValueListenableBuilder(
          valueListenable: indexchangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
        bottomNavigationBar: BottomNavWidget());
  }
}
