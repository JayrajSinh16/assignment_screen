import 'package:flutter/material.dart';

class OtherTabPage extends StatelessWidget {
  const OtherTabPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Other Tab",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22, color: Colors.grey),
      ),
    );
  }
}
