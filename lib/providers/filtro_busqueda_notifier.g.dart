// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtro_busqueda_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FiltroBusquedaNotifier)
const filtroBusquedaProvider = FiltroBusquedaNotifierProvider._();

final class FiltroBusquedaNotifierProvider
    extends $NotifierProvider<FiltroBusquedaNotifier, FiltroBusqueda> {
  const FiltroBusquedaNotifierProvider._()
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
    r'6e8522d3bda0467d5ac8bb446cf620e5e80181b5';

abstract class _$FiltroBusquedaNotifier extends $Notifier<FiltroBusqueda> {
  FiltroBusqueda build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<FiltroBusqueda, FiltroBusqueda>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FiltroBusqueda, FiltroBusqueda>,
              FiltroBusqueda,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
