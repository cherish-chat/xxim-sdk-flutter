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
  String content;

  RevokeContent({
    required this.content,
  });

  static RevokeContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return RevokeContent(
      content: map["content"],
    );
  }

  String toJson() {
    return json.encode({
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
  String? ext;

  PictureContent({
    required this.pictureName,
    required this.picturePath,
    required this.pictureUrl,
    this.width = 0,
    this.height = 0,
    this.size = 0,
    this.ext,
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
      ext: map["ext"],
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
      "ext": ext,
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
  String? ext;

  AudioContent({
    required this.audioName,
    required this.audioPath,
    required this.audioUrl,
    this.decibels = const [],
    this.duration = 0,
    this.size = 0,
    this.ext,
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
      ext: map["ext"],
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
      "ext": ext,
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
  String? ext;

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
    this.ext,
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
      ext: map["ext"],
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
      "ext": ext,
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
  String? ext;

  FileContent({
    required this.fileName,
    required this.filePath,
    required this.fileUrl,
    this.type = "",
    this.size = 0,
    this.ext,
  });

  static FileContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return FileContent(
      fileName: map["fileName"],
      filePath: map["filePath"],
      fileUrl: map["fileUrl"],
      type: map["type"],
      size: map["size"],
      ext: map["ext"],
    );
  }

  String toJson() {
    return json.encode({
      "fileName": fileName,
      "filePath": filePath,
      "fileUrl": fileUrl,
      "type": type,
      "size": size,
      "ext": ext,
    });
  }
}

/// 位置消息
class LocationContent {
  double latitude;
  double longitude;
  String? address;
  String? ext;

  LocationContent({
    required this.latitude,
    required this.longitude,
    this.address = "",
    this.ext,
  });

  static LocationContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return LocationContent(
      latitude: map["latitude"],
      longitude: map["longitude"],
      address: map["address"],
      ext: map["ext"],
    );
  }

  String toJson() {
    return json.encode({
      "latitude": latitude,
      "longitude": longitude,
      "address": address,
      "ext": ext,
    });
  }
}

/// 名片消息
class CardContent {
  String userId;
  String nickname;
  String avatar;
  String? ext;

  CardContent({
    required this.userId,
    required this.nickname,
    required this.avatar,
    this.ext,
  });

  static CardContent fromJson(String content) {
    Map<String, dynamic> map = json.decode(content);
    return CardContent(
      userId: map["userId"],
      nickname: map["nickname"],
      avatar: map["avatar"],
      ext: map["ext"],
    );
  }

  String toJson() {
    return json.encode({
      "userId": userId,
      "nickname": nickname,
      "avatar": avatar,
      "ext": ext,
    });
  }
}

/// 合并消息
class MergeContent {}

/// 表情消息
class EmojiContent {}

/// 命令消息
class CommandContent {}

/// 富文本消息
class RichTxtContent {}

/// 标记消息
class MarkdownContent {}

/// 自定义消息
class CustomContent {}
