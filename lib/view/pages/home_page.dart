import 'package:cc_admin_side/view/pages/approved_request_page.dart';
import 'package:cc_admin_side/view/pages/pendings_docter_request.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  final List<(String title, IconData icon, Widget page)> _pages = [
    (
      'Pending Requests',
      Icons.pending_actions_rounded,
      const PendingDoctorRequests()
    ),
    (
      'Approved Requests',
      Icons.check_circle_rounded,
      const ApprovedRequestPage()
    ),
    (
      'Logout',
      Icons.logout_rounded,
      const ApprovedRequestPage()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadow.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            child: AppBar(
              surfaceTintColor: Colors.transparent,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.transparent,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu_rounded),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search_rounded),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.settings_outlined),
                  onPressed: () {},
                ),
                const SizedBox(width: 8),
              ],
              title: Text(
                '',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
          ),
        ),
      ),
      drawer: NavigationDrawer(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/app_logo-removebg-preview.png',
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '',
                        style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ...List.generate(_pages.length, (index) {
            final (title, icon, _) = _pages[index];
            return NavigationDrawerDestination(
              icon: Icon(icon),
              selectedIcon: Icon(
                icon,
                color: colorScheme.primary,
              ),
              label: Text(
                title,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: index == _currentPageIndex ? FontWeight.bold : null,
                ),
              ),
            );
          }),
        ],
        selectedIndex: _currentPageIndex,
        onDestinationSelected: (index) {
          setState(() => _currentPageIndex = index);
          Navigator.pop(context);
        },
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
            child: _pages[_currentPageIndex].$3,
          ),
        ),
      ),
    );
  }
}