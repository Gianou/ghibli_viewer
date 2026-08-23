import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Shell Layout: Provides persistent bottom navigation bar across all routes
class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _getSelectedIndex(context),
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.go('/');
            case 1:
              context.go('/user');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.local_movies),
            label: 'Films',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }

  // Determines which nav item is active based on current route
  int _getSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location == '/') return 0;
    if (location == '/user') return 1;
    return 0;
  }
}
