import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateTextfield extends StatelessWidget {
  const DateTextfield({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.isFocused,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isFocused;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [DateTextFormatter()],
      keyboardType: TextInputType.number,
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
      decoration: const InputDecoration(
          hintText: 'Expired Date (MM/YY)',
          hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
    );
  }
}

class DateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > oldValue.text.length &&
        newValue.text.isNotEmpty &&
        oldValue.text.isNotEmpty) {
      if (RegExp('[^0-9/]').hasMatch(newValue.text)) return oldValue;
      if (newValue.text.length > 5) {
        return oldValue; //no accepting more characters
      }
      if (newValue.text.length == 3 && newValue.text[2] != '/') {
        return TextEditingValue(
          text:
              '${newValue.text.substring(0, 2)}/${newValue.text.substring(2)}',
          selection: TextSelection.collapsed(
            offset: newValue.selection.end + 1,
          ),
        );
      }
    } else if (newValue.text.length == 1 &&
        oldValue.text.isEmpty &&
        RegExp('[^0-9]').hasMatch(newValue.text)) {
      return oldValue;
    }
    return newValue;
  }
}
