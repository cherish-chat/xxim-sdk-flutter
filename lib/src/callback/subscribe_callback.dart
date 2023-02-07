import 'package:xxim_sdk_flutter/src/common/aes_params.dart';

/// 订阅回调
class SubscribeCallback {
  final Future<Map<String, AesParams>> Function() onConvParams; // 会话参数

  SubscribeCallback({
    required this.onConvParams,
  });

  Future<Map<String, AesParams>> convParams() {
    return onConvParams();
  }
}
