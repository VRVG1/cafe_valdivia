// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proveedor_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$proveedorDetailHash() => r'c7d5a212b2b2c2fc261686e97e917e01ef5d2b9f';

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

/// See also [proveedorDetail].
@ProviderFor(proveedorDetail)
const proveedorDetailProvider = ProveedorDetailFamily();

/// See also [proveedorDetail].
class ProveedorDetailFamily extends Family<AsyncValue<Proveedor>> {
  /// See also [proveedorDetail].
  const ProveedorDetailFamily();

  /// See also [proveedorDetail].
  ProveedorDetailProvider call(int id) {
    return ProveedorDetailProvider(id);
  }

  @override
  ProveedorDetailProvider getProviderOverride(
    covariant ProveedorDetailProvider provider,
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
  String? get name => r'proveedorDetailProvider';
}

/// See also [proveedorDetail].
class ProveedorDetailProvider extends AutoDisposeFutureProvider<Proveedor> {
  /// See also [proveedorDetail].
  ProveedorDetailProvider(int id)
    : this._internal(
        (ref) => proveedorDetail(ref as ProveedorDetailRef, id),
        from: proveedorDetailProvider,
        name: r'proveedorDetailProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$proveedorDetailHash,
        dependencies: ProveedorDetailFamily._dependencies,
        allTransitiveDependencies:
            ProveedorDetailFamily._allTransitiveDependencies,
        id: id,
      );

  ProveedorDetailProvider._internal(
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
    FutureOr<Proveedor> Function(ProveedorDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProveedorDetailProvider._internal(
        (ref) => create(ref as ProveedorDetailRef),
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
  AutoDisposeFutureProviderElement<Proveedor> createElement() {
    return _ProveedorDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProveedorDetailProvider && other.id == id;
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
mixin ProveedorDetailRef on AutoDisposeFutureProviderRef<Proveedor> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProveedorDetailProviderElement
    extends AutoDisposeFutureProviderElement<Proveedor>
    with ProveedorDetailRef {
  _ProveedorDetailProviderElement(super.provider);

  @override
  int get id => (origin as ProveedorDetailProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
