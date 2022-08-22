import 'package:butomy/infrastructure/auth_methods/auth_methods.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              await AuthMethods().signOut();
            },
            icon: Icon(Icons.close)),
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
