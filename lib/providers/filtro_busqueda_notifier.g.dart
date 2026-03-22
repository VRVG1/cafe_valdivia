// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtro_busqueda_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FiltroBusquedaNotifier)
final filtroBusquedaProvider = FiltroBusquedaNotifierProvider._();

final class FiltroBusquedaNotifierProvider
    extends $NotifierProvider<FiltroBusquedaNotifier, FiltroBusqueda> {
  FiltroBusquedaNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filtroBusquedaProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filtroBusquedaNotifierHash();

  @$internal
  @override
  FiltroBusquedaNotifier create() => FiltroBusquedaNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FiltroBusqueda value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FiltroBusqueda>(value),
    );
  }
}

String _$filtroBusquedaNotifierHash() =>
    r'2641f14c5f6eab1c1e5f450eb42ab892ad1e9621';

abstract class _$FiltroBusquedaNotifier extends $Notifier<FiltroBusqueda> {
  FiltroBusqueda build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<FiltroBusqueda, FiltroBusqueda>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FiltroBusqueda, FiltroBusqueda>,
              FiltroBusqueda,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
