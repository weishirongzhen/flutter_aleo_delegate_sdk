import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_aleo_delagate_sdk_platform_interface.dart';

/// An implementation of [FlutterAleoDelagateSdkPlatform] that uses method channels.
class MethodChannelFlutterAleoDelagateSdk extends FlutterAleoDelagateSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_aleo_delagate_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
