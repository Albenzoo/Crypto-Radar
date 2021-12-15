import 'package:flutter/material.dart';
import 'package:projectwallet/main.dart';
import 'package:projectwallet/pages/detail.dart';
import 'package:projectwallet/pages/home.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyApp());
      case '/home':
        // Validation of correct data type
        return MaterialPageRoute(
          builder: (_) => Home(),
          settings: settings,
        );
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      case '/home/detail':
        // Getting arguments passed in while calling Navigator.pushNamed
        final args = settings.arguments as Map<String, String>;

        // Validation of correct data type
        print("args:");
        print(args);
        if (args["coinName"] is String && args["coinSymbol"] is String) {
          return MaterialPageRoute(
            builder: (_) => Detail(
              coinSymbol: args["coinSymbol"]!,
              coinName: args["coinName"]!,
            ),
            settings: settings,
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
