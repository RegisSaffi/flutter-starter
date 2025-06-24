import 'package:checkme/providers/theme.dart';
import 'package:checkme/ui/screens/splast_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const CheckMeApp()));
}

class CheckMeApp extends ConsumerWidget {
  const CheckMeApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var theme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'CheckMe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: theme,
      home: const SplashScreen(),
    );
  }
}
