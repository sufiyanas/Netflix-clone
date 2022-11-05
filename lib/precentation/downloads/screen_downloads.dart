import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/colors/contsants.dart';
import 'package:netflix_clone/core/colors/strings.dart';
import 'package:netflix_clone/precentation/widgets/appbar.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});
  final _widgetList = [_smartwidget(), const section2(), const section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBarWidget(
            title: "Downloads",
          ),
        ),
        body: ListView.separated(
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) => _widgetList[index],
            separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
            itemCount: _widgetList.length));
  }

  // Row _smartwidget() {
  //   return Row(
  //     children: const [
  //       Icon(Icons.settings, color: kwhite),
  //       Text('Smart Downloads'),
  //     ],
  //   );
  // }
}

class _smartwidget extends StatelessWidget {
  const _smartwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.settings, color: kwhite),
        Text('Smart Downloads'),
      ],
    );
  }
}

class Downloadimagewidget extends StatelessWidget {
  const Downloadimagewidget({
    Key? key,
    required this.image,
    this.angle = 0,
    required this.margin,
  }) : super(key: key);

  final String image;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * 0.4,
        height: size.width * 0.6,
        decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(image)),
            color: kblack,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

//section one have only one element so no need of creatiing it again
//section two
class section2 extends StatelessWidget {
  const section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadsEvent.getDownloadsImage());

    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introducing Download for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kwhite,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        khight,
        const Text(
            "We will download a personalised selection of \n movies and shows for you , so there's\n always something to watch on your\n device",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 16)),
        BlocBuilder<DownloadsBloc, DownloadState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: size.width * 0.40,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        Downloadimagewidget(
                          image:
                              '$imageAppendUrl${state.downloads[0].postarPath}',
                          margin: const EdgeInsets.only(left: 130),
                          angle: 20,
                        ),
                        Downloadimagewidget(
                          image:
                              '$imageAppendUrl${state.downloads[1].postarPath}',
                          margin: const EdgeInsets.only(right: 130),
                          angle: -20,
                        ),
                        Downloadimagewidget(
                          image:
                              '$imageAppendUrl${state.downloads[2].postarPath}',
                          margin: const EdgeInsets.only(left: 0),
                        ),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

//section 3
class section3 extends StatelessWidget {
  const section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {},
              color: Colors.blueAccent[700],
              child: const Text(
                'Set up',
                style: TextStyle(
                    color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            color: kwhite,
            child: const Text(
              'See what you can download',
              style: TextStyle(
                  color: kblack, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
