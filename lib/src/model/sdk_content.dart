import 'dart:convert';

/// 正在输入
class TypingContent {
  bool focus;

  TypingContent({
    required this.focus,
  });

  static TypingContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return TypingContent(focus: map["focus"]);
  }

  String toJson() {
    return json.encode({
      "focus": focus,
    });
  }
}

/// 已读消息
class ReadContent {
  int seq;

  ReadContent({
    required this.seq,
  });

  static ReadContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return ReadContent(seq: map["seq"]);
  }

  String toJson() {
    return json.encode({
      "seq": seq,
    });
  }
}

/// 撤回消息
class RevokeContent {
  String text;
  int? contentType;
  String? content;

  RevokeContent({
    required this.text,
    this.contentType,
    this.content,
  });

  static RevokeContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return RevokeContent(
      text: map["text"],
      contentType: map["contentType"],
      content: map["content"],
    );
  }

  String toJson() {
    return json.encode({
      "text": text,
      "contentType": contentType,
      "content": content,
    });
  }
}

/// 图片消息
class PictureContent {
  String pictureName;
  String picturePath;
  String pictureUrl;
  int width;
  int height;
  int size;

  PictureContent({
    required this.pictureName,
    required this.picturePath,
    required this.pictureUrl,
    this.width = 0,
    this.height = 0,
    this.size = 0,
  });

  static PictureContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return PictureContent(
      pictureName: map["pictureName"],
      picturePath: map["picturePath"],
      pictureUrl: map["pictureUrl"],
      width: map["width"],
      height: map["height"],
      size: map["size"],
    );
  }

  String toJson() {
    return json.encode({
      "pictureName": pictureName,
      "picturePath": picturePath,
      "pictureUrl": pictureUrl,
      "width": width,
      "height": height,
      "size": size,
    });
  }
}

/// 语音消息
class AudioContent {
  String audioName;
  String audioPath;
  String audioUrl;
  List<int> decibels;
  int duration;
  int size;

  AudioContent({
    required this.audioName,
    required this.audioPath,
    required this.audioUrl,
    this.decibels = const [],
    this.duration = 0,
    this.size = 0,
  });

  static AudioContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return AudioContent(
      audioName: map["audioName"],
      audioPath: map["audioPath"],
      audioUrl: map["audioUrl"],
      decibels: map["decibels"],
      duration: map["duration"],
      size: map["size"],
    );
  }

  String toJson() {
    return json.encode({
      "audioName": audioName,
      "audioPath": audioPath,
      "audioUrl": audioUrl,
      "decibels": decibels,
      "duration": duration,
      "size": size,
    });
  }
}

/// 视频消息
class VideoContent {
  String coverName;
  String coverPath;
  String coverUrl;
  String videoName;
  String videoPath;
  String videoUrl;
  int duration;
  int width;
  int height;

  VideoContent({
    required this.coverName,
    required this.coverPath,
    required this.coverUrl,
    required this.videoName,
    required this.videoPath,
    required this.videoUrl,
    this.duration = 0,
    this.width = 0,
    this.height = 0,
  });

  static VideoContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return VideoContent(
      coverName: map["coverName"],
      coverPath: map["coverPath"],
      coverUrl: map["coverUrl"],
      videoName: map["videoName"],
      videoPath: map["videoPath"],
      videoUrl: map["videoUrl"],
      duration: map["duration"],
      width: map["width"],
      height: map["height"],
    );
  }

  String toJson() {
    return json.encode({
      "coverName": coverName,
      "coverPath": coverPath,
      "coverUrl": coverUrl,
      "videoName": videoName,
      "videoPath": videoPath,
      "videoUrl": videoUrl,
      "duration": duration,
      "width": width,
      "height": height,
    });
  }
}

/// 文件消息
class FileContent {
  String fileName;
  String filePath;
  String fileUrl;
  String type;
  int size;

  FileContent({
    required this.fileName,
    required this.filePath,
    required this.fileUrl,
    this.type = "",
    this.size = 0,
  });

  static FileContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return FileContent(
      fileName: map["fileName"],
      filePath: map["filePath"],
      fileUrl: map["fileUrl"],
      type: map["type"],
      size: map["size"],
    );
  }

  String toJson() {
    return json.encode({
      "fileName": fileName,
      "filePath": filePath,
      "fileUrl": fileUrl,
      "type": type,
      "size": size,
    });
  }
}

/// 位置消息
class LocationContent {
  double latitude;
  double longitude;
  String? address;

  LocationContent({
    required this.latitude,
    required this.longitude,
    this.address = "",
  });

  static LocationContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return LocationContent(
      latitude: map["latitude"],
      longitude: map["longitude"],
      address: map["address"],
    );
  }

  String toJson() {
    return json.encode({
      "latitude": latitude,
      "longitude": longitude,
      "address": address,
    });
  }
}

/// 名片消息
class CardContent {
  String userId;
  String nickname;
  String avatar;

  CardContent({
    required this.userId,
    required this.nickname,
    required this.avatar,
  });

  static CardContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return CardContent(
      userId: map["userId"],
      nickname: map["nickname"],
      avatar: map["avatar"],
    );
  }

  String toJson() {
    return json.encode({
      "userId": userId,
      "nickname": nickname,
      "avatar": avatar,
    });
  }
}

/// 合并消息
class MergeContent {
  String mergeName;
  Map<int, String> mergeMap;

  MergeContent({
    required this.mergeName,
    required this.mergeMap,
  });

  static MergeContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return MergeContent(
      mergeName: map["mergeName"],
      mergeMap: map["mergeMap"],
    );
  }

  String toJson() {
    return json.encode({
      "mergeName": mergeName,
      "mergeMap": mergeMap,
    });
  }
}

/// 表情消息
class EmojiContent {
  String coverUrl;
  String emojiUrl;

  EmojiContent({
    required this.coverUrl,
    required this.emojiUrl,
  });

  static EmojiContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return EmojiContent(
      coverUrl: map["coverUrl"],
      emojiUrl: map["emojiUrl"],
    );
  }

  String toJson() {
    return json.encode({
      "coverUrl": coverUrl,
      "emojiUrl": emojiUrl,
    });
  }
}

/// 命令消息
class CommandContent {
  String command;

  CommandContent({
    required this.command,
  });

  static CommandContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return CommandContent(
      command: map["command"],
    );
  }

  String toJson() {
    return json.encode({
      "command": command,
    });
  }
}

/// 富文本消息
class RichTxtContent {
  List<Map> list;

  RichTxtContent({
    required this.list,
  });

  static RichTxtContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return RichTxtContent(
      list: map["list"],
    );
  }

  String toJson() {
    return json.encode({
      "list": list,
    });
  }
}

/// 标记消息
class MarkdownContent {
  String title;
  String content;
  String? actions;

  MarkdownContent({
    required this.title,
    required this.content,
    this.actions,
  });

  static MarkdownContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return MarkdownContent(
      title: map["title"],
      content: map["content"],
      actions: map["actions"],
    );
  }

  String toJson() {
    return json.encode({
      "title": title,
      "content": content,
      "actions": actions,
    });
  }
}

/// 自定义消息
class CustomContent {
  String data;
  String? ext;

  CustomContent({
    required this.data,
    this.ext,
  });

  static CustomContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return CustomContent(
      data: map["data"],
      ext: map["ext"],
    );
  }

  String toJson() {
    return json.encode({
      "data": data,
      "ext": ext,
    });
  }
}
