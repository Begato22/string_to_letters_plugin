import 'package:flutter/services.dart';

class StringToLettersPlugin {
  static const MethodChannel _channel = MethodChannel('string_to_letters_plugin');

  Future<List<String>> getLetters(String input) async {
    final List<dynamic> letters = await _channel.invokeMethod('getLetters', {'input': input});
    return letters.cast<String>();
  }
}
