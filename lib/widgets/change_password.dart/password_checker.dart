import 'package:flutter/material.dart';

class PasswordChecker extends StatelessWidget {
  const PasswordChecker(
      {super.key, required this.validColor, required this.validationText});
  final Color validColor;
  final String validationText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: validColor,
            size: 16,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            validationText,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
