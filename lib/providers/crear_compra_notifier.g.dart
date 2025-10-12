// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crear_compra_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CrearCompraNotifier)
const crearCompraProvider = CrearCompraNotifierProvider._();

final class CrearCompraNotifierProvider
    extends $NotifierProvider<CrearCompraNotifier, CrearCompraState> {
  const CrearCompraNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'crearCompraProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$crearCompraNotifierHash();

  @$internal
  @override
  CrearCompraNotifier create() => CrearCompraNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CrearCompraState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CrearCompraState>(value),
    );
  }
}

String _$crearCompraNotifierHash() =>
    r'43fafc97b97c52f0dbf6a43ef32861c1c4d017b2';

abstract class _$CrearCompraNotifier extends $Notifier<CrearCompraState> {
  CrearCompraState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CrearCompraState, CrearCompraState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CrearCompraState, CrearCompraState>,
              CrearCompraState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
