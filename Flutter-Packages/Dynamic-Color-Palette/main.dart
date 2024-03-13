// Dependencies: palette_generator: latest

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Package Example',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: const DyamicColorPaletteExample(),
    );
  }
}

class DyamicColorPaletteExample extends StatefulWidget {
  const DyamicColorPaletteExample({super.key});

  @override
  State<DyamicColorPaletteExample> createState() => _DyamicColorPaletteExampleState();
}

class _DyamicColorPaletteExampleState extends State<DyamicColorPaletteExample> {
  final List<String> images = [
    'assets/tree.jpg',
    'assets/calmdown.jpg',
    'assets/tree1.jpg',
    'assets/sunset.jpg',
  ];
  List<PaletteColor>? dycolors = [];
  late int _index;

  @override
  void initState() {
    super.initState();
    dycolors = [];
    _index = 0;
    addColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dynamic Color Palette',
          style: TextStyle(
              color: dycolors!.isEmpty ? Colors.black : dycolors![_index].titleTextColor, fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
        elevation: 0,
        backgroundColor: dycolors!.isEmpty ? Theme.of(context).primaryColor : dycolors![_index].color.withOpacity(0.5),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            color: dycolors!.isEmpty ? Colors.white : dycolors![_index].color.withOpacity(0.5),
            child: PageView(
              onPageChanged: (int index) {
                setState(() {
                  _index = index;
                });
              },
              children: images
                  .map((image) => Container(
                        // padding: const EdgeInsets.all(16.0),
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: dycolors!.isEmpty ? Colors.white : dycolors![_index].color.withOpacity(0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Colors based on Image",
                    style: TextStyle(
                        color: dycolors!.isEmpty ? Colors.black : dycolors![_index].titleTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void addColor() async {
    for (String image in images) {
      final PaletteGenerator pg = await PaletteGenerator.fromImageProvider(
        AssetImage(image),
        size: const Size(200, 200),
      );
      dycolors!.add(pg.lightVibrantColor == null ? PaletteColor(Colors.white, 2) : pg.lightVibrantColor!);
    }
    setState(() {});
  }
}
