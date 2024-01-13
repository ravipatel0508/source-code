// dependencies:
//   faker: latest

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

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
      home: const FakerExample(),
    );
  }
}

class FakerExample extends StatefulWidget {
  const FakerExample({super.key});

  @override
  State<FakerExample> createState() => _FakerExampleState();
}

class _FakerExampleState extends State<FakerExample> {
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController ipv6TextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  TextEditingController sportTextEditingController = TextEditingController();
  TextEditingController vehicleTextEditingController = TextEditingController();
  TextEditingController currencyTextEditingController = TextEditingController();

  static const InputBorder border = OutlineInputBorder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple[200],
        foregroundColor: Colors.white,
        title: const Text('Faker Example'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextFormField(
            controller: firstNameTextEditingController,
            decoration:
                const InputDecoration(labelText: 'Name', border: border),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: emailTextEditingController,
            decoration:
                const InputDecoration(labelText: 'Email', border: border),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: addressTextEditingController,
            decoration:
                const InputDecoration(labelText: 'Address', border: border),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: ipv6TextEditingController,
            decoration:
                const InputDecoration(labelText: 'IPV6', border: border),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: sportTextEditingController,
            decoration:
                const InputDecoration(labelText: 'Sport', border: border),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: currencyTextEditingController,
            decoration:
                const InputDecoration(labelText: 'Currency', border: border),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: vehicleTextEditingController,
            decoration:
                const InputDecoration(labelText: 'Vehicle', border: border),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => setFeilds(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[300],
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
              ),
              child: const Text('Add Fields',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }

  void setFeilds() {
    var faker = Faker();
    setState(() {
      firstNameTextEditingController.text =
          '${faker.person.prefix()}${faker.person.firstName()} ${faker.person.lastName()}';
      emailTextEditingController.text = faker.internet.email();
      addressTextEditingController.text = faker.address.streetAddress();
      ipv6TextEditingController.text = faker.internet.ipv6Address();
      phoneNumberTextEditingController.text = faker.phoneNumber.de();
      sportTextEditingController.text = faker.sport.name();
      currencyTextEditingController.text = faker.currency.name();
      vehicleTextEditingController.text = faker.vehicle.model();
    });
  }
}
