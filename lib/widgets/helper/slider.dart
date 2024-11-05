import 'package:flutter/material.dart';

class SliderDots extends StatelessWidget {
  final int totalDots;
  final int currentIndex;

  const SliderDots(
      {super.key, required this.totalDots, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        totalDots,
        (index) => buildDot(index == currentIndex),
      ),
    );
  }

  Widget buildDot(bool isActive) {
    return Container(
      width: isActive ? 35 : 26, // Adjust the width of the dot
      height: 5, // Adjust the height of the dot
      margin:
          const EdgeInsets.symmetric(horizontal: 3), // Reduce horizontal margin
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        shape: BoxShape.rectangle,
        color: isActive ? Colors.white : Colors.green,
      ),
    );
  }
}
