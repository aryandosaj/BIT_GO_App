import 'package:flutter/material.dart';
import 'navigator.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  final appTitle = 'BIT GO';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Navigation(),
    );
  }
}

