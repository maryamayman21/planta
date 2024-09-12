import 'package:flutter/material.dart';

class ImageSliderController extends StatelessWidget {
  const ImageSliderController(
      {super.key, required this.icon, required this.onPressed});
  final Future<void> Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 16,
        child: Icon(icon, color: Colors.black, size: 25),
      ),
      onPressed: onPressed,
    );
  }
}
