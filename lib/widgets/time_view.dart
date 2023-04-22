import 'package:flutter/material.dart';

class TimeView extends StatelessWidget {
  final Function() onTap;
  final String text;

  const TimeView({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black)));
  }
}