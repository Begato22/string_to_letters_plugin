import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'string_to_letters_plugin_method_channel.dart';

abstract class StringToLettersPluginPlatform extends PlatformInterface {
  /// Constructs a StringToLettersPluginPlatform.
  StringToLettersPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static StringToLettersPluginPlatform _instance = MethodChannelStringToLettersPlugin();

  /// The default instance of [StringToLettersPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelStringToLettersPlugin].
  static StringToLettersPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StringToLettersPluginPlatform] when
  /// they register themselves.
  static set instance(StringToLettersPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Method to convert a string to a list of letters.
  Future<List<String>> getLetters(String input) {
    throw UnimplementedError('getLetters() has not been implemented.');
  }
}
