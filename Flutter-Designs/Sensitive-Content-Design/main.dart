//
// Instagram like Sensitive Content Design
//
// Created by: Ravi Patel
// Instagram: @bugs_fixes (https://www.instagram.com/bugs_fixes)
//

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Designs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SensitiveContentDesign(),
    );
  }
}

class SensitiveContentDesign extends StatefulWidget {
  const SensitiveContentDesign({super.key});

  @override
  State<SensitiveContentDesign> createState() => _SensitiveContentDesignState();
}

class _SensitiveContentDesignState extends State<SensitiveContentDesign> {
  bool _isSensitiveContentVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://www.shutterstock.com/shutterstock/photos/2385210847/display_1500/stock-photo-future-tokyo-scene-of-caribbean-city-in-anime-style-2385210847.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft,
              ),
            ),
            child: BackdropFilter(
              filter: _isSensitiveContentVisible
                  ? ImageFilter.blur(sigmaX: 0, sigmaY: 0)
                  : ImageFilter.blur(sigmaX: 35, sigmaY: 35),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: !_isSensitiveContentVisible
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.visibility_off_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Sensitive Content',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Text(
                                    'This photo contains sensitive content which some people may ind offensive or disturbing.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(.7),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )
                          : null,
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: .5,
                    height: 0,
                    indent: 26,
                    endIndent: 26,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isSensitiveContentVisible =
                            !_isSensitiveContentVisible;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      splashFactory: NoSplash.splashFactory,
                      shadowColor: Colors.transparent,
                      enableFeedback: false,
                      backgroundColor: Colors.transparent,
                      minimumSize: const Size(double.infinity - 32, 50),
                      fixedSize: const Size(double.infinity - 32, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text(
                      _isSensitiveContentVisible ? 'Hide Photo' : 'See Photo',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
