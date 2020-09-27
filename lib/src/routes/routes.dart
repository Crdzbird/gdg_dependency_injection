import 'package:flutter/material.dart';
import 'package:gdg_dependency_injection/src/screens/demo_screen.dart';
import 'package:gdg_dependency_injection/src/screens/post_screen.dart';

const String initialRoute = 'login';

class Router {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => DemoScreen());
        break;
      case 'post':
        return MaterialPageRoute(
          builder: (_) => PostScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
        );
    }
  }
}
