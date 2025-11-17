import 'dart:async';

import 'package:direct_link/direct_link.dart';
import 'package:direct_link/src/utils/get_response_data.dart';
import 'package:direct_link/src/utils/parse_response.dart';

/// Default implementation of [DirectLink].
///
/// This class performs the network retrieval of [url] using
/// `getResponseData` and converts the retrieved content into a
/// [SiteModel] using `parseResponse`.
class DirectLinkImpl implements DirectLink {
  @override
  /// Fetches and parses the provided [url] to locate direct media links.
  ///
  /// - [url]: The page URL to analyze.
  /// - [timeout]: Optional timeout for network operations. Note: this
  ///   implementation currently does not forward [timeout] to
  ///   `getResponseData` but the parameter exists for API compatibility.
  /// - [executablePath]: Optional helper executable path. This parameter
  ///   is preserved for platforms that might require an external helper
  ///   binary; it is currently unused by the default implementation.
  ///
  /// Returns a [SiteModel] containing metadata and available `links`, or
  /// `null` when no media could be discovered.
  Future<SiteModel?> check(
    String url, {
    Duration? timeout,
    String? executablePath,
  }) async {
    return parseResponse(await getResponseData(url));
  }
}
