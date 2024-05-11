import 'package:flutter/material.dart';

class CustomIncreasedCounter extends StatelessWidget {
  final int counter;
  final VoidCallback? onPressed;
  const CustomIncreasedCounter(
      {super.key, required this.counter, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: '$counter', onPressed: onPressed, child: Text('+$counter'));
  }
}
