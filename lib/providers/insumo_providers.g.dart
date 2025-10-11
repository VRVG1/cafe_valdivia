// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$insumoDetailHash() => r'25ec762993b55f4dddc2fb2deaeafc9aa6db2610';

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

/// See also [insumoDetail].
@ProviderFor(insumoDetail)
const insumoDetailProvider = InsumoDetailFamily();

/// See also [insumoDetail].
class InsumoDetailFamily extends Family<AsyncValue<Insumos>> {
  /// See also [insumoDetail].
  const InsumoDetailFamily();

  /// See also [insumoDetail].
  InsumoDetailProvider call(int id) {
    return InsumoDetailProvider(id);
  }

  @override
  InsumoDetailProvider getProviderOverride(
    covariant InsumoDetailProvider provider,
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
  String? get name => r'insumoDetailProvider';
}

/// See also [insumoDetail].
class InsumoDetailProvider extends AutoDisposeFutureProvider<Insumos> {
  /// See also [insumoDetail].
  InsumoDetailProvider(int id)
    : this._internal(
        (ref) => insumoDetail(ref as InsumoDetailRef, id),
        from: insumoDetailProvider,
        name: r'insumoDetailProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$insumoDetailHash,
        dependencies: InsumoDetailFamily._dependencies,
        allTransitiveDependencies:
            InsumoDetailFamily._allTransitiveDependencies,
        id: id,
      );

  InsumoDetailProvider._internal(
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
    FutureOr<Insumos> Function(InsumoDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InsumoDetailProvider._internal(
        (ref) => create(ref as InsumoDetailRef),
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
  AutoDisposeFutureProviderElement<Insumos> createElement() {
    return _InsumoDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InsumoDetailProvider && other.id == id;
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
mixin InsumoDetailRef on AutoDisposeFutureProviderRef<Insumos> {
  /// The parameter `id` of this provider.
  int get id;
}

class _InsumoDetailProviderElement
    extends AutoDisposeFutureProviderElement<Insumos>
    with InsumoDetailRef {
  _InsumoDetailProviderElement(super.provider);

  @override
  int get id => (origin as InsumoDetailProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
