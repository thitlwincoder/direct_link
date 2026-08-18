import 'dart:async';
import 'dart:convert';

import 'package:direct_link/src/models/site_model.dart';
import 'package:direct_link/src/utils/response_parser.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// Sends a POST request with a predefined form to the service and
/// returns the decoded response body.
Future<SiteModel?> getResponseData(
  String url, {
  double? timeoutInterval,
}) async {
  final model = Completer<SiteModel?>();
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
      await controller.evaluateJavascript(source: _submitScript(url));

      final data = await Future.delayed(const Duration(seconds: 10), () async {
        final content = await controller.getHtml();
        return parseResponseData(content);
      });

      if (!model.isCompleted) model.complete(data);
    },
  );

  await webView.run();
  try {
    return await model.future;
  } finally {
    await webView.dispose();
  }
}

String _submitScript(String url) {
  final encodedUrl = jsonEncode(url);
  return '''
    document.querySelector('#sf_url').value = $encodedUrl;
    document.querySelector('#sf_submit').click();
  ''';
}
