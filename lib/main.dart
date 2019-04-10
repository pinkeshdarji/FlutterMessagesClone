import 'package:flutter/material.dart';
import 'ui/home.dart';

void main() => runApp(MessagesApp());

class MessagesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Android Messages App Clone in Flutter.',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.black,
      ),
      home: Home(),
    );
  }
}