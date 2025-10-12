// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unidad_medida_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UnidadMedidaDetail)
const unidadMedidaDetailProvider = UnidadMedidaDetailFamily._();

final class UnidadMedidaDetailProvider
    extends $AsyncNotifierProvider<UnidadMedidaDetail, UnidadMedida> {
  const UnidadMedidaDetailProvider._({
    required UnidadMedidaDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'unidadMedidaDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$unidadMedidaDetailHash();

  @override
  String toString() {
    return r'unidadMedidaDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UnidadMedidaDetail create() => UnidadMedidaDetail();

  @override
  bool operator ==(Object other) {
    return other is UnidadMedidaDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$unidadMedidaDetailHash() =>
    r'89907df25fb00fe8ed1da7c50dd12ea8260f5236';

final class UnidadMedidaDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          UnidadMedidaDetail,
          AsyncValue<UnidadMedida>,
          UnidadMedida,
          FutureOr<UnidadMedida>,
          int
        > {
  const UnidadMedidaDetailFamily._()
    : super(
        retry: null,
        name: r'unidadMedidaDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UnidadMedidaDetailProvider call(int id) =>
      UnidadMedidaDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'unidadMedidaDetailProvider';
}

abstract class _$UnidadMedidaDetail extends $AsyncNotifier<UnidadMedida> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<UnidadMedida> build(int id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<UnidadMedida>, UnidadMedida>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UnidadMedida>, UnidadMedida>,
              AsyncValue<UnidadMedida>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
