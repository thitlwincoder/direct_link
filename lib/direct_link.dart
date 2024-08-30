library direct_link;

import 'package:direct_link/direct_link_impl.dart';

part 'models/site_model.dart';

class DirectLink {
  DirectLink get _instance => DirectLinkImpl();

  Future<SiteModel?> check(String url, {Duration? timeout}) {
    return _instance.check(url, timeout: timeout);
  }

  // Future<void> init({
  //   bool allowNotification = false,
  //   String? defaultIconAndroid,
  //   AndroidInitializationSettings? androidInitializationSettings,
  //   DarwinInitializationSettings? darwinInitializationSettings,
  // }) {
  //   return _instance.init(
  //     allowNotification: allowNotification,
  //     defaultIconAndroid: defaultIconAndroid,
  //     androidInitializationSettings: androidInitializationSettings,
  //     darwinInitializationSettings: darwinInitializationSettings,
  //   );
  // }

  // Future<DownloadTask?> download({
  //   String? fileName,
  //   required String url,
  //   required String savedDir,
  //   bool showNotification = true,
  //   bool autoStart = true,
  // }) {
  //   return _instance.download(
  //     url: url,
  //     savedDir: savedDir,
  //     fileName: fileName,
  //     autoStart: autoStart,
  //     showNotification: showNotification,
  //   );
  // }
}
