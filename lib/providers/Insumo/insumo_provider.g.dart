// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InsumoProvider)
final insumoProviderProvider = InsumoProviderProvider._();

final class InsumoProviderProvider
    extends $AsyncNotifierProvider<InsumoProvider, List<Insumo>> {
  InsumoProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'insumoProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$insumoProviderHash();

  @$internal
  @override
  InsumoProvider create() => InsumoProvider();
}

String _$insumoProviderHash() => r'd2f40ef5a3abb49cfb7747c3065c01520768b0c0';

abstract class _$InsumoProvider extends $AsyncNotifier<List<Insumo>> {
  FutureOr<List<Insumo>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Insumo>>, List<Insumo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Insumo>>, List<Insumo>>,
              AsyncValue<List<Insumo>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(insumoDetail)
final insumoDetailProvider = InsumoDetailFamily._();

final class InsumoDetailProvider
    extends $FunctionalProvider<AsyncValue<Insumo>, Insumo, FutureOr<Insumo>>
    with $FutureModifier<Insumo>, $FutureProvider<Insumo> {
  InsumoDetailProvider._({
    required InsumoDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'insumoDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$insumoDetailHash();

  @override
  String toString() {
    return r'insumoDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Insumo> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Insumo> create(Ref ref) {
    final argument = this.argument as int;
    return insumoDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is InsumoDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$insumoDetailHash() => r'a90bae8c78dedee22ab5bbf50bcaafd82f0e9fb7';

final class InsumoDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Insumo>, int> {
  InsumoDetailFamily._()
    : super(
        retry: null,
        name: r'insumoDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InsumoDetailProvider call(int id) =>
      InsumoDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'insumoDetailProvider';
}
