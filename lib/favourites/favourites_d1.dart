import 'package:flutter/material.dart';

class FavouritesPageDepth1 extends StatefulWidget {
  const FavouritesPageDepth1({super.key});

  @override
  State<StatefulWidget> createState() => _FavouritesPageDepth1State();
}

class _FavouritesPageDepth1State extends State<FavouritesPageDepth1>{
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
            const Text('Favourites Depth 1'),
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
                Navigator.pop(context);
              },
              child: const Text('Go back to Favourites'),
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