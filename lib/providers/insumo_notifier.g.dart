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
    extends $AsyncNotifierProvider<InsumoNotifier, List<Insumo>> {
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

String _$insumoNotifierHash() => r'0c68539c6092e68dbd38408d7e09f4765d120c64';

abstract class _$InsumoNotifier extends $AsyncNotifier<List<Insumo>> {
  FutureOr<List<Insumo>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Insumo>>, List<Insumo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Insumo>>, List<Insumo>>,
              AsyncValue<List<Insumo>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
