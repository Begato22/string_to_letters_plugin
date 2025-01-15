import 'package:flutter/material.dart';
import 'dart:async';

import 'package:string_to_letters_plugin/string_to_letters_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _inputString = "Hello";
  List<String> _letters = [];

  final _stringToLettersPlugin = StringToLettersPlugin();

  Future<void> _convertStringToLetters() async {
    try {
      List<String> letters = await _stringToLettersPlugin.getLetters(_inputString);
      setState(() {
        _letters = letters;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('String to Letters Plugin Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  _inputString = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a string',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertStringToLetters,
                child: const Text('Convert to Letters'),
              ),
              const SizedBox(height: 20),
              Text('Letters: ${_letters.join(', ')}'),
            ],
          ),
        ),
      ),
    );
  }
}
