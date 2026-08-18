import 'package:direct_link/src/direct_link_impl.dart';
import 'package:direct_link/src/models/site_model.dart';

/// Public API for resolving direct media links and metadata from a URL.
///
/// Use the default factory `DirectLink()` to obtain the package's
/// implementation which performs the underlying network fetch and parsing.
abstract class DirectLink {
  /// Returns the default implementation of [DirectLink].
  factory DirectLink() = DirectLinkImpl;

  /// Analyze [url] and return available media metadata and direct links.
  ///
  /// Returns a [SiteModel] with metadata and `links`, or `null` if no media
  /// could be found or an error occurred.
  Future<SiteModel?> check(String url, {double? timeoutInterval});
}
