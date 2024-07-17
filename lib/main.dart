import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const SecretPoliceApp());
}

class SecretPoliceApp extends StatelessWidget {
  const SecretPoliceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Policia Secreta',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
