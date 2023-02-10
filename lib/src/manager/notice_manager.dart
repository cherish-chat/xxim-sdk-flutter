import 'package:isar/isar.dart';
import 'package:xxim_sdk_flutter/src/common/content_type.dart';
import 'package:xxim_sdk_flutter/src/manager/sdk_manager.dart';
import 'package:xxim_sdk_flutter/src/model/notice_model.dart';

class NoticeManager {
  final SDKManager _sdkManager;

  NoticeManager(this._sdkManager);

  /// 获取通知列表
  List<NoticeModel> getNoticeList({
    required String convId,
    int? offset,
    int? limit,
  }) {
    return _sdkManager
        .noticeModels()
        .buildQuery<NoticeModel>(
          filter: FilterGroup.and([
            FilterCondition(
              type: ConditionType.eq,
              property: "convId",
              value: convId,
            ),
            FilterCondition(
              type: ConditionType.eq,
              property: "deleted",
              value: false,
            ),
          ]),
          sortBy: [
            const SortProperty(
              property: "createTime",
              sort: Sort.desc,
            ),
          ],
          offset: offset,
          limit: limit,
        )
        .findAllSync();
  }

  /// 获取单条通知
  NoticeModel? getSingleNotice({
    required String noticeId,
  }) {
    return _sdkManager
        .noticeModels()
        .filter()
        .noticeIdEqualTo(noticeId)
        .findFirstSync();
  }

  /// 获取多条通知
  List<NoticeModel> getMultipleNotice({
    required List<String> noticeIdList,
  }) {
    return _sdkManager
        .noticeModels()
        .filter()
        .repeat(
          noticeIdList,
          (q, element) => q.noticeIdEqualTo(element),
        )
        .findAllSync();
  }

  /// 删除通知
  Future deleteNotice({
    required String noticeId,
  }) async {
    NoticeModel? noticeModel = _sdkManager
        .noticeModels()
        .filter()
        .noticeIdEqualTo(noticeId)
        .findFirstSync();
    if (noticeModel == null) return;
    noticeModel.contentType = NoticeContentType.invalid;
    noticeModel.content = "";
    noticeModel.deleted = true;
    await _sdkManager.isar.writeTxn((isar) async {
      await _sdkManager.noticeModels().put(noticeModel);
    });
  }

  /// 清空通知
  Future clearNotice({
    required String convId,
  }) async {
    List<NoticeModel> list = _sdkManager
        .noticeModels()
        .filter()
        .convIdEqualTo(
          convId,
        )
        .findAllSync();
    if (list.isEmpty) return;
    await _sdkManager.isar.writeTxn((isar) async {
      for (NoticeModel noticeModel in list) {
        noticeModel.contentType = NoticeContentType.invalid;
        noticeModel.content = "";
        noticeModel.deleted = true;
      }
      await _sdkManager.noticeModels().putAll(list);
    });
  }
}
