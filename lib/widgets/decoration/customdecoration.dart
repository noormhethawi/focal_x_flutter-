import 'package:flutter/material.dart';

class CustomDecoration extends StatelessWidget {
  final double bottom;
  final double right;
  final double left;
  final double top;
  final String imagePath;

  const CustomDecoration({
    Key? key,
    required this.bottom,
    required this.right,
    required this.left,
    required this.top,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      left: left,
      top: top,
      child: SizedBox(
        width: 20, // حجم الزخرفة
        height: 20, // حجم الزخرفة
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
