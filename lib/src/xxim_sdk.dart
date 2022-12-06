import 'package:isar/isar.dart';
import 'package:xxim_core_flutter/xxim_core_flutter.dart';
import 'package:xxim_sdk_flutter/src/callback/subscribe_callback.dart';
import 'package:xxim_sdk_flutter/src/listener/conv_listener.dart';
import 'package:xxim_sdk_flutter/src/listener/isar_listener.dart';
import 'package:xxim_sdk_flutter/src/listener/msg_listener.dart';
import 'package:xxim_sdk_flutter/src/listener/notice_listener.dart';
import 'package:xxim_sdk_flutter/src/listener/pull_listener.dart';
import 'package:xxim_sdk_flutter/src/listener/unread_listener.dart';
import 'package:xxim_sdk_flutter/src/manager/conv_manager.dart';
import 'package:xxim_sdk_flutter/src/manager/msg_manager.dart';
import 'package:xxim_sdk_flutter/src/manager/notice_manager.dart';
import 'package:xxim_sdk_flutter/src/manager/sdk_manager.dart';

class XXIMSDK {
  XXIMCore? _xximCore;
  SDKManager? _sdkManager;
  late ConvManager convManager;
  late MsgManager msgManager;
  late NoticeManager noticeManager;

  /// 初始化
  void init({
    required Params params,
    Duration autoPullTime = const Duration(seconds: 20),
    int pullMsgCount = 200,
    List<CollectionSchema> isarSchemas = const [],
    int isarMaxSizeMiB = 5120,
    required String isarDirectory,
    bool isarInspector = false,
    required SubscribeCallback subscribeCallback,
    IsarListener? isarListener,
    ConnectListener? connectListener,
    PullListener? pullListener,
    ConvListener? convListener,
    MsgListener? msgListener,
    NoticeListener? noticeListener,
    UnreadListener? unreadListener,
  }) {
    _xximCore = XXIMCore()
      ..init(
        params: params,
        connectListener: connectListener,
        receivePushListener: ReceivePushListener(
          onPushMsgDataList: (msgDataList) {
            _sdkManager?.onPushMsgDataList(msgDataList.msgDataList);
          },
          onPushNoticeDataList: (noticeDataList) {
            _sdkManager?.onPushNoticeDataList(noticeDataList.noticeDataList);
          },
        ),
      );
    _sdkManager = SDKManager(
      xximCore: _xximCore!,
      autoPullTime: autoPullTime,
      pullMsgCount: pullMsgCount,
      isarSchemas: isarSchemas,
      isarMaxSizeMiB: isarMaxSizeMiB,
      isarDirectory: isarDirectory,
      isarInspector: isarInspector,
      subscribeCallback: subscribeCallback,
      isarListener: isarListener,
      pullListener: pullListener,
      convListener: convListener,
      msgListener: msgListener,
      noticeListener: noticeListener,
      unreadListener: unreadListener,
    );
    msgManager = MsgManager(_sdkManager!);
    noticeManager = NoticeManager(_sdkManager!);
    convManager = ConvManager(_sdkManager!, msgManager, noticeManager);
  }

  /// 登录
  Future login({
    required String apiUrl,
    required String wsUrl,
    required String token,
    required String userId,
    required String networkUsed,
    String? isarName,
    List<String>? convIdList,
  }) async {
    await _sdkManager?.openDatabase(
      userId: userId,
      isarName: isarName,
    );
    connect(
      apiUrl: apiUrl,
      wsUrl: wsUrl,
      token: token,
      userId: userId,
      networkUsed: networkUsed,
      convIdList: convIdList,
    );
  }

  /// 登出
  Future logout() async {
    await _sdkManager?.closeDatabase();
    disconnect();
  }

  /// 连接
  void connect({
    required String apiUrl,
    required String wsUrl,
    required String token,
    required String userId,
    required String networkUsed,
    List<String>? convIdList,
  }) {
    _xximCore?.login(
      apiUrl: apiUrl,
      wsUrl: wsUrl,
      token: token,
      userId: userId,
      networkUsed: networkUsed,
    );
    openPullSubscribe(
      convIdList: convIdList,
    );
  }

  /// 断连
  void disconnect() {
    _xximCore?.logout();
    closePullSubscribe();
  }

  /// 是否连接
  bool isConnect() {
    return _xximCore?.isLogin() ?? false;
  }

  /// 修改语言
  void setLanguage(String language) {
    _xximCore?.setLanguage(language);
  }

  /// 打开拉取订阅
  void openPullSubscribe({
    List<String>? convIdList,
  }) {
    _sdkManager?.openPullSubscribe(
      convIdList: convIdList,
    );
  }

  /// 关闭拉取订阅
  void closePullSubscribe() {
    _sdkManager?.closePullSubscribe();
  }
}
