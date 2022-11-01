import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/colors/contsants.dart';
import 'package:netflix_clone/precentation/home/widget/backgroundStackImage.dart';
import 'package:netflix_clone/precentation/home/widget/main_title_card.dart';
import 'package:netflix_clone/precentation/home/widget/number_list_card.dart';

ValueNotifier<bool> scrolldirection = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrolldirection,
      builder: (context, index, _) => SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrolldirection.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrolldirection.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: const [
                  Backgroudimage(),
                  khight,
                  MainTitleCardWidget(title: 'Released in the past year'),
                  khight,
                  MainTitleCardWidget(title: 'Trenting Now'),
                  khight,
                  //stack view
                  Numbertitlecard(),
                  khight,
                  MainTitleCardWidget(title: 'Tence dramas '),
                  khight,
                  MainTitleCardWidget(title: 'South indian cinema'),
                ],
              ),
              (scrolldirection.value == true)
                  ? AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: double.infinity,
                      height: 100,
                      color: Colors.black.withOpacity(0.2),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                'https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png',
                                width: 70,
                                height: 70,
                              ),
                              const Spacer(),
                              // ignore: prefer_const_constructors
                              Icon(
                                Icons.cast,
                                color: Colors.white,
                              ),
                              kwidth,
                              Container(
                                width: 30,
                                height: 30,
                                color: Colors.blue,
                              ),
                              kwidth,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('TV Shows',
                                  style: ktextstyleforhomepageitle),
                              Text(
                                'Movies',
                                style: ktextstyleforhomepageitle,
                              ),
                              Text(
                                'Catogeris',
                                style: ktextstyleforhomepageitle,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : khight
            ],
          ),
        ),
      ),
    ));
  }
}
