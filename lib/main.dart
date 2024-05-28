import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(LibraryManagerApp());
}

class LibraryManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
