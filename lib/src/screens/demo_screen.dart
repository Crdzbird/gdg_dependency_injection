import 'package:flutter/material.dart';
import 'package:gdg_dependency_injection/src/injector/injector.dart';
import 'package:gdg_dependency_injection/src/models/tiny_age.dart';
import 'package:gdg_dependency_injection/src/models/tiny_user.dart';

class DemoScreen extends StatelessWidget {
  //* factory
  final TinyUser tinyUser = locator<TinyUser>();
  final TinyUser tinyUser2 = locator<TinyUser>();

  //* singleton
  final TinyAge tinyAge = locator<TinyAge>();
  final TinyAge tinyAge2 = locator<TinyAge>();
  @override
  Widget build(BuildContext context) {
    tinyUser2.name = 'Join_The_Dart_Side_Of_The_Force';
    tinyAge.age = 2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text('tinyUser: ${tinyUser.name}'),
              Text('tinyUser2: ${tinyUser2.name}'),
              Divider(
                color: Colors.black,
                height: 2.0,
              ),
              Text('tinyAge: ${tinyAge.age}'),
              Text('tinyAge2: ${tinyAge2.age}'),
              RaisedButton(
                child: Text('Get Post'),
                onPressed: () => Navigator.pushNamed(context, 'post'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
