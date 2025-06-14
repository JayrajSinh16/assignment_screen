import 'package:flutter/material.dart';
import '../models/program_model.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/tag_chip.dart';

class ProgramDetailPage extends StatelessWidget {
  final Program program;
  const ProgramDetailPage({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: CustomBackButton(
            onTap: () {
              Navigator.of(context).maybePop();
            },
          ),
        ),
        title: Text(program.title, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                program.image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              program.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text('Trainer: ${program.trainer}'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                TagChips(type: TagChipType.goal, label: program.goal),
                TagChips(type: TagChipType.level, label: program.difficulty),
                TagChips(type: TagChipType.duration, label: program.duration),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Price: ${program.price}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
