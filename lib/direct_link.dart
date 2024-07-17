library direct_link;

import 'package:direct_link/direct_link_impl.dart';
import 'package:easy_downloader/easy_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

export 'package:flutter_local_notifications/flutter_local_notifications.dart';

part 'models/site_model.dart';

class DirectLink {
  DirectLink get _instance => DirectLinkImpl();

  Future<void> init({
    bool allowNotification = false,
    String? defaultIconAndroid,
    AndroidInitializationSettings? androidInitializationSettings,
    DarwinInitializationSettings? darwinInitializationSettings,
  }) {
    return _instance.init(
      allowNotification: allowNotification,
      defaultIconAndroid: defaultIconAndroid,
      androidInitializationSettings: androidInitializationSettings,
      darwinInitializationSettings: darwinInitializationSettings,
    );
  }

  Future<SiteModel?> check(String url, {Duration? timeout}) {
    return _instance.check(url, timeout: timeout);
  }

  Future<DownloadTask> download({
    String? fileName,
    required String url,
    required String savedDir,
    bool showNotification = true,
  }) {
    return _instance.download(
      url: url,
      savedDir: savedDir,
      fileName: fileName,
      showNotification: showNotification,
    );
  }
}
