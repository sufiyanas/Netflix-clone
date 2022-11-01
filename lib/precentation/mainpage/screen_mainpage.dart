import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/precentation/FastLaughs/screen_fast_laughss.dart';
import 'package:netflix_clone/precentation/NewAndHot/new_and_hot.dart';
import 'package:netflix_clone/precentation/downloads/screen_downloads.dart';
import 'package:netflix_clone/precentation/mainpage/widgets/bottom_nav.dart';
import 'package:netflix_clone/precentation/search/screen_search.dart';
import '../home/screen_home.dart';

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
