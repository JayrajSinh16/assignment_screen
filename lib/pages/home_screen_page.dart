import 'package:assignment_screen/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import '../widgets/app_tab_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'my_program_page.dart';
import 'explore_program_page.dart';
import 'workout_page.dart';
import 'other_tab_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0; // 0 = home, 1 = schedule, 2 = other
  int _selectedTopTab = 0; // For My/Explore Program tabs

  Widget _getCurrentBody() {
    if (_selectedTab == 0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTabBar(
            tabs: ['My Programs', 'Explore Programs'],
            selectedIndex: _selectedTopTab,
            onTabSelected: (i) => setState(() => _selectedTopTab = i),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: _selectedTopTab == 0
                ? const MyProgramPage()
                : const ExploreProgramsPage(),
          ),
        ],
      );
    } else if (_selectedTab == 1) {
      return const WorkoutSchedulePage();
    } else {
      return const OtherTabPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: CustomBackButton(
            onTap: () {
              Navigator.of(context).maybePop();
            },
          ),
        ),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        elevation: 0,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedTab,
        onTabSelected: (i) => setState(() => _selectedTab = i),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _getCurrentBody(),
        ),
      ),
    );
  }
}
