// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:string_to_letters_plugin/string_to_letters_plugin.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getLetters test', (WidgetTester tester) async {
    final StringToLettersPlugin plugin = StringToLettersPlugin();
    final List<String> result = await plugin.getLetters('Hello');

    // Verify the result is a list of letters.
    expect(result, ['H', 'e', 'l', 'l', 'o']);
  });
}
