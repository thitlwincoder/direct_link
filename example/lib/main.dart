import 'package:example/core/router/router_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Direct Link',
      debugShowCheckedModeBanner: false,
      theme: .light(useMaterial3: true),
      darkTheme: .dark(useMaterial3: true),
      routerConfig: ref.watch(routerConfigProvider),
    );
  }
}
