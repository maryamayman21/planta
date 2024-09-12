import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget(
      {super.key, required this.title, required this.fontSize});
  final String title;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
