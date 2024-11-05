import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final double width;
  final double height;

  const CategoryButton({
    required this.label,
    this.width = 80,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 0,
          side: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
