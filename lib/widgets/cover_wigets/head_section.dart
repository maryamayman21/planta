import 'package:flutter/material.dart';

class HeadSection extends StatelessWidget {
  const HeadSection({super.key, required this.onPress, required this.title});
  final void Function()? onPress;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
      ),
      TextButton(
          onPressed: onPress,
          child: const Text(
            'edit',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ))
    ]);
  }
}
