// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compra_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompraNotifier)
final compraProvider = CompraNotifierProvider._();

final class CompraNotifierProvider
    extends $AsyncNotifierProvider<CompraNotifier, List<Map<String, dynamic>>> {
  CompraNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'compraProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$compraNotifierHash();

  @$internal
  @override
  CompraNotifier create() => CompraNotifier();
}

String _$compraNotifierHash() => r'34e09821dca80151b118b08174ed0c41f13014c3';

abstract class _$CompraNotifier
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

@ProviderFor(compraDetallada)
final compraDetalladaProvider = CompraDetalladaFamily._();

final class CompraDetalladaProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, dynamic>>,
          Map<String, dynamic>,
          FutureOr<Map<String, dynamic>>
        >
    with
        $FutureModifier<Map<String, dynamic>>,
        $FutureProvider<Map<String, dynamic>> {
  CompraDetalladaProvider._({
    required CompraDetalladaFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'compraDetalladaProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$compraDetalladaHash();

  @override
  String toString() {
    return r'compraDetalladaProvider'
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
    return compraDetallada(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CompraDetalladaProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$compraDetalladaHash() => r'16c937ef9ba0fda5565144ac50b35312af53b647';

final class CompraDetalladaFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Map<String, dynamic>>, int> {
  CompraDetalladaFamily._()
    : super(
        retry: null,
        name: r'compraDetalladaProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CompraDetalladaProvider call(int id) =>
      CompraDetalladaProvider._(argument: id, from: this);

  @override
  String toString() => r'compraDetalladaProvider';
}

@ProviderFor(compraFiltrados)
final compraFiltradosProvider = CompraFiltradosProvider._();

final class CompraFiltradosProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Map<String, dynamic>>>,
          List<Map<String, dynamic>>,
          FutureOr<List<Map<String, dynamic>>>
        >
    with
        $FutureModifier<List<Map<String, dynamic>>>,
        $FutureProvider<List<Map<String, dynamic>>> {
  CompraFiltradosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'compraFiltradosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$compraFiltradosHash();

  @$internal
  @override
  $FutureProviderElement<List<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Map<String, dynamic>>> create(Ref ref) {
    return compraFiltrados(ref);
  }
}

String _$compraFiltradosHash() => r'f48cfbb7b05ef61be126157433e2510e2990a9c0';
