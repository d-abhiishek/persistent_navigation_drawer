import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../accessibility/accessibility.dart';
import '../favourites/favourites.dart';
import '../home/home.dart';
import '../search/search.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key, required this.title, required this.navigationShell});

  final String title;

  final StatefulNavigationShell navigationShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int currentDestinationIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(
        index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  final destinations = const [
    NavigationDrawerDestination(
      icon: Icon(Icons.home),
      label: Text('Home'),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.search),
      label: Text('Search'),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.favorite_border),
      label: Text('Favorites'),
    ),
    NavigationDrawerDestination(
      icon: Icon(Icons.accessibility),
      label: Text('Accessibility'),
    ),
  ];

  final List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const FavouritesPage(),
    const AccessibilityPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: NavigationDrawer(
        selectedIndex: currentDestinationIndex,
        onDestinationSelected: (index) {
          setState(() => currentDestinationIndex = index);
          _goToBranch(currentDestinationIndex);
          scaffoldKey.currentState!.closeDrawer();
        },
        children: destinations,
      ),
      body: widget.navigationShell,
    );
  }
}