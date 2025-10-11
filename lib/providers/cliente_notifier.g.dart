// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clienteDetailHash() => r'3092ce2f363790f87207ce3f24754aec6474616f';

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

/// See also [clienteDetail].
@ProviderFor(clienteDetail)
const clienteDetailProvider = ClienteDetailFamily();

/// See also [clienteDetail].
class ClienteDetailFamily extends Family<AsyncValue<Cliente>> {
  /// See also [clienteDetail].
  const ClienteDetailFamily();

  /// See also [clienteDetail].
  ClienteDetailProvider call(int id) {
    return ClienteDetailProvider(id);
  }

  @override
  ClienteDetailProvider getProviderOverride(
    covariant ClienteDetailProvider provider,
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
  String? get name => r'clienteDetailProvider';
}

/// See also [clienteDetail].
class ClienteDetailProvider extends AutoDisposeFutureProvider<Cliente> {
  /// See also [clienteDetail].
  ClienteDetailProvider(int id)
    : this._internal(
        (ref) => clienteDetail(ref as ClienteDetailRef, id),
        from: clienteDetailProvider,
        name: r'clienteDetailProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$clienteDetailHash,
        dependencies: ClienteDetailFamily._dependencies,
        allTransitiveDependencies:
            ClienteDetailFamily._allTransitiveDependencies,
        id: id,
      );

  ClienteDetailProvider._internal(
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
    FutureOr<Cliente> Function(ClienteDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClienteDetailProvider._internal(
        (ref) => create(ref as ClienteDetailRef),
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
  AutoDisposeFutureProviderElement<Cliente> createElement() {
    return _ClienteDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClienteDetailProvider && other.id == id;
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
mixin ClienteDetailRef on AutoDisposeFutureProviderRef<Cliente> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ClienteDetailProviderElement
    extends AutoDisposeFutureProviderElement<Cliente>
    with ClienteDetailRef {
  _ClienteDetailProviderElement(super.provider);

  @override
  int get id => (origin as ClienteDetailProvider).id;
}

String _$clienteNotifierHash() => r'f8b8248aefdc3a03c3e8afa0f37a876eaf54b69b';

/// See also [ClienteNotifier].
@ProviderFor(ClienteNotifier)
final clienteNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ClienteNotifier, List<Cliente>>.internal(
      ClienteNotifier.new,
      name: r'clienteNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$clienteNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ClienteNotifier = AutoDisposeAsyncNotifier<List<Cliente>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
