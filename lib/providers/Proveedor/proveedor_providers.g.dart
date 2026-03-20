// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proveedor_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProveedorList)
final proveedorListProvider = ProveedorListProvider._();

final class ProveedorListProvider
    extends $AsyncNotifierProvider<ProveedorList, List<Proveedor>> {
  ProveedorListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'proveedorListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$proveedorListHash();

  @$internal
  @override
  ProveedorList create() => ProveedorList();
}

String _$proveedorListHash() => r'85d00cba35eb78e9b4bab873ceee080253719b3e';

abstract class _$ProveedorList extends $AsyncNotifier<List<Proveedor>> {
  FutureOr<List<Proveedor>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Proveedor>>, List<Proveedor>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Proveedor>>, List<Proveedor>>,
              AsyncValue<List<Proveedor>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(proveedorDetail)
final proveedorDetailProvider = ProveedorDetailFamily._();

final class ProveedorDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<Proveedor>,
          Proveedor,
          FutureOr<Proveedor>
        >
    with $FutureModifier<Proveedor>, $FutureProvider<Proveedor> {
  ProveedorDetailProvider._({
    required ProveedorDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'proveedorDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$proveedorDetailHash();

  @override
  String toString() {
    return r'proveedorDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Proveedor> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Proveedor> create(Ref ref) {
    final argument = this.argument as int;
    return proveedorDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ProveedorDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$proveedorDetailHash() => r'4491bebd1497cf7a290d1833c2dc7bff65ae0de6';

final class ProveedorDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Proveedor>, int> {
  ProveedorDetailFamily._()
    : super(
        retry: null,
        name: r'proveedorDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProveedorDetailProvider call(int id) =>
      ProveedorDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'proveedorDetailProvider';
}

@ProviderFor(proveedoresFiltrados)
final proveedoresFiltradosProvider = ProveedoresFiltradosProvider._();

final class ProveedoresFiltradosProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Proveedor>>,
          List<Proveedor>,
          FutureOr<List<Proveedor>>
        >
    with $FutureModifier<List<Proveedor>>, $FutureProvider<List<Proveedor>> {
  ProveedoresFiltradosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'proveedoresFiltradosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$proveedoresFiltradosHash();

  @$internal
  @override
  $FutureProviderElement<List<Proveedor>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Proveedor>> create(Ref ref) {
    return proveedoresFiltrados(ref);
  }
}

String _$proveedoresFiltradosHash() =>
    r'094f6faf46022629cefa8f44b3d9e3c67e3d8df3';
