import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPageDepth1 extends StatefulWidget {
  const SearchPageDepth1({super.key});

  @override
  State<StatefulWidget> createState() => _SearchPageDepth1State();
}

class _SearchPageDepth1State extends State<SearchPageDepth1>{
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Search Depth 1'),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                context.goNamed("SearchDepth2");
              },
              child: const Text('Go to Search Depth 2'),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back to Search'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}