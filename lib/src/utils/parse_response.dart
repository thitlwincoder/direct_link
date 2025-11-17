import 'dart:async';

import 'package:direct_link/direct_link.dart';
import 'package:direct_link/src/utils/parse_html.dart';
import 'package:direct_link/src/utils/script.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// Helpers for converting the decoded service response into a
/// `SiteModel` using a headless webview.
///
/// The remote service returns a JavaScript snippet that, when executed
/// inside a browser context, prints the data to the console via
/// `window.parent.sf.videoResult.show(...)` or
/// `window.parent.sf.videoResult.showRows(...)`. This function spins
/// up a headless `InAppWebView`, injects the provided JavaScript
/// (`decodedText`) into the page, listens for console messages, then
/// extracts and returns the parsed `SiteModel` via `parseHtml`.
///
/// Important behavior notes:
/// - The function returns a `Future<SiteModel>` that completes when
///   the first console message containing a valid payload is parsed.
/// - It configures the headless webview with caches cleared and
///   disabled to avoid stale results.
/// - JavaScript alert/confirm/prompt dialogs are automatically
///   handled by returning confirmation responses so execution is not
///   blocked.
///
/// Parameters:
/// - `decodedText`: The JavaScript source to evaluate inside the
///   headless webview. This should be the payload extracted from the
///   remote HTTP response and is expected to call the `show`/`showRows`
///   functions on `window.parent.sf`.
///
/// Returns: A `Future<SiteModel>` that completes with the parsed
/// `SiteModel`. The future will complete only once; if the webview
/// never logs a valid payload the future will remain unresolved.
///
/// Example:
/// ```dart
/// final model = await parseResponse(jsSnippetString);
/// print(model.title);
/// ```
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
