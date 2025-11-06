// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InsumoDetail)
const insumoDetailProvider = InsumoDetailFamily._();

final class InsumoDetailProvider
    extends $AsyncNotifierProvider<InsumoDetail, Insumo> {
  const InsumoDetailProvider._({
    required InsumoDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'insumoDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$insumoDetailHash();

  @override
  String toString() {
    return r'insumoDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  InsumoDetail create() => InsumoDetail();

  @override
  bool operator ==(Object other) {
    return other is InsumoDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$insumoDetailHash() => r'070cd9b16eb7e2693ca153a80d81ec6cea31881e';

final class InsumoDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          InsumoDetail,
          AsyncValue<Insumo>,
          Insumo,
          FutureOr<Insumo>,
          int
        > {
  const InsumoDetailFamily._()
    : super(
        retry: null,
        name: r'insumoDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InsumoDetailProvider call(int id) =>
      InsumoDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'insumoDetailProvider';
}

abstract class _$InsumoDetail extends $AsyncNotifier<Insumo> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<Insumo> build(int id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Insumo>, Insumo>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Insumo>, Insumo>,
              AsyncValue<Insumo>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
