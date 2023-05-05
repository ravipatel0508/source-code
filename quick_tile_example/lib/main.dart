import 'package:flutter/material.dart';

void main(List<String> arguments) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(msg: arguments.isNotEmpty ? arguments[0] : null));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.msg}) : super(key: key);

  final String? msg;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick Tile Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quick Tile Demo'),
        ),
        body: msg == null
            ? Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  heightFactor: 10,
                  child: Text('Not called from quick tile',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              )
            : Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  heightFactor: 10,
                  child: Text(msg!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
      ),
    );
  }
}
