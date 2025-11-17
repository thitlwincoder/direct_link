/// Public API for resolving direct media links and metadata from a URL.
///
/// Use the default factory `DirectLink()` to obtain the package's
/// implementation which performs the underlying network fetch and
/// parsing. The API returns a [SiteModel] describing found media or
/// `null` when no media could be extracted.
library;

import 'package:direct_link/direct_link.dart';
import 'package:direct_link/src/direct_link_impl.dart';

/// DirectLink
abstract class DirectLink {
  /// Returns the default implementation of [DirectLink].
  ///
  /// The implementation returned is `DirectLinkImpl`, which performs HTTP
  /// retrieval of the provided URL and parses the response into a
  /// [SiteModel].
  factory DirectLink() = DirectLinkImpl;

  /// Analyze [url] and return available media metadata and direct links.
  ///
  /// - [url]: The page URL to analyze for embedded or downloadable media.
  /// - [timeout]: Optional timeout for network operations; implementations
  ///   may choose to respect it or ignore it.
  ///
  /// Returns a [SiteModel] with metadata and `links`, or `null` if no
  /// media could be found or an error occurred.
  Future<SiteModel?> check(String url, {Duration? timeout});
}
