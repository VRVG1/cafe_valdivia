// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articulo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ArticuloProvider)
final articuloProviderProvider = ArticuloProviderProvider._();

final class ArticuloProviderProvider
    extends $AsyncNotifierProvider<ArticuloProvider, List<Articulo>> {
  ArticuloProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'articuloProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$articuloProviderHash();

  @$internal
  @override
  ArticuloProvider create() => ArticuloProvider();
}

String _$articuloProviderHash() => r'8fd8452cb67ab3a274763db6667330033b814581';

abstract class _$ArticuloProvider extends $AsyncNotifier<List<Articulo>> {
  FutureOr<List<Articulo>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Articulo>>, List<Articulo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Articulo>>, List<Articulo>>,
              AsyncValue<List<Articulo>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(articuloDetail)
final articuloDetailProvider = ArticuloDetailFamily._();

final class ArticuloDetailProvider
    extends
        $FunctionalProvider<AsyncValue<Articulo>, Articulo, FutureOr<Articulo>>
    with $FutureModifier<Articulo>, $FutureProvider<Articulo> {
  ArticuloDetailProvider._({
    required ArticuloDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'articuloDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$articuloDetailHash();

  @override
  String toString() {
    return r'articuloDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Articulo> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Articulo> create(Ref ref) {
    final argument = this.argument as int;
    return articuloDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticuloDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$articuloDetailHash() => r'735d6cf27eea2914d8fde93c22307405f696281c';

final class ArticuloDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Articulo>, int> {
  ArticuloDetailFamily._()
    : super(
        retry: null,
        name: r'articuloDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ArticuloDetailProvider call(int id) =>
      ArticuloDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'articuloDetailProvider';
}

@ProviderFor(articulosFiltrados)
final articulosFiltradosProvider = ArticulosFiltradosProvider._();

final class ArticulosFiltradosProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Articulo>>,
          List<Articulo>,
          FutureOr<List<Articulo>>
        >
    with $FutureModifier<List<Articulo>>, $FutureProvider<List<Articulo>> {
  ArticulosFiltradosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'articulosFiltradosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$articulosFiltradosHash();

  @$internal
  @override
  $FutureProviderElement<List<Articulo>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Articulo>> create(Ref ref) {
    return articulosFiltrados(ref);
  }
}

String _$articulosFiltradosHash() =>
    r'30ac0091e0f4040230bb954330ea4d91d25a3387';

@ProviderFor(productosFiltrados)
final productosFiltradosProvider = ProductosFiltradosProvider._();

final class ProductosFiltradosProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Articulo>>,
          List<Articulo>,
          FutureOr<List<Articulo>>
        >
    with $FutureModifier<List<Articulo>>, $FutureProvider<List<Articulo>> {
  ProductosFiltradosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productosFiltradosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productosFiltradosHash();

  @$internal
  @override
  $FutureProviderElement<List<Articulo>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Articulo>> create(Ref ref) {
    return productosFiltrados(ref);
  }
}

String _$productosFiltradosHash() =>
    r'0ecc1a3589bb196e58b86aca70b895e9a9001e94';

@ProviderFor(productosProvider)
final productosProviderProvider = ProductosProviderProvider._();

final class ProductosProviderProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Articulo>>,
          List<Articulo>,
          FutureOr<List<Articulo>>
        >
    with $FutureModifier<List<Articulo>>, $FutureProvider<List<Articulo>> {
  ProductosProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productosProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productosProviderHash();

  @$internal
  @override
  $FutureProviderElement<List<Articulo>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Articulo>> create(Ref ref) {
    return productosProvider(ref);
  }
}

String _$productosProviderHash() => r'b6c7baf32959f5eaa59b9254ca3922bc1c788c3a';
