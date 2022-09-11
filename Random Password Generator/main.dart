import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';

class RandomPasswordGenerator extends StatefulWidget {
  const RandomPasswordGenerator({super.key});

  @override
  State<RandomPasswordGenerator> createState() => _RandomPasswordGeneratorState();
}

class _RandomPasswordGeneratorState extends State<RandomPasswordGenerator> {
  List char = [];
  var symbols = "!@#\$%^&*()";
  var password = [];
  bool? hasNumbers = true;
  bool? hasSymbols = true;
  bool? hasUppercase = true;
  bool? hasLowercase = true;
  double length = 8;

  void generatePassword() {
    char = [];

    if (hasNumbers!) {
      List.generate(10, (index) => char.add(String.fromCharCode(index + 48)));
    }
    if (hasSymbols!) {
      List.generate(8, (index) => char.add(symbols[index]));
    }
    if (hasUppercase!) {
      List.generate(26, (index) => char.add(String.fromCharCode(index + 65)));
    }
    if (hasLowercase!) {
      List.generate(26, (index) => char.add(String.fromCharCode(index + 97)));
    }
    if (char.isNotEmpty) {
      char.shuffle();

      password = [];
      final random = math.Random();
      for (int i = 0; i < length; i++) {
        password.add(char[random.nextInt(char.length - 1)]);
      }
      password.shuffle();
      setState(() {});
    } else {
      password = [];
      setState(() {});
    }
  }

  @override
  void initState() {
    generatePassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Password Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Password:', style: TextStyle(fontSize: 16)),
            password.isEmpty
                ? const Text(
                    'Please select atleast one option',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  )
                : FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            password.join(),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          icon: const Icon(Icons.copy),
                          tooltip: 'Copy Password',
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: password.join()));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text('Password Copied'),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckBoxs(
                      checkBoxText: 'A-Z',
                      index: 3,
                      value: hasUppercase,
                      onChanged: (value) {
                        setState(() {
                          hasUppercase = value;
                        });
                      },
                    ),
                    CheckBoxs(
                      checkBoxText: 'a-z',
                      index: 4,
                      value: hasLowercase,
                      onChanged: (value) {
                        setState(() {
                          hasLowercase = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(width: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CheckBoxs(
                      checkBoxText: '0-9',
                      index: 3,
                      value: hasNumbers,
                      onChanged: (value) {
                        setState(() {
                          hasNumbers = value;
                        });
                      },
                    ),
                    CheckBoxs(
                      checkBoxText: 'Special Character',
                      index: 4,
                      value: hasSymbols,
                      onChanged: (value) {
                        setState(() {
                          hasSymbols = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              widthFactor: 2.5,
              alignment: Alignment.centerLeft,
              child: Text('Password Length: ${length.toInt()}', style: const TextStyle(fontSize: 16)),
            ),
            Slider(
              label: length.toString(),
              value: length,
              min: 8,
              max: 20,
              divisions: 12,
              onChanged: (value) {
                setState(() {
                  length = value;
                });
              },
              onChangeEnd: (value) => generatePassword(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => generatePassword(),
              child: const Text(
                'Generate Password',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBoxs extends StatelessWidget {
  final String checkBoxText;
  final int index;
  final bool? value;
  final Function(bool?)? onChanged;
  const CheckBoxs({
    required this.checkBoxText,
    required this.index,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: onChanged),
        const SizedBox(width: 5),
        Text(checkBoxText),
      ],
    );
  }
}
