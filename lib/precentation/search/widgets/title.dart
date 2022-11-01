import 'package:flutter/material.dart';

class SearchTitleTile extends StatelessWidget {
  const SearchTitleTile({
    Key? key,
    required this.title,
  }) : super(key: key);
  final title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
