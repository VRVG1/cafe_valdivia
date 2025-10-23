// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductoDetail)
const productoDetailProvider = ProductoDetailFamily._();

final class ProductoDetailProvider
    extends $AsyncNotifierProvider<ProductoDetail, Producto> {
  const ProductoDetailProvider._({
    required ProductoDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'productoDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productoDetailHash();

  @override
  String toString() {
    return r'productoDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProductoDetail create() => ProductoDetail();

  @override
  bool operator ==(Object other) {
    return other is ProductoDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productoDetailHash() => r'2c96d9e606ea1c9c5abd7ab4208e61adaacc01d8';

final class ProductoDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductoDetail,
          AsyncValue<Producto>,
          Producto,
          FutureOr<Producto>,
          int
        > {
  const ProductoDetailFamily._()
    : super(
        retry: null,
        name: r'productoDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductoDetailProvider call(int id) =>
      ProductoDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'productoDetailProvider';
}

abstract class _$ProductoDetail extends $AsyncNotifier<Producto> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<Producto> build(int id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<Producto>, Producto>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Producto>, Producto>,
              AsyncValue<Producto>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
