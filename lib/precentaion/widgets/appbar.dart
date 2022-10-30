import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 30, fontWeight: FontWeight.w700),
          ),
          Spacer(),
          Icon(
            Icons.cast,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            width: 30,
            height: 30,
            color: Colors.blue,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
