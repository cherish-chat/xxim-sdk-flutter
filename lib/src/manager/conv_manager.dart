import 'package:isar/isar.dart';
import 'package:xxim_sdk_flutter/src/common/conv_type.dart';
import 'package:xxim_sdk_flutter/src/manager/msg_manager.dart';
import 'package:xxim_sdk_flutter/src/manager/notice_manager.dart';
import 'package:xxim_sdk_flutter/src/manager/sdk_manager.dart';
import 'package:xxim_sdk_flutter/src/model/conv_model.dart';
import 'package:xxim_sdk_flutter/src/model/msg_model.dart';
import 'package:xxim_sdk_flutter/src/model/notice_model.dart';
import 'package:xxim_sdk_flutter/src/model/sdk_content.dart';

class ConvManager {
  final SDKManager _sdkManager;
  final MsgManager _msgManager;
  final NoticeManager _noticeManager;

  ConvManager(this._sdkManager, this._msgManager, this._noticeManager);

  /// 获取会话列表
  Future<List<ConvModel>> getConvList() async {
    List<ConvModel> convList = await _getConvList();
    if (convList.isEmpty) return convList;
    List<String> clientMsgIdList = [];
    List<String> noticeIdList = [];
    for (ConvModel convModel in convList) {
      if (convModel.clientMsgId != null) {
        clientMsgIdList.add(convModel.clientMsgId!);
      }
      if (convModel.noticeId != null) {
        noticeIdList.add(convModel.noticeId!);
      }
    }
    Map<String, MsgModel> msgMap = {};
    Map<String, NoticeModel> noticeMap = {};
    if (clientMsgIdList.isNotEmpty) {
      List<MsgModel> msgModelList = await _msgManager.getMultipleMsg(
        clientMsgIdList: clientMsgIdList,
      );
      for (MsgModel msgModel in msgModelList) {
        msgMap[msgModel.clientMsgId] = msgModel;
      }
    }
    if (noticeIdList.isNotEmpty) {
      List<NoticeModel> noticeModelList =
          await _noticeManager.getMultipleNotice(
        noticeIdList: noticeIdList,
      );
      for (NoticeModel noticeModel in noticeModelList) {
        noticeMap[noticeModel.noticeId] = noticeModel;
      }
    }
    for (ConvModel convModel in convList) {
      convModel.msgModel = msgMap[convModel.clientMsgId];
      convModel.noticeModel = noticeMap[convModel.noticeId];
    }
    return convList;
  }

  Future<List<ConvModel>> _getConvList() {
    return _sdkManager.findAll(
      query: _sdkManager.convModels().buildQuery<ConvModel>(
        filter: FilterGroup.and([
          FilterCondition(
            type: ConditionType.eq,
            property: "hidden",
            value: false,
          ),
          FilterCondition(
            type: ConditionType.eq,
            property: "deleted",
            value: false,
          ),
        ]),
        sortBy: [
          const SortProperty(
            property: "draftModel",
            sort: Sort.desc,
          ),
          const SortProperty(
            property: "time",
            sort: Sort.desc,
          ),
        ],
      ),
    );
  }

  /// 获取单条会话
  Future<ConvModel?> getSingleConv({
    required String convId,
  }) async {
    ConvModel? convModel = await _sdkManager.findFirst(
      query: _sdkManager
          .convModels()
          .filter()
          .convIdEqualTo(
            convId,
          )
          .build(),
    );
    if (convModel == null) return convModel;
    if (convModel.clientMsgId != null) {
      convModel.msgModel = await _msgManager.getSingleMsg(
        clientMsgId: convModel.clientMsgId!,
      );
    }
    if (convModel.noticeId != null) {
      convModel.noticeModel = await _noticeManager.getSingleNotice(
        noticeId: convModel.noticeId!,
      );
    }
    return convModel;
  }

  /// 设置会话已读
  Future setConvRead({
    required String convId,
    bool isSync = true,
  }) async {
    ConvModel? convModel = await _sdkManager.findFirst(
      query: _sdkManager
          .convModels()
          .filter()
          .convIdEqualTo(
            convId,
          )
          .build(),
    );
    if (convModel == null) return;
    if (convModel.unreadCount != 0) {
      convModel.unreadCount = 0;
      await _sdkManager.isar.writeTxn((isar) async {
        await _sdkManager.convModels().put(convModel);
      });
      _sdkManager.calculateUnreadCount();
    }
    if (convModel.convType != ConvType.msg && !isSync) return;
    MsgModel? msgModel = await _msgManager.getFirstMsg(
      convId: convId,
    );
    if (msgModel == null) return;
    await _msgManager.sendReadMsg(
      content: ReadContent(
        convId: convId,
        seq: msgModel.seq,
      ),
    );
  }

  /// 更新会话消息
  Future updateConvMsg({
    required String convId,
  }) async {
    ConvModel? convModel = await _sdkManager.findFirst(
      query: _sdkManager
          .convModels()
          .filter()
          .convIdEqualTo(
            convId,
          )
          .build(),
    );
    if (convModel == null) return;
    MsgModel? msgModel = await _sdkManager.findFirst(
      query: _sdkManager
          .msgModels()
          .filter()
          .convIdEqualTo(convId)
          .and()
          .deletedEqualTo(false)
          .sortBySeqDesc()
          .build(),
    );
    if (msgModel == null) return;
    convModel.clientMsgId = msgModel.clientMsgId;
    convModel.time = msgModel.serverTime;
    convModel.msgModel = msgModel;
    await _sdkManager.isar.writeTxn((isar) async {
      await _sdkManager.convModels().put(convModel);
    });
    _sdkManager.calculateUnreadCount();
  }

  /// 删除会话消息
  Future deleteConvMsg({
    required String convId,
  }) async {
    ConvModel? convModel = await _sdkManager.findFirst(
      query: _sdkManager
          .convModels()
          .filter()
          .convIdEqualTo(
            convId,
          )
          .build(),
    );
    if (convModel == null) return;
    convModel.clientMsgId = null;
    convModel.time = 0;
    convModel.msgModel = null;
    await _sdkManager.isar.writeTxn((isar) async {
      await _sdkManager.convModels().put(convModel);
    });
    _sdkManager.calculateUnreadCount();
  }

  /// 更新会话通知
  Future updateConvNotice({
    required String convId,
  }) async {
    ConvModel? convModel = await _sdkManager.findFirst(
      query: _sdkManager
          .convModels()
          .filter()
          .convIdEqualTo(
            convId,
          )
          .build(),
    );
    if (convModel == null) return;
    NoticeModel? noticeModel = await _sdkManager.findFirst(
      query: _sdkManager
          .noticeModels()
          .filter()
          .convIdEqualTo(convId)
          .and()
          .deletedEqualTo(false)
          .sortByCreateTimeDesc()
          .build(),
    );
    if (noticeModel == null) return;
    convModel.noticeId = noticeModel.noticeId;
    convModel.time = noticeModel.createTime;
    convModel.noticeModel = noticeModel;
    await _sdkManager.isar.writeTxn((isar) async {
      await _sdkManager.convModels().put(convModel);
    });
    _sdkManager.calculateUnreadCount();
  }

  /// 删除会话通知
  Future deleteConvNotice({
    required String convId,
  }) async {
    ConvModel? convModel = await _sdkManager.findFirst(
      query: _sdkManager
          .convModels()
          .filter()
          .convIdEqualTo(
            convId,
          )
          .build(),
    );
    if (convModel == null) return;
    convModel.noticeId = null;
    convModel.time = 0;
    convModel.noticeModel = null;
    await _sdkManager.isar.writeTxn((isar) async {
      await _sdkManager.convModels().put(convModel);
    });
    _sdkManager.calculateUnreadCount();
  }

  /// 设置会话草稿
  Future setConvDraft({
    required String convId,
    DraftModel? draftModel,
  }) async {
    ConvModel? convModel = await _sdkManager.findFirst(
      query: _sdkManager
          .convModels()
          .filter()
          .convIdEqualTo(
            convId,
          )
          .build(),
    );
    if (convModel == null) return;
    convModel.draftModel = draftModel;
    await _sdkManager.isar.writeTxn((isar) async {
      await _sdkManager.convModels().put(convModel);
    });
  }

  /// 设置会话隐藏
  Future setConvHidden({
    required String convId,
    required bool hidden,
  }) async {
    ConvModel? convModel = await _sdkManager.findFirst(
      query: _sdkManager
          .convModels()
          .filter()
          .convIdEqualTo(
            convId,
          )
          .build(),
    );
    if (convModel == null) return;
    convModel.unreadCount = 0;
    convModel.hidden = hidden;
    await _sdkManager.isar.writeTxn((isar) async {
      await _sdkManager.convModels().put(convModel);
    });
    _sdkManager.calculateUnreadCount();
  }

  /// 删除会话
  Future deleteConv({
    required String convId,
    bool clear = true,
  }) async {
    ConvModel? convModel = await _sdkManager.findFirst(
      query: _sdkManager
          .convModels()
          .filter()
          .convIdEqualTo(
            convId,
          )
          .build(),
    );
    if (convModel == null) return;
    if (clear) {
      convModel.clientMsgId = null;
      convModel.noticeId = null;
      convModel.time = 0;
      convModel.msgModel = null;
      convModel.noticeModel = null;
    }
    convModel.unreadCount = 0;
    convModel.draftModel = null;
    convModel.hidden = false;
    convModel.deleted = true;
    await _sdkManager.isar.writeTxn((isar) async {
      await _sdkManager.convModels().put(convModel);
    });
    _sdkManager.calculateUnreadCount();
    if (!clear) return;
    if (convModel.convType == ConvType.msg) {
      await _msgManager.clearMsg(
        convId: convId,
      );
    } else if (convModel.convType == ConvType.notice) {
      await _noticeManager.clearNotice(
        convId: convId,
      );
    }
  }

  /// 获取未读数量
  Future<int> getUnreadCount() {
    return _sdkManager.convModels().where().unreadCountProperty().sum();
  }
}
