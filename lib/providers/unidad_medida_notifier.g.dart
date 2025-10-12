// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unidad_medida_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UnidadMedidaNotifier)
const unidadMedidaProvider = UnidadMedidaNotifierProvider._();

final class UnidadMedidaNotifierProvider
    extends $AsyncNotifierProvider<UnidadMedidaNotifier, List<UnidadMedida>> {
  const UnidadMedidaNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unidadMedidaProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unidadMedidaNotifierHash();

  @$internal
  @override
  UnidadMedidaNotifier create() => UnidadMedidaNotifier();
}

String _$unidadMedidaNotifierHash() =>
    r'2db0dc6da00ab7894dcee968eab06c55afd9b064';

abstract class _$UnidadMedidaNotifier
    extends $AsyncNotifier<List<UnidadMedida>> {
  FutureOr<List<UnidadMedida>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<UnidadMedida>>, List<UnidadMedida>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<UnidadMedida>>, List<UnidadMedida>>,
              AsyncValue<List<UnidadMedida>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
