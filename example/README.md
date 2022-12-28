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
       params: Params(
         deviceModel: "",
         deviceId: "",
         osVersion: "",
         platform: "",
         appVersion: "",
         language: "",
       ),
       autoPullTime: const Duration(seconds: 20),
       pullMsgCount: 200,
       isarSchemas: [],
       isarMaxSizeMiB: 2048,
       isarDirectory: "",
       isarInspector: false,
       subscribeCallback: SubscribeCallback(
         onConvIdList: () async {
           return [];
         },
         onConvAESParams: (convIdList) async {
           return {};
         },
       ),
       isarListener: IsarListener(
         onCreate: (isar) {},
       ),
       connectListener: ConnectListener(
         onConnecting: () {},
         onSuccess: () {},
         onClose: ({error}) {},
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
         onReceive: (noticeModelList) async {
           return true;
         },
       ),
       unreadListener: UnreadListener(
         onUnreadCount: (count) {},
       ),
     );

## 登录

     sdk.login(
       apiUrl: "",
       wsUrl: "",
       token: "",
       userId: "",
       networkUsed: "",
       isarName: "",
       convIdList: [],
     );

## 登出

     sdk.logout();

## 连接

     sdk.connect(
       apiUrl: "",
       wsUrl: "",
       token: "",
       userId: "",
       networkUsed: "",
       convIdList: [],
     );

## 断连

     sdk.disconnect();

## 是否连接

     sdk.isConnect();

## 修改语言

     sdk.setLanguage("");

## 打开拉取订阅

     sdk.openPullSubscribe(
       convIdList: [],
     );

## 关闭拉取订阅

     sdk.closePullSubscribe();

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
       push: true ?? false,
     );

### 发送正在输入

     bool status = await sdk.msgManager.sendTyping(
       convId: "",
       content: TypingContent(
         focus: true ?? false,
       ),
       ext: "",
     );

### 发送已读消息

     bool status = await sdk.msgManager.sendRead(
       convId: "",
       content: ReadContent(
         seq: 0,
       ),
       storageForServer: true ?? false,
       storageForClient: true ?? false,
       ext: "",
     );

### 发送撤回消息

     bool status = await sdk.msgManager.sendRevoke(
       clientMsgId: "",
       content: RevokeContent(
         content: "",
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
     MsgModel msgModel = await sdk.msgManager.createRichTxt(...);
     MsgModel msgModel = await sdk.msgManager.createMarkdown(...);
     MsgModel msgModel = await sdk.msgManager.createCustom(...);

### 发送消息列表

     bool status = await sdk.msgManager.sendMsgList(
       senderInfo: "",
       msgModelList: [],
       deliverAfter: 0,
     );

### 更新消息

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
     );

### 获取单条通知

     NoticeModel? noticeModel = await sdk.noticeManager.getSingleMsg(
       noticeId: "",
     );

### 获取多条通知

     List<NoticeModel> noticeList = await sdk.noticeManager.getMultipleMsg(
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
