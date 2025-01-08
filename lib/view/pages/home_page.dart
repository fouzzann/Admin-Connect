import 'package:cc_admin_side/widgets/home/custom_app_bar.dart';
import 'package:cc_admin_side/widgets/home/custom_drawer.dart';
import 'package:cc_admin_side/widgets/home/page_data_constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
// Home Page
class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() => _currentPageIndex = index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(
        currentPageIndex: _currentPageIndex,
        onDestinationSelected: _onDestinationSelected,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        margin: const EdgeInsets.only(top: 16),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: pages[_currentPageIndex].$3,
          ),
        ),
      ),
    );
  }
}
