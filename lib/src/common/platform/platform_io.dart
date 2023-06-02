import 'dart:io';

class SDKPlatform {
  static bool get isWeb => false;

  static bool get isIOS => Platform.isIOS;

  static bool get isAndroid => Platform.isAndroid;

  static bool get isWindows => Platform.isWindows;

  static bool get isMacOS => Platform.isMacOS;

  static bool get isLinux => Platform.isLinux;

  static bool get isDesktop =>
      SDKPlatform.isWindows || SDKPlatform.isMacOS || SDKPlatform.isLinux;
}
