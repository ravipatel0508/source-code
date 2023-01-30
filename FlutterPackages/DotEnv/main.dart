// dependencies:
//   flutter_dotenv: latest_version
/// dont forget to add .env to .gitignore and pubspec.yaml assets

import 'package:flutter/material.dart';

import 'environment_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await Environment().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const DotEnvExample(),
    );
  }
}

class DotEnvExample extends StatelessWidget {
  const DotEnvExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dot Env Example'),
      ),
      body: Text('BASE_URL: ${Environment.baseUrl}'),
    );
  }
}
