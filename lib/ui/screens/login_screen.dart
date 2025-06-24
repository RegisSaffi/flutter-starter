import 'package:checkme/providers/storage/storage_notifier.dart';
import 'package:checkme/ui/screens/todos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  var controller = TextEditingController();

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  checkLogin() async {
    var loggedIn = await ref.read(storageProvider.notifier).checkLoginInfo();
    if (loggedIn) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => TodosScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // Image.asset("assets/avatar.jpg", height: 100, width: 100),
              CircleAvatar(
                backgroundImage: AssetImage("assets/avatar.jpg"),
                radius: 50,
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Your email",
                  labelText: "Email",
                ),
              ),
              TextField(
                obscureText: true,
                obscuringCharacter: "K",
                decoration: InputDecoration(
                  hintText: "Your password",
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  ref
                      .read(storageProvider.notifier)
                      .saveLoginInfo(controller.text);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => TodosScreen()),
                  );
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
