import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinTextfield extends StatelessWidget {
  const PinTextfield({
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
      controller: controller,
      inputFormatters: [MaskedTextInputFormatter(maskCharacter: 'x')],
      focusNode: focusNode,
      style: TextStyle(
        color: isFocused
            ? Colors.black
            : Colors.grey, // Text dimmed when not focused
        fontSize: 20,
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (value.length < 11) {
          return 'Input not valid';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          hintText: 'PIN',
          hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
    );
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String? maskCharacter;

  MaskedTextInputFormatter({required this.maskCharacter});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Replace every character with the maskCharacter
    String maskedText = maskCharacter! * newValue.text.length;
    if (newValue.text.length > 11) {
      return oldValue; //no accepting more characters
    }
    return TextEditingValue(
      text: maskedText,
      selection: TextSelection.collapsed(offset: maskedText.length),
    );
  }
}
