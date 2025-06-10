import 'dart:async';

import 'package:direct_link/direct_link.dart';
import 'package:direct_link/src/utils/parse_html.dart';
import 'package:direct_link/src/utils/script.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future<SiteModel> parseResponse(String decodedText) {
  var model = Completer<SiteModel>();

  HeadlessInAppWebView(
      initialUrlRequest: URLRequest(url: WebUri('about:blank')),
      initialSettings: InAppWebViewSettings(
        clearCache: true,
        cacheEnabled: false,
        clearSessionCache: true,
      ),
      onJsAlert: (controller, jsAlertRequest) async {
        return JsAlertResponse(
          handledByClient: true,
          action: JsAlertResponseAction.CONFIRM,
        );
      },
      onJsConfirm: (controller, jsConfirmRequest) async {
        return JsConfirmResponse(
          handledByClient: true,
          action: JsConfirmResponseAction.CONFIRM,
        );
      },
      onJsPrompt: (controller, jsPromptRequest) async {
        return JsPromptResponse(
          handledByClient: true,
          action: JsPromptResponseAction.CONFIRM,
          value: "",
        );
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
