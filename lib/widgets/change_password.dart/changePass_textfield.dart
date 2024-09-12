import 'package:flutter/material.dart';

class ChangepassTextfield extends StatelessWidget {
  const ChangepassTextfield({
    super.key,
    required this.contoller,
    required this.borderColor,
    required this.isObscure,
    this.onPressed,
    required this.hintText,
    required this.labelText,
    this.onChanged,
    this.validator,
  });
  final TextEditingController contoller;
  final Color borderColor;
  final bool isObscure;
  final void Function()? onPressed;
  final String hintText;
  final String labelText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: contoller,
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: AutovalidateMode.disabled,
      obscureText: isObscure,
      style: const TextStyle(fontSize: 18),
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: onPressed,
            icon: isObscure
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off)),
        floatingLabelStyle: TextStyle(
          color: borderColor,
          // Make the floating label text larger
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        hintText: hintText,
        label: Text(labelText),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: borderColor, width: 2.0)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 2.0),
          gapPadding: 10,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: borderColor, width: 2.0), // Focused border
        ),
      ),
    );
  }
}
