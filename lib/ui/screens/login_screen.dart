import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
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
                backgroundImage: AssetImage("assets/avatar .jpg"),
                radius: 50,
              ),
              TextField(
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
              FilledButton(onPressed: () {}, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
