import 'package:flutter/material.dart';
import 'package:syber_garden/screens/bording_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Monserrat',
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const Scaffold(
        body: BordingScreen(),
      ),
    );
  }
}
