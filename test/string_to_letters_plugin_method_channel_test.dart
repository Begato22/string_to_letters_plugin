import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:string_to_letters_plugin/string_to_letters_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelStringToLettersPlugin platform = MethodChannelStringToLettersPlugin();
  const MethodChannel channel = MethodChannel('string_to_letters_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getLetters('hello'), ['h', 'e', 'l', 'l', 'o']);
  });
}
