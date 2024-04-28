import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_aleo_delagate_sdk_method_channel.dart';

abstract class FlutterAleoDelagateSdkPlatform extends PlatformInterface {
  /// Constructs a FlutterAleoDelagateSdkPlatform.
  FlutterAleoDelagateSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAleoDelagateSdkPlatform _instance = MethodChannelFlutterAleoDelagateSdk();

  /// The default instance of [FlutterAleoDelagateSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAleoDelagateSdk].
  static FlutterAleoDelagateSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAleoDelagateSdkPlatform] when
  /// they register themselves.
  static set instance(FlutterAleoDelagateSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
