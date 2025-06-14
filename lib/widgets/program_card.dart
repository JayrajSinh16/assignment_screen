import 'package:flutter/material.dart';
import '../models/program_model.dart';
import 'tag_chip.dart';

class ProgramCard extends StatelessWidget {
  final Program program;
  final VoidCallback? onTap;
  const ProgramCard({super.key, required this.program, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  program.image,
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(217, 10, 25, 49),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    program.price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  program.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(program.couchImage),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      program.trainer,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  children: [
                    TagChips(type: TagChipType.goal, label: program.goal),
                    TagChips(
                      type: TagChipType.level,
                      label: program.difficulty,
                    ),
                    TagChips(
                      type: TagChipType.duration,
                      label: program.duration,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
