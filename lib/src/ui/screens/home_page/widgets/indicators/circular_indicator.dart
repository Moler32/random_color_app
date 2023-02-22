import 'package:flutter/material.dart';

///Indicator widget
class CircularIndicator extends StatelessWidget {
  ///Indicator widget constructor
  const CircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
