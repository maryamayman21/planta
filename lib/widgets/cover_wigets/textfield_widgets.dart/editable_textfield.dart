import 'package:flutter/material.dart';

class EditableTextfield extends StatelessWidget {
  const EditableTextfield(
      {super.key,
      required this.controller,
      required this.keyboardType,
      required this.isEnabled});
  final TextEditingController controller;

  final TextInputType keyboardType;

  final bool isEnabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      enableInteractiveSelection: isEnabled, // will disable paste operation
      focusNode: isEnabled ? null : new AlwaysDisabledFocusNode(),
      controller: controller,
      style: const TextStyle(fontSize: 20),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
