// section_widget.dart

import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final bool editFlag;
  final void Function() onEditPressed;
  final List<Widget> textFields; // Accept a list of text fields

  const SectionWidget({
    required this.title,
    required this.editFlag,
    required this.onEditPressed,
    required this.textFields,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEditPressed,
            ),
          ],
        ),
        const Divider(thickness: 1, color: Colors.black87),
        ...textFields, // Spread the list of text fields
      ],
    );
  }
}
