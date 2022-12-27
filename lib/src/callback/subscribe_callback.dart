import 'package:xxim_sdk_flutter/src/common/aes_params.dart';

/// 订阅回调
class SubscribeCallback {
  final Future<List<String>> Function() onConvIdList; // 会话Id列表
  final Future<Map<String, AESParams>> Function(
    List<String> convIdList,
  ) onConvAESParams; // 会话加密参数

  SubscribeCallback({
    required this.onConvIdList,
    required this.onConvAESParams,
  });

  Future<List<String>> convIdList() {
    return onConvIdList();
  }

  Future<Map<String, AESParams>> convAESParams(List<String> convIdList) {
    return onConvAESParams(convIdList);
  }
}
