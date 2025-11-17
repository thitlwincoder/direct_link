import 'dart:convert';

import 'package:direct_link/src/models/site_model.dart';
import 'package:direct_link/src/utils/parse_model.dart';

/// Parses the remote service response and returns a `SiteModel`.
///
/// - `message`: The full HTTP response body (HTML/JS) returned by the
///   remote service. This method attempts to extract the JSON payload
///   embedded in the JavaScript call and convert it to `SiteModel`.
///
/// Returns a `SiteModel` on success or `null` if the expected payload
/// cannot be found or parsed.
SiteModel? parseHtml(String message) {
  final executed =
      message.split('window.parent.sf.videoResult.show(').elementAtOrNull(1) ??
      message
          .split('window.parent.sf.videoResult.showRows(')
          .elementAtOrNull(1);

  if (executed == null) return null;

  if (message.contains('showRows')) {
    final splits = executed.split('],"');
    final lastIndex = splits.indexWhere(
      (v) => v.contains('window.parent.sf.enableElement'),
    );
    final joined = '${splits.take(lastIndex).join('],"')}]';
    return parseModel(jsonDecode(joined)[0]);
  }

  final json = jsonDecode(executed.split(');')[0]);
  return parseModel(json);
}
