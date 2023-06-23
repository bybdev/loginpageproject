import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page Example',
      home: Scaffold(
        appBar: AppBar(title: const Text("Login Page")),
        body: HomePage(),
      ),
    );
  }
}
