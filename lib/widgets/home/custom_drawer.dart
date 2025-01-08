import 'package:cc_admin_side/widgets/home/custom_drawer_widget.dart';
import 'package:cc_admin_side/widgets/home/page_data_constant.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final int currentPageIndex;
  final Function(int) onDestinationSelected;

  const CustomDrawer({
    super.key,
    required this.currentPageIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return NavigationDrawer(
      tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      backgroundColor: colorScheme.surface,
      elevation: 0,
      children: [
        const CustomDrawerHeader(),
        const SizedBox(height: 8),
        ...List.generate(pages.length, (index) {
          final (title, icon, _) = pages[index];
          return NavigationDrawerDestination(
            icon: Icon(icon),
            selectedIcon: Icon(
              icon,
              color: colorScheme.primary,
            ),
            label: Text(
              title,
              style: textTheme.bodyLarge?.copyWith(
                fontWeight: index == currentPageIndex ? FontWeight.bold : null,
              ),
            ),
          );
        }),
      ],
      selectedIndex: currentPageIndex,
      onDestinationSelected: onDestinationSelected,
    );
  }
}