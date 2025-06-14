import 'package:flutter/material.dart';
import '../db/firestore_repo.dart';
import '../widgets/goal_filter.dart';
import '../widgets/program_card.dart';
import '../widgets/search_bar.dart';
import '../models/program_model.dart';
import 'program_detail_page.dart';

class MyProgramPage extends StatefulWidget {
  const MyProgramPage({super.key});
  @override
  State<MyProgramPage> createState() => _MyProgramPageState();
}

class _MyProgramPageState extends State<MyProgramPage> {
  final List<String> _goalTypes = [
    'All',
    'Muscle Gain',
    'Weight Loss',
    'Strength',
    'Flexibility',
  ];
  String _selectedGoal = 'All';
  String _searchQuery = '';
  late Future<List<Program>> _programsFuture;
  List<Program> _allPrograms = [];

  @override
  void initState() {
    super.initState();
    _programsFuture = ProgramRepository().fetchPrograms();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Program>>(
      future: _programsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Colors.blue,));
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error loading programs.\n${snapshot.error}'));
        }

        _allPrograms = snapshot.data ?? [];

        // Goal filter
        List<Program> filteredPrograms = _selectedGoal == 'All'
            ? _allPrograms
            : _allPrograms.where((p) => p.goal == _selectedGoal).toList();

        if (_searchQuery.isNotEmpty) {
          filteredPrograms = filteredPrograms.where((p) =>
            p.title.toLowerCase().contains(_searchQuery) ||
            p.trainer.toLowerCase().contains(_searchQuery)
          ).toList();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'My Programs',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            const Text(
              'Explore to find your new goal',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            SearchBarWidget(
              onChanged: _onSearchChanged,
              onFilterTap: () {},
            ),
            const SizedBox(height: 8),
            GoalFilter(
              goalTypes: _goalTypes,
              selectedGoal: _selectedGoal,
              onSelected: (goal) => setState(() => _selectedGoal = goal),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: filteredPrograms.isEmpty
                  ? const Center(child: Text('No programs found'))
                  : ListView.builder(
                      itemCount: filteredPrograms.length,
                      itemBuilder: (context, idx) {
                        final prog = filteredPrograms[idx];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => ProgramDetailPage(program: prog),
                                ),
                              );
                            },
                            child: ProgramCard(program: prog),
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }
}