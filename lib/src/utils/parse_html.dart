import 'dart:convert';

import 'package:direct_link/src/models/site_model.dart';
import 'package:direct_link/src/utils/parse_model.dart';

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
    final json = jsonDecode(joined);
    return parseModel(json[0]);
  } else {
    final json = jsonDecode(executed.split(');')[0]);
    return parseModel(json);
  }
}
