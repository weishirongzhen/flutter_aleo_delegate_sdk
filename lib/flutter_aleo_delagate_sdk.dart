
export 'rust/api/aleo_api.dart';
export 'aleo/aleo_hd_key.dart';
export 'aleo/transfer_util.dart';
import 'dart:developer';

import 'package:flutter_aleo_delagate_sdk/rust/frb_generated.dart';

import 'flutter_aleo_delagate_sdk_platform_interface.dart';

class FlutterAleoDelagateSdk {
  static bool _libInit = false;
  Future<String?> getPlatformVersion() {
    return FlutterAleoDelagateSdkPlatform.instance.getPlatformVersion();
  }

  static Future<void> initAleo() async {
    if (!_libInit) {
      try {
        await RustLib.init();
        _libInit = true;
      } catch (e) {
        _libInit = false;
        log("RustLib init failed: $e");
      }
    }
  }

  static void deposeAleo() {
    RustLib.dispose();
    _libInit = false;
    log("RustLib disposed");
  }
}
