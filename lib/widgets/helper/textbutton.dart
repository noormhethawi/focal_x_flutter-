import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color bckColor;
  final Color textColor;

  const CustomButton(
      {super.key, required this.buttonText,
      required this.onPressed,
      required this.bckColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 335,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(bckColor),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
            fontSize: 14,
            fontFamily: 'Raleway',
            height: 0,
          ),
        ), // Corrected onPressed here
      ),
    );
  }
}
