import 'package:flutter/material.dart';

class CarouselImageIndicator extends StatelessWidget {
  const CarouselImageIndicator(
      {super.key, required this.featuredImages, required this.currentIndex});
  final List<String> featuredImages;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 252,
      left: 170,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: featuredImages.asMap().entries.map((entry) {
          return Container(
            width: 12.0,
            height: 12.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black
                    .withOpacity(currentIndex == entry.key ? 0.9 : 0.4)),
          );
        }).toList(),
      ),
    );
  }
}
