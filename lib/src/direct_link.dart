import 'package:direct_link/direct_link.dart';
import 'package:direct_link/src/direct_link_impl.dart';

abstract class DirectLink {
  factory DirectLink() = DirectLinkImpl;

  Future<SiteModel?> check(String url, {Duration? timeout});
}
