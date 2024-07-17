import 'dart:async';
import 'dart:io';

import 'package:direct_link/direct_link.dart';
import 'package:easy_downloader/easy_downloader.dart';
import 'package:easy_downloader_flutter_lib/easy_downloader_flutter_lib.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:puppeteer/puppeteer.dart';
part 'sites/social.dart';

class DirectLinkImpl implements DirectLink {
  @override
  Future<void> init({
    bool allowNotification = false,
    String? defaultIconAndroid,
    AndroidInitializationSettings? androidInitializationSettings,
    DarwinInitializationSettings? darwinInitializationSettings,
  }) async {
    await EasyDownloader().initFlutter(
      allowNotification: allowNotification,
      defaultIconAndroid: defaultIconAndroid,
      androidInitializationSettings: androidInitializationSettings,
      darwinInitializationSettings: darwinInitializationSettings,
    );
  }

  @override
  Future<SiteModel?> check(
    String url, {
    Duration? timeout,
    String? executablePath,
  }) {
    return _Social.get(
      url: url,
      timeout: timeout,
      executablePath: executablePath,
    );
  }

  @override
  Future<DownloadTask> download({
    String? fileName,
    required String url,
    required String savedDir,
    bool showNotification = true,
  }) async {
    var task = await EasyDownloader().download(
      url: url,
      path: savedDir,
      fileName: fileName,
      autoStart: true,
      headers: {'Referer': 'https://en1.savefrom.net/'},
    );

    if (showNotification) task.showNotification();

    return task;
  }
}
