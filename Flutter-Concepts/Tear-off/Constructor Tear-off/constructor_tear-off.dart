// ignore_for_file: file_names

import 'dart:developer';

class Person {
  final String name;
  final int age;

  Person(this.name, this.age); // Constructor

  // Constructor tear-off (Dart 2.15+)
  static Person Function(String, int) newPerson = Person.new;

  factory Person.fromJson(Map<String, dynamic> json) {
    log("Creating person from JSON: $json"); // Print JSON data
    return Person(json['name'] as String, json['age'] as int);
  }
}

void main() {
  // Constructor tear-off: Assign constructor to a variable
  var personCreator = Person.new; // Or use alternative name (newPerson)

  // Create instance using tear-off
  Person p1 = personCreator('Alice', 30);
  log("Created Person p1: name: ${p1.name}, age: ${p1.age}"); // Print p1 details

  // Factory constructor usage
  Person p2 = Person.fromJson({'name': 'Bob', 'age': 25});
  log("Created Person p2 from JSON: name: ${p2.name}, age: ${p2.age}"); // Print p2 details
}
