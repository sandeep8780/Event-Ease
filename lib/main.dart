import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';  // Import the SplashScreen file (update path if necessary)

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EventEase',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(), // This is the splash screen widget
    );
  }
}
