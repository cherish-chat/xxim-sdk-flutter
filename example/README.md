# xxim-sdk-flutter

[![pub](https://img.shields.io/pub/v/xxim_sdk_flutter)](https://pub.dev/packages/xxim_sdk_flutter)
[![support](https://img.shields.io/badge/platform-android%20ios%20linux%20macos%20web%20windows-347dc0)](https://pub.dev/packages/xxim_sdk_flutter)
[![commit](https://img.shields.io/github/commit-activity/m/cherish-chat/xxim-sdk-flutter)](https://github.com/cherish-chat/xxim-sdk-flutter)
[![forks](https://img.shields.io/github/forks/cherish-chat/xxim-sdk-flutter)](https://github.com/cherish-chat/xxim-sdk-flutter)
[![stars](https://img.shields.io/github/stars/cherish-chat/xxim-sdk-flutter)](https://github.com/cherish-chat/xxim-sdk-flutter)

支持Flutter6端开发。惺惺是一个100%开源社交平台，每个人都可以搭建自己的服务器，掌握数据的所有权。

它是空安全的，为什么没有空安全标识？

问题参考：[Flutter Issues](https://github.com/flutter/flutter/issues/44937)

问题参考：[Pana Issues](https://github.com/dart-lang/pana/issues/891)

放心使用，因为它：💪 Building with sound null safety 💪

## 初始化

     XXIMSDK sdk = XXIMSDK();
     sdk.init(
       requestTimeout: const Duration(seconds: 10),
       cxnParams: CxnParams(
         deviceModel: "",
         deviceId: "",
         osVersion: "",
         platform: "",
         appVersion: "",
         language: "",
         networkUsed: "",
         ext: utf8.encode(""),
       ),
       autoPullTime: const Duration(seconds: 20),
       pullMsgCount: 200,
       isarSchemas: [],
       isarMaxSizeMiB: Isar.defaultMaxSizeMiB,
       isarDirectory: "",
       isarInspector: false,
       connectListener: ConnectListener(
         onConnecting: () {},
         onSuccess: () {},
         onClose: (code, error) {},
       ),
       subscribeCallback: SubscribeCallback(
         onConvParams: () async {
           return {"": const AesParams(key: "", iv: "")};
         },
       ),
       isarListener: IsarListener(
         onCreate: (isar) {},
       ),
       pullListener: PullListener(
         onStart: () {},
         onEnd: () {},
       ),
       convListener: ConvListener(
         onUpdate: () {},
       ),
       msgListener: MsgListener(
         onReceive: (msgModelList) {},
       ),
       noticeListener: NoticeListener(
         onReceive: (noticeModel) async {
           return true;
         },
       ),
       unreadListener: UnreadListener(
         onUnreadCount: (count) {},
       ),
     );

## 连接

     sdk.connect("");

## 断连

     sdk.disconnect();

## 是否连接

     sdk.isConnect();

## 设置连接参数

     sdk.setCxnParams(cxnParams);

## 设置用户参数

     sdk.setUserParams(
       userId: "",
       token: "",
       ext: utf8.encode(""),
       isarName: "",
       convIdList: [],
     );

## 打开拉取订阅

     sdk.openPullSubscribe(
       convIdList: [],
     );

## 关闭拉取订阅

     sdk.closePullSubscribe();

## 自定义请求

     List<int>? resp = await sdk.customRequest(
       method: "",
       bytes: [],
     );

## 会话管理

### 获取会话列表

     List<ConvModel> convList = await sdk.convManager.getConvList();

### 获取单条会话

     ConvModel? convModel = await sdk.convManager.getSingleConv(
       convId: "",
     );

### 设置会话已读

     sdk.convManager.setConvRead(
       convId: "",
     );

### 更新会话消息

     sdk.convManager.updateConvMsg(
       convId: "",
     );

### 删除会话消息

     sdk.convManager.deleteConvMsg(
       convId: "",
     );

### 更新会话通知

     sdk.convManager.updateConvNotice(
       convId: "",
     );

### 删除会话通知

     sdk.convManager.deleteConvNotice(
       convId: "",
     );

### 设置会话草稿

     sdk.convManager.setConvDraft(
       convId: "",
       draftModel: DraftModel(
         content: "",
         ext: "",
       ),
     );

### 设置会话隐藏

     sdk.convManager.setConvHidden(
       convId: "",
       hidden: true ?? false,
     );

### 删除会话

     sdk.convManager.deleteConv(
       convId: "",
       clear: true ?? false,
     );

### 获取未读数量

     int unreadCount = await sdk.convManager.getUnreadCount();

## 消息管理

### 获取消息列表

     List<MsgModel> msgList = await sdk.msgManager.getMsgList(
       convId: "",
       contentType: ContentType.text,
       maxSeq: null,
       size: 100,
     );

### 获取首个消息

     MsgModel? msgModel = await sdk.msgManager.getFirstMsg(
       convId: "",
     );

### 获取单条消息

     MsgModel? msgModel = await sdk.msgManager.getSingleMsg(
       clientMsgId: "",
     );

### 获取多条消息

     List<MsgModel> msgList = await sdk.msgManager.getMultipleMsg(
       clientMsgIdList: [],
     );

### 拉取云端消息

     MsgModel? msgModel = await sdk.msgManager.pullCloudMsg(
       clientMsgId: "",
     );

### 发送正在输入

     bool status = await sdk.msgManager.sendTyping(
       convId: "",
       content: TypingContent(
         focus: true ?? false,
       ),
       ext: "",
     );

### 发送提示消息

     bool status = await sdk.msgManager.sendTip(
       convId: "",
       content: TipContent(
         tip: "",
         ext: "",
       ),
       ext: "",
     );

### 创建文本、图片、语音、视频、文件、位置、名片、合并、表情、命令、富文本、标记、自定义消息

     MsgModel msgModel = await sdk.msgManager.createText(...);
     MsgModel msgModel = await sdk.msgManager.createImage(...);
     MsgModel msgModel = await sdk.msgManager.createAudio(...);
     MsgModel msgModel = await sdk.msgManager.createVideo(...);
     MsgModel msgModel = await sdk.msgManager.createFile(...);
     MsgModel msgModel = await sdk.msgManager.createLocation(...);
     MsgModel msgModel = await sdk.msgManager.createCard(...);
     MsgModel msgModel = await sdk.msgManager.createMerge(...);
     MsgModel msgModel = await sdk.msgManager.createEmoji(...);
     MsgModel msgModel = await sdk.msgManager.createCommand(...);
     MsgModel msgModel = await sdk.msgManager.createRichText(...);
     MsgModel msgModel = await sdk.msgManager.createMarkdown(...);
     MsgModel msgModel = await sdk.msgManager.createCustom(...);

### 发送消息列表

     bool status = await sdk.msgManager.sendMsgList(
       senderInfo: "",
       msgModelList: [],
       deliverAfter: 0,
     );

### 发送已读消息

      bool status = await sdk.msgManager.sendReadMsg(
        content: ReadContent(
         convId: "",
         seq: 0,
       ),
      );

### 发送撤回消息

      bool status = await sdk.msgManager.sendRevokeMsg(
        clientMsgId: "",
        content: TipContent(
          tip: "",
          ext: "",
        ),
      );

### 发送编辑消息

      bool status = await sdk.msgManager.sendEditMsg(
        msgModel: msgModel,
      );

### 更新插入消息

     sdk.msgManager.upsertMsg(
       msgModel: msgModel,
       includeMsgConv: true ?? false,
     );

### 删除消息

     sdk.msgManager.deleteMsg(
       clientMsgId: "",
     );

### 清空消息

     sdk.msgManager.clearMsg(
       convId: "",
     );

## 通知管理

### 获取通知列表

     List<NoticeModel> noticeList = await sdk.noticeManager.getNoticeList(
       convId: "",
       offset: 0,
       limit: 10,
     );

### 获取单条通知

     NoticeModel? noticeModel = await sdk.noticeManager.getSingleNotice(
       noticeId: "",
     );

### 获取多条通知

     List<NoticeModel> noticeList = await sdk.noticeManager.getMultipleNotice(
       noticeIdList: [],
     );

### 删除通知

     sdk.noticeManager.deleteNotice(
       noticeId: "",
     );

### 清空通知

     sdk.noticeManager.clearNotice(
       convId: "",
     );
