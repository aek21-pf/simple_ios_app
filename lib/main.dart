import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String surname = "";
  String password = "";
  String error = "";

  void login() {
    if (surname == "admin" && password == "1234") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else {
      setState(() => error = "Invalid surname or password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login", style: TextStyle(fontSize: 32)),

            TextField(
              decoration: InputDecoration(labelText: "Surname"),
              onChanged: (value) => surname = value,
            ),

            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
              onChanged: (value) => password = value,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: login,
              child: Text("Login"),
            ),

            if (error.isNotEmpty)
              Text(error, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome! You are logged in."),
      ),
    );
  }
}