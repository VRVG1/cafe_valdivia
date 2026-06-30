// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receta_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecetaProvider)
final recetaProviderProvider = RecetaProviderProvider._();

final class RecetaProviderProvider
    extends $AsyncNotifierProvider<RecetaProvider, List<Receta>> {
  RecetaProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recetaProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recetaProviderHash();

  @$internal
  @override
  RecetaProvider create() => RecetaProvider();
}

String _$recetaProviderHash() => r'79f9718676deb7e1e7e58ee4cff830331e12d705';

abstract class _$RecetaProvider extends $AsyncNotifier<List<Receta>> {
  FutureOr<List<Receta>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Receta>>, List<Receta>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Receta>>, List<Receta>>,
              AsyncValue<List<Receta>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(recetaDetail)
final recetaDetailProvider = RecetaDetailFamily._();

final class RecetaDetailProvider
    extends $FunctionalProvider<AsyncValue<Receta>, Receta, FutureOr<Receta>>
    with $FutureModifier<Receta>, $FutureProvider<Receta> {
  RecetaDetailProvider._({
    required RecetaDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'recetaDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recetaDetailHash();

  @override
  String toString() {
    return r'recetaDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Receta> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Receta> create(Ref ref) {
    final argument = this.argument as int;
    return recetaDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RecetaDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recetaDetailHash() => r'58f1fdcdf2aaa6aacfe85257f70b40ce1ce46101';

final class RecetaDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Receta>, int> {
  RecetaDetailFamily._()
    : super(
        retry: null,
        name: r'recetaDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecetaDetailProvider call(int id) =>
      RecetaDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'recetaDetailProvider';
}

@ProviderFor(recetaDetalles)
final recetaDetallesProvider = RecetaDetallesFamily._();

final class RecetaDetallesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<RecetaDetalle>>,
          List<RecetaDetalle>,
          FutureOr<List<RecetaDetalle>>
        >
    with
        $FutureModifier<List<RecetaDetalle>>,
        $FutureProvider<List<RecetaDetalle>> {
  RecetaDetallesProvider._({
    required RecetaDetallesFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'recetaDetallesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recetaDetallesHash();

  @override
  String toString() {
    return r'recetaDetallesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<RecetaDetalle>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<RecetaDetalle>> create(Ref ref) {
    final argument = this.argument as int;
    return recetaDetalles(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RecetaDetallesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recetaDetallesHash() => r'9d1209db39dcdb753d6ef358756fee921e7a6ea3';

final class RecetaDetallesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<RecetaDetalle>>, int> {
  RecetaDetallesFamily._()
    : super(
        retry: null,
        name: r'recetaDetallesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RecetaDetallesProvider call(int recetaId) =>
      RecetaDetallesProvider._(argument: recetaId, from: this);

  @override
  String toString() => r'recetaDetallesProvider';
}
