import 'dart:async';

import 'package:direct_link/direct_link.dart';
import 'package:direct_link/src/utils/parse_html.dart';
import 'package:direct_link/src/utils/script.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<SiteModel> parseResponse(String decodedText) {
  var model = Completer<SiteModel>();

  HeadlessInAppWebView(
      initialUrlRequest: .new(url: .new('about:blank')),
      initialSettings: .new(
        clearCache: true,
        cacheEnabled: false,
        clearSessionCache: true,
      ),
      onJsAlert: (controller, jsAlertRequest) async {
        return .new(handledByClient: true, action: .CONFIRM);
      },
      onJsConfirm: (controller, jsConfirmRequest) async {
        return .new(handledByClient: true, action: .CONFIRM);
      },
      onJsPrompt: (controller, jsPromptRequest) async {
        return .new(handledByClient: true, action: .CONFIRM, value: "");
      },
      onConsoleMessage: (controller, r) async {
        var message = r.message;
        var p = parseHtml(message);
        if (p == null) return;
        model.complete(p);
      },

      onLoadStop: (controller, _) {
        controller.evaluateJavascript(source: script(decodedText));
      },
    )
    ..run()
    ..dispose();

  return model.future;
}
