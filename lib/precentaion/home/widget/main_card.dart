import 'package:flutter/material.dart';

class Maincard extends StatelessWidget {
  const Maincard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          image: DecorationImage(
              image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w220_and_h330_face/f2PVrphK0u81ES256lw3oAZuF3x.jpg'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
