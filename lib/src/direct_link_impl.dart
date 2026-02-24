import 'dart:async';

import 'package:direct_link/direct_link.dart';
import 'package:direct_link/src/utils/get_response_data.dart';

/// Default implementation of [DirectLink].
///
/// This class performs the network retrieval of [url] using
/// `getResponseData` and converts the retrieved content into a
/// [SiteModel] using `parseResponse`.
class DirectLinkImpl implements DirectLink {
  /// Fetches and parses the provided [url] to locate direct media links.
  ///
  /// - [url]: The page URL to analyze.
  ///
  /// Returns a [SiteModel] containing metadata and available `links`, or
  /// `null` when no media could be discovered.
  @override
  Future<SiteModel?> check(String url, {double? timeoutInterval}) async {
    return getResponseData(url, timeoutInterval: timeoutInterval);
  }
}
