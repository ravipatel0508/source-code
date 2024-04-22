//
// RunZonedGuarded Example
//
// Created by: Ravi Patel
// Instagram: @bugs_fixes (https://www.instagram.com/bugs_fixes)
//
import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

double divide(double a, double b) {
  // This function might throw an exception for division by zero
  if (b == 0) {
    throw Exception('Error: Cannot divide by zero'); // Throw a custom exception
  }
  return a / b;
}

class RunZonedGuardedExample extends StatefulWidget {
  const RunZonedGuardedExample({super.key});

  @override
  State<RunZonedGuardedExample> createState() => _RunZonedGuardedExampleState();
}

class _RunZonedGuardedExampleState extends State<RunZonedGuardedExample> {
  final TextEditingController num1Controller = TextEditingController(text: "");

  final TextEditingController num2Controller = TextEditingController(text: "");

  double? result;

  Object? error;
  StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: num1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Number 1',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: num2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Number 2',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Wrap the division calculation with runZonedGuarded
                  runZonedGuarded(
                    () {
                      double num1 = double.parse(num1Controller.text);
                      double num2 = double.parse(
                        num2Controller.text,
                      );
                      setState(() {
                        result = divide(num1, num2);
                        log('Result: $result');
                        error = null;
                        stackTrace = null;
                      });
                    },
                    (error, stackTrace) {
                      // Handle the error (division by zero)
                      setState(() {
                        this.error = error;
                        this.stackTrace = stackTrace;
                        result = null;
                      });
                      // Display a user-friendly message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Oops! Cannot divide by zero.'),
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  // elevation: 10,
                  backgroundColor: Colors.green[100],
                  fixedSize: const Size(double.infinity, 48),
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Divide'),
              ),
              const SizedBox(height: 16),
              Visibility(
                visible: result != null,
                child: Text('Result: $result',
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
              Visibility(
                visible: error != null,
                child: Text('Error: ${error ?? 'Unknown Error'}',
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
              const SizedBox(height: 4),
              Visibility(
                visible: stackTrace != null,
                child: Text(
                    'Stack Trace: ${stackTrace ?? 'Unknown Stack Trace'}',
                    style: const TextStyle(color: Colors.red, fontSize: 10)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
