import 'package:flutter/material.dart';

class PlantCategory extends StatelessWidget {
  const PlantCategory({super.key, required this.categoryTitle});
  final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xff007537),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(
        categoryTitle,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
    );
  }
}
