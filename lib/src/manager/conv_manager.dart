import 'package:xxim_sdk_flutter/src/manager/msg_manager.dart';
import 'package:xxim_sdk_flutter/src/manager/sdk_manager.dart';

class ConvManager {
  final SDKManager _sdkManager;
  final MsgManager _msgManager;

  ConvManager(this._sdkManager, this._msgManager);
}
