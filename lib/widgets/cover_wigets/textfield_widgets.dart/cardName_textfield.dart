import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardnameTextfield extends StatelessWidget {
  const CardnameTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.focusNode,
    required this.isFocused,
  });
  final TextEditingController controller;
  final String hintText;

  final FocusNode focusNode;
  final bool isFocused;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      focusNode: focusNode,
      style: TextStyle(
        color: isFocused
            ? Colors.black
            : Colors.grey, // Text dimmed when not focused
        fontSize: 20,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              const TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
    );
  }
}
