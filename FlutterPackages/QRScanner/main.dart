// dependencies:
//   qr_flutter: ^4.0.0

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
      home: const QrExample(),
    );
  }
}

class QrExample extends StatefulWidget {
  const QrExample({super.key});

  @override
  State<QrExample> createState() => _QrExampleState();
}

class _QrExampleState extends State<QrExample> {
  String qrData = 'https://github.com/ravipatel0508';
  TextEditingController qrDataController = TextEditingController();
  final qrKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RepaintBoundary(
                key: qrKey,
                child: QrImage(
                  data: qrData,
                  version: QrVersions.auto,
                  size: 300.0,
                  dataModuleStyle: const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.circle, color: Colors.black),
                  eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: qrDataController,
                decoration: const InputDecoration(
                  hintText: 'Enter your data',
                  border: OutlineInputBorder(
                    gapPadding: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 5.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (qrDataController.text.isEmpty) {
                    return;
                  }
                  setState(() => qrData = qrDataController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text('Generate QR'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
