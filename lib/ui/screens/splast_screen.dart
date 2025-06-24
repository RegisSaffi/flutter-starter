import 'package:checkme/providers/storage/storage_notifier.dart';
import 'package:checkme/ui/screens/login_screen.dart';
import 'package:checkme/ui/screens/todos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  checkLogin() async {
    var loggedIn = await ref.read(storageProvider.notifier).checkLoginInfo();
    await Future.delayed(Duration(seconds: 3));
    if (loggedIn) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => TodosScreen()));
    } else {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Text(
          "CheckMe",
          style: TextStyle(
            fontSize: 37,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
