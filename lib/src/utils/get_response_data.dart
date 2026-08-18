import 'dart:async';
import 'dart:convert';

import 'package:direct_link/src/models/site_model.dart';
import 'package:direct_link/src/utils/response_poller.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

const _defaultTimeout = Duration(seconds: 10);
const _pollInterval = Duration(milliseconds: 500);

/// Sends a POST request with a predefined form to the service and
/// returns the decoded response body.
Future<SiteModel?> getResponseData(
  String url, {
  double? timeoutInterval,
}) async {
  final model = Completer<SiteModel?>();
  final timeout = _timeoutDuration(timeoutInterval);
  final webView = HeadlessInAppWebView(
    initialSettings: InAppWebViewSettings(
      incognito: true,
      useOnLoadResource: true,
      mediaPlaybackRequiresUserGesture: false,
      javaScriptCanOpenWindowsAutomatically: true,
    ),
    initialUrlRequest: URLRequest(
      url: WebUri('https://savefrom.in.net/en9/'),
      timeoutInterval: timeoutInterval,
    ),
    onLoadStop: (controller, uri) async {
      if (model.isCompleted) return;

      await controller.evaluateJavascript(source: _submitScript(url));

      final data = await pollResponseData(
        getHtml: controller.getHtml,
        timeout: timeout,
        interval: _pollInterval,
      );

      if (!model.isCompleted) model.complete(data);
    },
  );

  await webView.run();
  try {
    return await model.future.timeout(timeout, onTimeout: () => null);
  } finally {
    await webView.dispose();
  }
}

Duration _timeoutDuration(double? timeoutInterval) {
  if (timeoutInterval == null || timeoutInterval <= 0) return _defaultTimeout;
  return Duration(milliseconds: (timeoutInterval * 1000).round());
}

String _submitScript(String url) {
  final encodedUrl = jsonEncode(url);
  return '''
    document.querySelector('#sf_url').value = $encodedUrl;
    document.querySelector('#sf_submit').click();
  ''';
}
