import 'package:flutter/material.dart';
import 'package:gdg_dependency_injection/src/injector/injector.dart';
import 'package:gdg_dependency_injection/src/routes/routes.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      onGenerateRoute: Router.generateRoutes,
    );
  }
}
