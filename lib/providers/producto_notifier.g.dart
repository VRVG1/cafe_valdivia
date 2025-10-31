// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductoNotifier)
const productoProvider = ProductoNotifierProvider._();

final class ProductoNotifierProvider
    extends $AsyncNotifierProvider<ProductoNotifier, List<Producto>> {
  const ProductoNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productoNotifierHash();

  @$internal
  @override
  ProductoNotifier create() => ProductoNotifier();
}

String _$productoNotifierHash() => r'5d7d4bafe035557fde37f95d929160ed37f6d3be';

abstract class _$ProductoNotifier extends $AsyncNotifier<List<Producto>> {
  FutureOr<List<Producto>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Producto>>, List<Producto>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Producto>>, List<Producto>>,
              AsyncValue<List<Producto>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
