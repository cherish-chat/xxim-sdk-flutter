import 'package:isar/isar.dart';
import 'package:xxim_sdk_flutter/src/manager/msg_manager.dart';
import 'package:xxim_sdk_flutter/src/manager/sdk_manager.dart';
import 'package:xxim_sdk_flutter/src/model/conv_model.dart';
import 'package:xxim_sdk_flutter/src/model/msg_model.dart';
import 'package:xxim_sdk_flutter/src/model/notice_model.dart';
import 'package:xxim_sdk_flutter/src/model/sdk_content.dart';

class ConvManager {
  final SDKManager _sdkManager;
  final MsgManager _msgManager;

  ConvManager(this._sdkManager, this._msgManager);

  /// 获取会话列表
  Future<List<ConvModel>> getConvList() {
    return _getCustomConvList(
      filter: const FilterGroup.and([
        FilterCondition.equalTo(
          property: "hidden",
          value: false,
        ),
        FilterCondition.equalTo(
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
    );
  }

  /// 获取自定义会话列表
  Future<List<ConvModel>> _getCustomConvList({
    List<WhereClause> whereClauses = const [],
    bool whereDistinct = false,
    Sort whereSort = Sort.asc,
    FilterOperation? filter,
    List<SortProperty> sortBy = const [],
    List<DistinctProperty> distinctBy = const [],
    int? offset,
    int? limit,
    String? property,
  }) async {
    List<ConvModel> convList = await _sdkManager
        .convModels()
        .buildQuery<ConvModel>(
          whereClauses: whereClauses,
          whereDistinct: whereDistinct,
          whereSort: whereSort,
          filter: filter,
          sortBy: sortBy,
          distinctBy: distinctBy,
          offset: offset,
          limit: limit,
          property: property,
        )
        .findAll();
    if (convList.isEmpty) return convList;
    List<String> msgIdList = [];
    List<String> noticeIdList = [];
    for (ConvModel convModel in convList) {
      if (convModel.msgId != null) {
        msgIdList.add(convModel.msgId!);
      }
      if (convModel.noticeId != null) {
        noticeIdList.add(convModel.noticeId!);
      }
    }
    Map<String, MsgModel> msgMap = {};
    Map<String, NoticeModel> noticeMap = {};
    if (msgIdList.isNotEmpty) {
      List<MsgModel> msgList = await _sdkManager
          .msgModels()
          .filter()
          .anyOf(
            msgIdList,
            (q, element) => q.clientMsgIdEqualTo(element),
          )
          .findAll();
      for (MsgModel msgModel in msgList) {
        msgMap[msgModel.clientMsgId] = msgModel;
      }
    }
    if (noticeIdList.isNotEmpty) {
      List<NoticeModel> noticeList = await _sdkManager
          .noticeModels()
          .filter()
          .anyOf(
            noticeIdList,
            (q, element) => q.noticeIdEqualTo(element),
          )
          .findAll();
      for (NoticeModel noticeModel in noticeList) {
        noticeMap[noticeModel.noticeId] = noticeModel;
      }
    }
    for (ConvModel convModel in convList) {
      convModel.msgModel = msgMap[convModel.msgId];
      convModel.noticeModel = noticeMap[convModel.noticeId];
    }
    return convList;
  }

  /// 获取单条会话
  Future<ConvModel?> getSingleConv({
    required String convID,
  }) async {
    ConvModel? convModel = await _sdkManager
        .convModels()
        .filter()
        .convIdEqualTo(
          convID,
        )
        .findFirst();
    if (convModel == null) return convModel;
    if (convModel.msgId != null) {
      convModel.msgModel = await _sdkManager
          .msgModels()
          .filter()
          .clientMsgIdEqualTo(convModel.msgId!)
          .findFirst();
    }
    if (convModel.noticeId != null) {
      convModel.noticeModel = await _sdkManager
          .noticeModels()
          .filter()
          .noticeIdEqualTo(convModel.noticeId!)
          .findFirst();
    }
    return convModel;
  }

  /// 设置会话已读
  Future<bool> setConvRead({
    required String convId,
  }) async {
    ConvModel? convModel = await _sdkManager
        .convModels()
        .filter()
        .convIdEqualTo(convId)
        .findFirst();
    if (convModel == null) return false;
    if (convModel.unreadCount == 0) return true;
    convModel.unreadCount = 0;
    await _sdkManager.isar.writeTxn(() async {
      await _sdkManager.convModels().put(convModel);
    });
    _sdkManager.calculateUnreadCount();
    MsgModel? msgModel = await _sdkManager
        .msgModels()
        .filter()
        .convIdEqualTo(convId)
        .sortBySeqDesc()
        .findFirst();
    if (msgModel != null) {
      await _msgManager.sendRead(
        convId: convId,
        content: ReadContent(
          seq: msgModel.seq,
        ),
      );
    }
    return true;
  }

  /// 删除会话消息
  Future<bool> deleteConvMsg({
    required String convId,
  }) async {
    ConvModel? convModel = await _sdkManager
        .convModels()
        .filter()
        .convIdEqualTo(convId)
        .findFirst();
    if (convModel == null) return false;
    convModel.msgId = null;
    convModel.msgModel = null;
    convModel.time = 0;
    await _sdkManager.isar.writeTxn(() async {
      await _sdkManager.convModels().put(convModel);
    });
    _sdkManager.calculateUnreadCount();
    return true;
  }

  /// 设置会话草稿
  Future<bool> setConvDraft({
    required String convId,
    DraftModel? draftModel,
  }) async {
    ConvModel? convModel = await _sdkManager
        .convModels()
        .filter()
        .convIdEqualTo(convId)
        .findFirst();
    if (convModel == null) return false;
    convModel.draftModel = draftModel;
    await _sdkManager.isar.writeTxn(() async {
      await _sdkManager.convModels().put(convModel);
    });
    return true;
  }

  /// 设置会话隐藏
  Future<bool> setConvHidden({
    required String convId,
    required bool hidden,
  }) async {
    ConvModel? convModel = await _sdkManager
        .convModels()
        .filter()
        .convIdEqualTo(convId)
        .findFirst();
    if (convModel == null) return false;
    convModel.unreadCount = 0;
    convModel.hidden = hidden;
    await _sdkManager.isar.writeTxn(() async {
      await _sdkManager.convModels().put(convModel);
    });
    _sdkManager.calculateUnreadCount();
    return true;
  }

  /// 删除会话
  Future<bool> deleteConv({
    required String convId,
    bool clearMsg = true,
  }) async {
    ConvModel? convModel = await _sdkManager
        .convModels()
        .filter()
        .convIdEqualTo(convId)
        .findFirst();
    if (convModel == null) return false;
    convModel.unreadCount = 0;
    convModel.deleted = true;
    await _sdkManager.isar.writeTxn(() async {
      await _sdkManager.convModels().put(convModel);
    });
    _sdkManager.calculateUnreadCount();
    if (clearMsg) {
      await _msgManager.clearMsg(
        convId: convId,
      );
    }
    return true;
  }

  /// 获取未读数量
  Future<int> getUnreadCount() {
    return _sdkManager.convModels().where().unreadCountProperty().sum();
  }
}
