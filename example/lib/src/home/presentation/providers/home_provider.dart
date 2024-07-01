import 'package:direct_link/direct_link.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@Riverpod(keepAlive: true)
class Home extends _$Home {
  @override
  Future<SiteModel?> build(String url) {
    return DirectLink().check(url);
  }
}
