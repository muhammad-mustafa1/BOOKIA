import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'B O O K I A',
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}
