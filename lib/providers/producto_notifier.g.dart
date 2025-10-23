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

String _$productoNotifierHash() => r'aac5575b16624d98e9f0e633d8f788d6b0223ea1';

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
