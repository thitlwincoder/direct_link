// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Home)
final homeProvider = HomeFamily._();

final class HomeProvider extends $AsyncNotifierProvider<Home, SiteModel?> {
  HomeProvider._({
    required HomeFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'homeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$homeHash();

  @override
  String toString() {
    return r'homeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  Home create() => Home();

  @override
  bool operator ==(Object other) {
    return other is HomeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$homeHash() => r'a3d64f2bdc49697f3a491140f50ce534b6173e57';

final class HomeFamily extends $Family
    with
        $ClassFamilyOverride<
          Home,
          AsyncValue<SiteModel?>,
          SiteModel?,
          FutureOr<SiteModel?>,
          String
        > {
  HomeFamily._()
    : super(
        retry: null,
        name: r'homeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HomeProvider call(String url) => HomeProvider._(argument: url, from: this);

  @override
  String toString() => r'homeProvider';
}

abstract class _$Home extends $AsyncNotifier<SiteModel?> {
  late final _$args = ref.$arg as String;
  String get url => _$args;

  FutureOr<SiteModel?> build(String url);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SiteModel?>, SiteModel?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SiteModel?>, SiteModel?>,
              AsyncValue<SiteModel?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
