
import 'package:flutter/material.dart';

class WorkoutSchedulePage extends StatelessWidget {
  const WorkoutSchedulePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Workout Schedule",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22, color: Colors.grey),
      ),
    );
  }
}
