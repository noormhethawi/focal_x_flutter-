import 'package:flutter/material.dart';

class Custombuttonappbar extends StatelessWidget {
  final IconData icon;
  final bool active;
  final void Function()? onPressed;
  Custombuttonappbar({
    super.key,
    required this.icon,
    this.onPressed,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: active == true ? Colors.green : Colors.grey,
      ),
    );
  }
}
