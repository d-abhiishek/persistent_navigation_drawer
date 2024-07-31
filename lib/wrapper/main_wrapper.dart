import 'package:flutter/material.dart';

import '../accessibility/accessibility.dart';
import '../favourites/favourites.dart';
import '../home/home.dart';
import '../search/search.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key, required this.title});

  final String title;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int currentDestinationIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
    HomePage(),
    SearchPage(),
    FavouritesPage(),
    AccessibilityPage(),
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
        children: destinations,
        selectedIndex: currentDestinationIndex,
        onDestinationSelected: (index) {
          setState(() => currentDestinationIndex = index);
          scaffoldKey.currentState!.closeDrawer();
        },
      ),
      body: pages[currentDestinationIndex],
    );
  }
}