import 'package:example/core/router/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_config.g.dart';

@riverpod
GoRouter routerConfig(RouterConfigRef ref) {
  return GoRouter(
    routes: $appRoutes,
  );
}
