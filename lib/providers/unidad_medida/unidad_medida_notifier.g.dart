// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unidad_medida_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UnidadMedidaNotifier)
final unidadMedidaProvider = UnidadMedidaNotifierProvider._();

final class UnidadMedidaNotifierProvider
    extends $AsyncNotifierProvider<UnidadMedidaNotifier, List<UnidadMedida>> {
  UnidadMedidaNotifierProvider._()
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
    r'0e0d4543996eae4f4d86f4c1d306c8b0af5a4f01';

abstract class _$UnidadMedidaNotifier
    extends $AsyncNotifier<List<UnidadMedida>> {
  FutureOr<List<UnidadMedida>> build();
  @$mustCallSuper
  @override
  void runBuild() {
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
    element.handleCreate(ref, build);
  }
}
