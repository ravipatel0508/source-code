import 'package:flutter/material.dart';
import 'package:spotify_clone/view/song_player.dart';

void main() {
  // system overlays
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SigninScreen(),
      home: const AudioPlayerScreen(),
    );
  }
}
