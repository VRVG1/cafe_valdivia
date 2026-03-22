// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InsumoNotifier)
final insumoProvider = InsumoNotifierProvider._();

final class InsumoNotifierProvider
    extends $AsyncNotifierProvider<InsumoNotifier, List<Insumo>> {
  InsumoNotifierProvider._()
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

String _$insumoNotifierHash() => r'55504b43048bf92626bf21e253caee2e02b55b4e';

abstract class _$InsumoNotifier extends $AsyncNotifier<List<Insumo>> {
  FutureOr<List<Insumo>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Insumo>>, List<Insumo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Insumo>>, List<Insumo>>,
              AsyncValue<List<Insumo>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
