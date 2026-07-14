// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orden_produccion_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrdenProduccionNotifier)
final ordenProduccionProvider = OrdenProduccionNotifierProvider._();

final class OrdenProduccionNotifierProvider
    extends
        $AsyncNotifierProvider<
          OrdenProduccionNotifier,
          List<Map<String, dynamic>>
        > {
  OrdenProduccionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordenProduccionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordenProduccionNotifierHash();

  @$internal
  @override
  OrdenProduccionNotifier create() => OrdenProduccionNotifier();
}

String _$ordenProduccionNotifierHash() =>
    r'06fbbaa122d10ad2abfe8c67c834a312f908bbd6';

abstract class _$OrdenProduccionNotifier
    extends $AsyncNotifier<List<Map<String, dynamic>>> {
  FutureOr<List<Map<String, dynamic>>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<Map<String, dynamic>>>,
              List<Map<String, dynamic>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<Map<String, dynamic>>>,
                List<Map<String, dynamic>>
              >,
              AsyncValue<List<Map<String, dynamic>>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ordenProduccionDetallada)
final ordenProduccionDetalladaProvider = OrdenProduccionDetalladaFamily._();

final class OrdenProduccionDetalladaProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, dynamic>>,
          Map<String, dynamic>,
          FutureOr<Map<String, dynamic>>
        >
    with
        $FutureModifier<Map<String, dynamic>>,
        $FutureProvider<Map<String, dynamic>> {
  OrdenProduccionDetalladaProvider._({
    required OrdenProduccionDetalladaFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'ordenProduccionDetalladaProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ordenProduccionDetalladaHash();

  @override
  String toString() {
    return r'ordenProduccionDetalladaProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Map<String, dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, dynamic>> create(Ref ref) {
    final argument = this.argument as int;
    return ordenProduccionDetallada(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is OrdenProduccionDetalladaProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ordenProduccionDetalladaHash() =>
    r'0e352407f0ee3e23cee9e36bb04a699f817890f5';

final class OrdenProduccionDetalladaFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Map<String, dynamic>>, int> {
  OrdenProduccionDetalladaFamily._()
    : super(
        retry: null,
        name: r'ordenProduccionDetalladaProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OrdenProduccionDetalladaProvider call(int id) =>
      OrdenProduccionDetalladaProvider._(argument: id, from: this);

  @override
  String toString() => r'ordenProduccionDetalladaProvider';
}

@ProviderFor(ordenProduccionFiltrado)
final ordenProduccionFiltradoProvider = OrdenProduccionFiltradoProvider._();

final class OrdenProduccionFiltradoProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Map<String, dynamic>>>,
          List<Map<String, dynamic>>,
          FutureOr<List<Map<String, dynamic>>>
        >
    with
        $FutureModifier<List<Map<String, dynamic>>>,
        $FutureProvider<List<Map<String, dynamic>>> {
  OrdenProduccionFiltradoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordenProduccionFiltradoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordenProduccionFiltradoHash();

  @$internal
  @override
  $FutureProviderElement<List<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Map<String, dynamic>>> create(Ref ref) {
    return ordenProduccionFiltrado(ref);
  }
}

String _$ordenProduccionFiltradoHash() =>
    r'39c1d767e25df5f89611858111de6eb9d5adc33d';
