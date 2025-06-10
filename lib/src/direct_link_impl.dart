import 'dart:async';

import 'package:direct_link/direct_link.dart';
import 'package:direct_link/src/utils/get_response_data.dart';
import 'package:direct_link/src/utils/parse_response.dart';

class DirectLinkImpl implements DirectLink {
  @override
  Future<SiteModel?> check(
    String url, {
    Duration? timeout,
    String? executablePath,
  }) async {
    return parseResponse(await getResponseData(url));
  }
}
