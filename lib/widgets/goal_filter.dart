import 'package:flutter/material.dart';

class GoalFilter extends StatelessWidget {
  final List<String> goalTypes;
  final String selectedGoal;
  final ValueChanged<String> onSelected;

  const GoalFilter({
    super.key,
    required this.goalTypes,
    required this.selectedGoal,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: goalTypes.map((goal) {
          final selected = selectedGoal == goal;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ChoiceChip(
              label: Text(goal),
              selected: selected,
              onSelected: (val) => onSelected(goal),
              selectedColor: Colors.blue.shade100,
              backgroundColor: Colors.grey.shade200,
              labelStyle: TextStyle(color: selected ? Colors.blue : Colors.black54),
            ),
          );
        }).toList(),
      ),
    );
  }
}