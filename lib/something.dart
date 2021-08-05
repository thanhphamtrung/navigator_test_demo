import 'package:flutter/material.dart';

import 'main.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Home()));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, feedRoute, arguments: 'Data from home');
        },
      ),
      body: Center(child: Text('Home')),
    );
  }
}

class Feed extends StatelessWidget {
  final String data;
  Feed(this.data);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Feed: $data')),
    );
  }
}
