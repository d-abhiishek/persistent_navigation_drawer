import 'package:flutter/material.dart';
import 'favourites.dart';
import 'search.dart';
import 'accessibility.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
