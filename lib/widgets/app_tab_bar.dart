import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> tabs;
  final ValueChanged<int>? onTabSelected;

  const AppTabBar({
    super.key,
    required this.selectedIndex,
    required this.tabs,
    this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(tabs.length, (i) {
        final isSelected = selectedIndex == i;
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (onTabSelected != null) onTabSelected!(i);
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: isSelected ? Colors.blue : Colors.grey.shade300,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  tabs[i],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.blue : Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}