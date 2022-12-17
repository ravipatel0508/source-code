// dependencies:
//   share_plus: ^6.3.0

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SharingExample extends StatelessWidget {
  SharingExample({super.key});

  final TextEditingController controller = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SharingExample')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: subjectController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text('Subject'),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    label: Text('Text'),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(200, 50),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      return Share.share(controller.text, subject: subjectController.text);
                    }
                  },
                  child: const Text('Share'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
