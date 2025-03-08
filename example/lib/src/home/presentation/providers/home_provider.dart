import 'package:direct_link/direct_link.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
DirectLink directLink(Ref ref) {
  return DirectLink();
}

@Riverpod(keepAlive: true)
class Home extends _$Home {
  @override
  Future<SiteModel?> build(String url) {
    return ref.read(directLinkProvider).check(url);
  }
}
