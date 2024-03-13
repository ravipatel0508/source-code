import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  // Set the ErrorWidget's builder before the app is started.
  ErrorWidget.builder = (FlutterErrorDetails details) {
    // If we're in debug mode, use the normal error widget which shows the error
    // message:
    if (kDebugMode) {
      return ErrorWidget(details.exception);
    }
    // In release builds, show a yellow-on-blue message instead:
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Error!\n${details.exception}',
          style: const TextStyle(color: Colors.purple),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blueGrey, primarySwatch: Colors.blueGrey, useMaterial3: true),
      home: const ErrorHandlingExample(),
    );
  }
}

class ErrorHandlingExample extends StatefulWidget {
  const ErrorHandlingExample({super.key});

  static const String _title = 'ErrorWidget Sample';

  @override
  State<ErrorHandlingExample> createState() => _ErrorHandlingExampleState();
}

class _ErrorHandlingExampleState extends State<ErrorHandlingExample> {
  bool throwError = false;

  @override
  Widget build(BuildContext context) {
    if (throwError) {
      // Since the error widget is only used during a build, in this contrived example,
      // we purposely throw an exception in a build function.
      return Builder(
        builder: (BuildContext context) {
          throw Exception('oh no, an error');
        },
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text(ErrorHandlingExample._title)),
        body: Center(
          heightFactor: 2,
          child: TextButton(
            onPressed: () {
              setState(() {
                throwError = true;
              });
            },
            child: const Text('No Error here :)'),
          ),
        ),
      );
    }
  }
}
