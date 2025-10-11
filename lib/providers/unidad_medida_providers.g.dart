// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unidad_medida_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$unidadMedidaDetailHash() =>
    r'f212767bd99fa7f7615c65bef72c38ceff770f23';

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

/// See also [unidadMedidaDetail].
@ProviderFor(unidadMedidaDetail)
const unidadMedidaDetailProvider = UnidadMedidaDetailFamily();

/// See also [unidadMedidaDetail].
class UnidadMedidaDetailFamily extends Family<AsyncValue<UnidadMedida>> {
  /// See also [unidadMedidaDetail].
  const UnidadMedidaDetailFamily();

  /// See also [unidadMedidaDetail].
  UnidadMedidaDetailProvider call(int id) {
    return UnidadMedidaDetailProvider(id);
  }

  @override
  UnidadMedidaDetailProvider getProviderOverride(
    covariant UnidadMedidaDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'unidadMedidaDetailProvider';
}

/// See also [unidadMedidaDetail].
class UnidadMedidaDetailProvider
    extends AutoDisposeFutureProvider<UnidadMedida> {
  /// See also [unidadMedidaDetail].
  UnidadMedidaDetailProvider(int id)
    : this._internal(
        (ref) => unidadMedidaDetail(ref as UnidadMedidaDetailRef, id),
        from: unidadMedidaDetailProvider,
        name: r'unidadMedidaDetailProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$unidadMedidaDetailHash,
        dependencies: UnidadMedidaDetailFamily._dependencies,
        allTransitiveDependencies:
            UnidadMedidaDetailFamily._allTransitiveDependencies,
        id: id,
      );

  UnidadMedidaDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<UnidadMedida> Function(UnidadMedidaDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UnidadMedidaDetailProvider._internal(
        (ref) => create(ref as UnidadMedidaDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UnidadMedida> createElement() {
    return _UnidadMedidaDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UnidadMedidaDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UnidadMedidaDetailRef on AutoDisposeFutureProviderRef<UnidadMedida> {
  /// The parameter `id` of this provider.
  int get id;
}

class _UnidadMedidaDetailProviderElement
    extends AutoDisposeFutureProviderElement<UnidadMedida>
    with UnidadMedidaDetailRef {
  _UnidadMedidaDetailProviderElement(super.provider);

  @override
  int get id => (origin as UnidadMedidaDetailProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
