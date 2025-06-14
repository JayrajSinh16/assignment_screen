import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;

  const SearchBarWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromARGB(255, 184, 187, 192), width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search for programs, trainers, goals...',
                hintStyle: TextStyle(
                  color: Color(0xFFAEB2C1),
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const Icon(Icons.search, color: Color(0xFF8D9096)),
          const SizedBox(width: 12),
          Container(
            width: 1, height: 24,
            color: const Color(0xFFE2E5EA),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onFilterTap,
            child: const Icon(Icons.tune, color: Color(0xFF8D9096)),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}