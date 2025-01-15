import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'string_to_letters_plugin_platform_interface.dart';

/// An implementation of [StringToLettersPluginPlatform] that uses method channels.
class MethodChannelStringToLettersPlugin extends StringToLettersPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('string_to_letters_plugin');

  @override
  Future<List<String>> getLetters(String input) async {
    final List<dynamic> letters = await methodChannel.invokeMethod('getLetters', {'input': input});
    return letters.cast<String>();
  }
}
