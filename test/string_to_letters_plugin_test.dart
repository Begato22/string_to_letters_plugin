import 'package:flutter_test/flutter_test.dart';
import 'package:string_to_letters_plugin/string_to_letters_plugin.dart';
import 'package:string_to_letters_plugin/string_to_letters_plugin_platform_interface.dart';
import 'package:string_to_letters_plugin/string_to_letters_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockStringToLettersPluginPlatform with MockPlatformInterfaceMixin implements StringToLettersPluginPlatform {
  @override
  Future<List<String>> getLetters(String input) async {
    return input.split('');
  }
}

void main() {
  final StringToLettersPluginPlatform initialPlatform = StringToLettersPluginPlatform.instance;

  test('$MethodChannelStringToLettersPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelStringToLettersPlugin>());
  });

  test('getLetters', () async {
    StringToLettersPlugin stringToLettersPlugin = StringToLettersPlugin();
    MockStringToLettersPluginPlatform fakePlatform = MockStringToLettersPluginPlatform();
    StringToLettersPluginPlatform.instance = fakePlatform;

    // Verify the expected output from the mocked method
    expect(await stringToLettersPlugin.getLetters('Hello'), ['H', 'e', 'l', 'l', 'o']);
  });
}
