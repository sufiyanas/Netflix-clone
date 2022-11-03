import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/contsants.dart';
import 'package:netflix_clone/precentation/NewAndHot/widgets/comming_soon_widget.dart';
import 'widgets/Everyone_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                'News & Hot',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
                kwidth,
                Container(
                  width: 30,
                  color: Colors.blue,
                ),
              ],
              bottom: TabBar(
                  indicatorColor: kwhite,
                  unselectedLabelColor: kwhite,
                  labelColor: kblack,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  tabs: const [
                    Tab(
                      text: '🍿 Comming Soon',
                    ),
                    Tab(
                      text: '👀 Everyone Watching',
                    )
                  ]),
            ),
          ),
          body: TabBarView(children: [
            _buildCommingSoon(context),
            _buildEveryOneWatching(),
          ])),
    );
  }

  _buildCommingSoon(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const CommingSoonWidget(),
    );
  }

  _buildEveryOneWatching() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const EveryoneWatching());
  }
}
