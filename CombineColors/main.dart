import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey, useMaterial3: true),
      home: const ColorMixerExample(),
    );
  }
}

class ColorMixerExample extends StatefulWidget {
  const ColorMixerExample({super.key});

  @override
  State<ColorMixerExample> createState() => _ColorMixerExampleState();
}

class _ColorMixerExampleState extends State<ColorMixerExample> {
  Color mixedColor = Colors.white;
  // bool showDialogFlag = false;
  // int selectedColorIndex = 0;
  List<Color> primaryColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
  ];
  MaterialColor selectedColor = Colors.red;

  MaterialColor convertColorToMaterialColor(Color color) {
    return MaterialColor(
      color.value,
      <int, Color>{
        50: color.withOpacity(0.1),
        100: color.withOpacity(0.2),
        200: color.withOpacity(0.3),
        300: color.withOpacity(0.4),
        400: color.withOpacity(0.5),
        500: color.withOpacity(0.6),
        600: color.withOpacity(0.7),
        700: color.withOpacity(0.8),
        800: color.withOpacity(0.9),
        900: color.withOpacity(1),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('Color Mixer'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mixedColor,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: mixedColor.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Copied ${mixedColor.toString()} to clipboard',
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Text(
                  'Copy Color',
                  style: TextStyle(
                    color: mixedColor.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mixedColor,
                  foregroundColor: Colors.white,
                  fixedSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    mixedColor = Colors.white;
                  });
                },
                child: Text(
                  'Reset Color',
                  style: TextStyle(
                    color: mixedColor.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          DragTarget<Color>(
            builder: (context, candidateData, rejectedData) {
              return Container(
                width: 350,
                height: 450,
                decoration: BoxDecoration(
                  color: mixedColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
            onAccept: (color) {
              setState(() {
                mixedColor = _combineColors(mixedColor, color);
              });
            },
          ),
          const Spacer(),
          _buildColorShadeBox(selectedColor, isDragging: true),
          SizedBox(
            height: 100,
            child: Row(
              children: [
                const SizedBox(width: 20),
                for (var i = 0; i < primaryColors.length; i++)
                  Draggable(
                    data: primaryColors[i],
                    feedback: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: primaryColors[i],
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: _buildColorBox(
                      primaryColors[i],
                      isDragging: true,
                      index: i,
                    ),
                  ),
                const Spacer(),
                Draggable(
                  data: mixedColor,
                  feedback: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: mixedColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child:
                      _buildColorBox(mixedColor, isDragging: true, index: 00),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _combineColors(Color color1, Color color2) {
    return Color.fromARGB(
      255,
      (color1.red + color2.red) ~/ 2,
      (color1.green + color2.green) ~/ 2,
      (color1.blue + color2.blue) ~/ 2,
    );
  }

  Widget _buildColorBox(Color color,
      {bool isDragging = false, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = convertColorToMaterialColor(color);
        });
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  Widget _buildColorShadeBox(MaterialColor color, {bool isDragging = false}) {
    List<Color> colorShades = [
      color.shade50,
      color.shade100,
      color.shade200,
      color.shade300,
      color.shade400,
      color.shade500,
      color.shade600,
      color.shade700,
      color.shade800,
      color.shade900,
    ];
    List<String> shadeText = [
      '50',
      '100',
      '200',
      '300',
      '400',
      '500',
      '600',
      '700',
      '800',
      '900',
    ];

    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          for (var shade in colorShades)
            Draggable(
              data: shade,
              feedback: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: shade,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    mixedColor = _combineColors(mixedColor, shade);
                  });
                },
                onLongPress: () {
                  Clipboard.setData(ClipboardData(text: shade.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        'Copied ${shade.toString()} to clipboard',
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: shade,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      shadeText[colorShades.indexOf(shade)],
                      style: TextStyle(
                        color: shade.computeLuminance() > 0.5
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
