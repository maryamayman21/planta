import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: MaterialButton(
        onPressed: onPressed,
        color:
            const Color.fromARGB(255, 46, 103, 124), // Button background color
        textColor: Colors.white, // Text color
        padding: const EdgeInsets.all(16.0),
        minWidth: double.infinity, // Padding inside the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
        ),
        child: const Text(
          'Confirm',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
