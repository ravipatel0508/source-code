import 'package:flutter/material.dart';
import 'package:login_ui/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Instagram Sans',
      ),
      title: 'Flutter Demo',
      home: const LoginScreen(),
    );
  }
}
