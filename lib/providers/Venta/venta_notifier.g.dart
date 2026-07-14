// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venta_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VentaNotifier)
final ventaProvider = VentaNotifierProvider._();

final class VentaNotifierProvider
    extends $AsyncNotifierProvider<VentaNotifier, List<Map<String, dynamic>>> {
  VentaNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ventaProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ventaNotifierHash();

  @$internal
  @override
  VentaNotifier create() => VentaNotifier();
}

String _$ventaNotifierHash() => r'18cc9325ea9cbd480e74dab3616d2566d166cb56';

abstract class _$VentaNotifier
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

@ProviderFor(ventaDetallada)
final ventaDetalladaProvider = VentaDetalladaFamily._();

final class VentaDetalladaProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, dynamic>>,
          Map<String, dynamic>,
          FutureOr<Map<String, dynamic>>
        >
    with
        $FutureModifier<Map<String, dynamic>>,
        $FutureProvider<Map<String, dynamic>> {
  VentaDetalladaProvider._({
    required VentaDetalladaFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'ventaDetalladaProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ventaDetalladaHash();

  @override
  String toString() {
    return r'ventaDetalladaProvider'
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
    return ventaDetallada(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is VentaDetalladaProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ventaDetalladaHash() => r'99b9ae002c7a8fb9f1a370cb302080355e689d1c';

final class VentaDetalladaFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Map<String, dynamic>>, int> {
  VentaDetalladaFamily._()
    : super(
        retry: null,
        name: r'ventaDetalladaProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VentaDetalladaProvider call(int id) =>
      VentaDetalladaProvider._(argument: id, from: this);

  @override
  String toString() => r'ventaDetalladaProvider';
}

@ProviderFor(ventasfiltrados)
final ventasfiltradosProvider = VentasfiltradosProvider._();

final class VentasfiltradosProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Map<String, dynamic>>>,
          List<Map<String, dynamic>>,
          FutureOr<List<Map<String, dynamic>>>
        >
    with
        $FutureModifier<List<Map<String, dynamic>>>,
        $FutureProvider<List<Map<String, dynamic>>> {
  VentasfiltradosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ventasfiltradosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ventasfiltradosHash();

  @$internal
  @override
  $FutureProviderElement<List<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Map<String, dynamic>>> create(Ref ref) {
    return ventasfiltrados(ref);
  }
}

String _$ventasfiltradosHash() => r'db3510945c75ecd79cb58f4a224839dd0ce9da95';
