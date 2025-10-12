// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InsumoNotifier)
const insumoProvider = InsumoNotifierProvider._();

final class InsumoNotifierProvider
    extends $AsyncNotifierProvider<InsumoNotifier, List<Insumos>> {
  const InsumoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'insumoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$insumoNotifierHash();

  @$internal
  @override
  InsumoNotifier create() => InsumoNotifier();
}

String _$insumoNotifierHash() => r'72bfa05b77bd11100c39304252675a71ee9b874d';

abstract class _$InsumoNotifier extends $AsyncNotifier<List<Insumos>> {
  FutureOr<List<Insumos>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Insumos>>, List<Insumos>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Insumos>>, List<Insumos>>,
              AsyncValue<List<Insumos>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
