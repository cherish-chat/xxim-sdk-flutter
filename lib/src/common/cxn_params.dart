class CxnParams {
  final String platform;
  final String deviceId;
  final String deviceModel;
  final String osVersion;
  final String appVersion;
  final String language;
  final String networkUsed;
  final List<int> ext;

  const CxnParams({
    required this.platform,
    required this.deviceId,
    required this.deviceModel,
    required this.osVersion,
    required this.appVersion,
    required this.language,
    required this.networkUsed,
    this.ext = const [],
  });
}
