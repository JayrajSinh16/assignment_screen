import 'package:flutter/material.dart';

class ExploreProgramsPage extends StatelessWidget {
  const ExploreProgramsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "This is the Explore Programs page.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: Colors.grey[700]),
      ),
    );
  }
}