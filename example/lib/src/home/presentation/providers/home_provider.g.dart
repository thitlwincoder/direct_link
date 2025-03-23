// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$directLinkHash() => r'3587a786afc19c243e47ec248f84c2585d7dcb48';

/// See also [directLink].
@ProviderFor(directLink)
final directLinkProvider = Provider<DirectLink>.internal(
  directLink,
  name: r'directLinkProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$directLinkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DirectLinkRef = ProviderRef<DirectLink>;
String _$homeHash() => r'6b041f6dcbe144730dcd74d4a6881fd81121bf95';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Home extends BuildlessAsyncNotifier<SiteModel?> {
  late final String url;

  FutureOr<SiteModel?> build(
    String url,
  );
}

/// See also [Home].
@ProviderFor(Home)
const homeProvider = HomeFamily();

/// See also [Home].
class HomeFamily extends Family<AsyncValue<SiteModel?>> {
  /// See also [Home].
  const HomeFamily();

  /// See also [Home].
  HomeProvider call(
    String url,
  ) {
    return HomeProvider(
      url,
    );
  }

  @override
  HomeProvider getProviderOverride(
    covariant HomeProvider provider,
  ) {
    return call(
      provider.url,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'homeProvider';
}

/// See also [Home].
class HomeProvider extends AsyncNotifierProviderImpl<Home, SiteModel?> {
  /// See also [Home].
  HomeProvider(
    String url,
  ) : this._internal(
          () => Home()..url = url,
          from: homeProvider,
          name: r'homeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$homeHash,
          dependencies: HomeFamily._dependencies,
          allTransitiveDependencies: HomeFamily._allTransitiveDependencies,
          url: url,
        );

  HomeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.url,
  }) : super.internal();

  final String url;

  @override
  FutureOr<SiteModel?> runNotifierBuild(
    covariant Home notifier,
  ) {
    return notifier.build(
      url,
    );
  }

  @override
  Override overrideWith(Home Function() create) {
    return ProviderOverride(
      origin: this,
      override: HomeProvider._internal(
        () => create()..url = url,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        url: url,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<Home, SiteModel?> createElement() {
    return _HomeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HomeProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin HomeRef on AsyncNotifierProviderRef<SiteModel?> {
  /// The parameter `url` of this provider.
  String get url;
}

class _HomeProviderElement
    extends AsyncNotifierProviderElement<Home, SiteModel?> with HomeRef {
  _HomeProviderElement(super.provider);

  @override
  String get url => (origin as HomeProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
