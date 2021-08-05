import 'package:demo_test_navigator/something.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.generateRoute,
      initialRoute: homeRoute,
    );
  }
}

const String homeRoute = '/';
const String feedRoute = '/feed';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case feedRoute:
        var data = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => Feed(data));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
