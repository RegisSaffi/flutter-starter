import 'package:checkme/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckMeApp());
}

class CheckMeApp extends StatelessWidget {
  const CheckMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CheckMe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginScreen(),
    );
  }
}
