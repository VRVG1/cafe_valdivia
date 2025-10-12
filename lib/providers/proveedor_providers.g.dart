// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proveedor_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProveedorDetail)
const proveedorDetailProvider = ProveedorDetailFamily._();

final class ProveedorDetailProvider
    extends $AsyncNotifierProvider<ProveedorDetail, Proveedor> {
  const ProveedorDetailProvider._({
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
  ProveedorDetail create() => ProveedorDetail();

  @override
  bool operator ==(Object other) {
    return other is ProveedorDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$proveedorDetailHash() => r'32b28c64e4aa6a2cdba6c9469bbcfa10a80987aa';

final class ProveedorDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          ProveedorDetail,
          AsyncValue<Proveedor>,
          Proveedor,
          FutureOr<Proveedor>,
          int
        > {
  const ProveedorDetailFamily._()
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

abstract class _$ProveedorDetail extends $AsyncNotifier<Proveedor> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<Proveedor> build(int id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Proveedor>, Proveedor>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Proveedor>, Proveedor>,
              AsyncValue<Proveedor>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
