import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_aleo_delagate_sdk/flutter_aleo_delagate_sdk.dart';
import 'package:flutter_aleo_delagate_sdk/flutter_aleo_delagate_sdk_platform_interface.dart';
import 'package:flutter_aleo_delagate_sdk/flutter_aleo_delagate_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAleoDelagateSdkPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAleoDelagateSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAleoDelagateSdkPlatform initialPlatform = FlutterAleoDelagateSdkPlatform.instance;

  test('$MethodChannelFlutterAleoDelagateSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAleoDelagateSdk>());
  });

  test('getPlatformVersion', () async {
    FlutterAleoDelagateSdk flutterAleoDelagateSdkPlugin = FlutterAleoDelagateSdk();
    MockFlutterAleoDelagateSdkPlatform fakePlatform = MockFlutterAleoDelagateSdkPlatform();
    FlutterAleoDelagateSdkPlatform.instance = fakePlatform;

    expect(await flutterAleoDelagateSdkPlugin.getPlatformVersion(), '42');
  });
}
