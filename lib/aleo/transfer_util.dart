import 'dart:developer';

import 'package:flutter_aleo_delagate_sdk/flutter_aleo_delagate_sdk.dart'
    as aleo;

String logTag = "Flutter_Aleo_SDK";

class TransferUtil {
  TransferUtil._();

  /// return delegate data for send to remote rpc
  /// [amount] double value, if transfer 10 credits to recipient, just input 10, it will convert to miroCredits inside transfer function on rust side
  /// [priorityFee] 0.0 is allow
  static Future<List<String>> generatePublicTransferDelegate({
    required String privateKey,
    required String recipient,
    required double amount,
    double fee = 0.28,
  }) {
    try {
      return aleo.generatePublicTransferDelegate(
          privateKey: privateKey,
          recipient: recipient,
          amountCredits: amount,
          feeCredits: fee);
    } catch (e) {
      log("$logTag: $e");
      rethrow;
    }
  }

  /// recommend value for execute public transfer
  static double getPublicTransferFee({bool defaultValue = true}) {
    if (defaultValue) {
      return 0.263;
    } else {
      throw Error.safeToString("currently only support defaultValue");
    }
  }
}
