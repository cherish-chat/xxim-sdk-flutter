import 'package:hive/hive.dart';
import 'package:isar/isar.dart';
import 'package:xxim_core_flutter/xxim_core_flutter.dart';
import 'package:xxim_sdk_flutter/src/callback/subscribe_callback.dart';
import 'package:xxim_sdk_flutter/src/common/aes_params.dart';
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
import 'package:xxim_sdk_flutter/src/tool/sdk_tool.dart';
import 'package:xxim_sdk_flutter/src/common/platform/platform_none.dart'
    if (dart.library.html) 'package:xxim_sdk_flutter/src/common/platform/platform_html.dart'
    if (dart.library.io) 'package:xxim_sdk_flutter/src/common/platform/platform_io.dart';

class XXIMSDK {
  String _hiveName = "xxim";
  XXIMCore? _xximCore;
  bool? _isCxnParams;
  SDKManager? _sdkManager;
  late ConvManager convManager;
  late MsgManager msgManager;
  late NoticeManager noticeManager;

  /// 初始化
  void init({
    required String directory,
    Duration requestTimeout = const Duration(seconds: 10),
    required String rsaPublicKey,
    required String aesKey,
    required CxnParams cxnParams,
    Duration autoPullTime = const Duration(seconds: 20),
    int pullMsgCount = 50,
    List<CollectionSchema> isarSchemas = const [],
    bool isarInspector = false,
    required ConnectListener connectListener,
    required SubscribeCallback subscribeCallback,
    IsarListener? isarListener,
    PullListener? pullListener,
    ConvListener? convListener,
    MsgListener? msgListener,
    NoticeListener? noticeListener,
    UnreadListener? unreadListener,
  }) {
    if (SDKPlatform.isDesktop) {
      _hiveName = SDKTool.getUUId();
    }
    if (directory.isNotEmpty) {
      Hive.init(directory);
    }
    _xximCore = XXIMCore()
      ..init(
        requestTimeout: requestTimeout,
        connectListener: ConnectListener(
          onConnecting: connectListener.connecting,
          onSuccess: () async {
            await Future.doWhile(() async {
              await Future.delayed(const Duration(milliseconds: 5));
              return !(await setCxnParams(
                rsaPublicKey: rsaPublicKey,
                aesKey: aesKey,
                cxnParams: cxnParams,
              ));
            });
            _isCxnParams = true;
            connectListener.success();
          },
          onClose: (code, error) {
            _isCxnParams = false;
            closePullSubscribe();
            connectListener.close(code, error);
          },
        ),
        receivePushListener: ReceivePushListener(
          onPushMsgDataList: (msgDataList) {
            _sdkManager?.onPushMsgDataList(msgDataList.msgDataList);
          },
          onPushNoticeData: (noticeData) {
            _sdkManager?.onPushNoticeData(noticeData);
          },
        ),
      );
    _sdkManager = SDKManager(
      xximCore: _xximCore!,
      directory: directory,
      autoPullTime: autoPullTime,
      pullMsgCount: pullMsgCount,
      isarSchemas: isarSchemas,
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

  /// 连接
  void connect(String wsUrl) {
    _xximCore?.connect(wsUrl);
  }

  /// 断连
  void disconnect() {
    _xximCore?.disconnect();
    closePullSubscribe();
  }

  /// 是否连接
  bool isConnect() {
    return (_xximCore?.isConnect() ?? false) && _isCxnParams == true;
  }

  /// 打开数据库
  Future? openDatabase({
    required String userId,
    String? isarName,
  }) {
    return _sdkManager?.openDatabase(
      userId: userId,
      isarName: isarName,
    );
  }

  /// 关闭数据库
  Future? closeDatabase() {
    return _sdkManager?.closeDatabase();
  }

  /// 关闭所有数据库
  Future? closeAllDatabase() {
    return _sdkManager?.closeAllDatabase();
  }

  /// 设置连接参数
  Future<bool> setCxnParams({
    required String rsaPublicKey,
    required String aesKey,
    required CxnParams cxnParams,
  }) async {
    Box box;
    if (Hive.isBoxOpen(_hiveName)) {
      box = Hive.box(_hiveName);
    } else {
      box = await Hive.openBox(_hiveName);
    }
    String packageId = box.get("packageId", defaultValue: "");
    if (packageId.isEmpty) {
      packageId = SDKTool.getUUId();
      box.put("packageId", packageId);
    }
    bool? status = await _xximCore?.setCxnParams(
      reqId: SDKTool.getUUId(),
      packageId: packageId,
      rsaPublicKey: rsaPublicKey,
      aesKey: aesKey,
      cxnParams: cxnParams,
    );
    return status == true;
  }

  /// 设置用户参数
  Future<bool> setUserParams({
    required String userId,
    required String token,
    List<int>? ext,
    String? isarName,
    Map<String, AesParams>? convParams,
  }) async {
    await openDatabase(
      userId: userId,
      isarName: isarName,
    );
    SetUserParamsResp? resp = await _xximCore?.setUserParams(
      reqId: SDKTool.getUUId(),
      req: SetUserParamsReq(
        userId: userId,
        token: token,
        ext: ext,
      ),
    );
    if (resp == null) {
      return false;
    }
    openPullSubscribe(
      convParams: convParams,
    );
    return true;
  }

  /// 打开拉取订阅
  void openPullSubscribe({
    Map<String, AesParams>? convParams,
  }) {
    _sdkManager?.openPullSubscribe(
      convParams: convParams,
    );
  }

  /// 关闭拉取订阅
  void closePullSubscribe() {
    _sdkManager?.closePullSubscribe();
  }

  /// 自定义请求
  Future<List<int>?>? customRequest({
    required String method,
    required List<int> bytes,
    SuccessCallback<List<int>>? onSuccess,
    ErrorCallback? onError,
  }) {
    return _xximCore?.customRequest(
      reqId: SDKTool.getUUId(),
      method: method,
      bytes: bytes,
      onSuccess: onSuccess,
      onError: onError,
    );
  }
}
