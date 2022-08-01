///
/// This is Theme Change App without State Management
///
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode? _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _themeMode,
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(title: const Text('Change Theme Demo')),
        body: Column(
          children: <Widget>[
            RadioListTile<ThemeMode>(
              title: const Text('Light'),
              groupValue: _themeMode,
              value: ThemeMode.light,
              onChanged: (ThemeMode? value) {
                setState(() => _themeMode = value);
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Dark '),
              groupValue: _themeMode,
              value: ThemeMode.dark,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _themeMode = value;
                });
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('System Mode'),
              groupValue: _themeMode,
              value: ThemeMode.system,
              onChanged: (ThemeMode? value) {
                setState(() {
                  _themeMode = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
