// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proveedor_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProveedorNotifier)
const proveedorProvider = ProveedorNotifierProvider._();

final class ProveedorNotifierProvider
    extends $AsyncNotifierProvider<ProveedorNotifier, List<Proveedor>> {
  const ProveedorNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'proveedorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$proveedorNotifierHash();

  @$internal
  @override
  ProveedorNotifier create() => ProveedorNotifier();
}

String _$proveedorNotifierHash() => r'8c0171a1b3f5a02fee0ace46afc9a8187248d853';

abstract class _$ProveedorNotifier extends $AsyncNotifier<List<Proveedor>> {
  FutureOr<List<Proveedor>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Proveedor>>, List<Proveedor>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Proveedor>>, List<Proveedor>>,
              AsyncValue<List<Proveedor>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
