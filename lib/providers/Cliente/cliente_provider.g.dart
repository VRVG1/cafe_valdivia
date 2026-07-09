// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ClienteNotifier)
final clienteProvider = ClienteNotifierProvider._();

final class ClienteNotifierProvider
    extends
        $AsyncNotifierProvider<ClienteNotifier, List<Map<String, dynamic>>> {
  ClienteNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clienteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clienteNotifierHash();

  @$internal
  @override
  ClienteNotifier create() => ClienteNotifier();
}

String _$clienteNotifierHash() => r'bf3bc874be4b8fe0f2250a15dd340c0d9f8b7ff2';

abstract class _$ClienteNotifier
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

@ProviderFor(ClienteDetail)
final clienteDetailProvider = ClienteDetailFamily._();

final class ClienteDetailProvider
    extends $AsyncNotifierProvider<ClienteDetail, Cliente> {
  ClienteDetailProvider._({
    required ClienteDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'clienteDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$clienteDetailHash();

  @override
  String toString() {
    return r'clienteDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ClienteDetail create() => ClienteDetail();

  @override
  bool operator ==(Object other) {
    return other is ClienteDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$clienteDetailHash() => r'0c0a6d79c533d8359126a701d9bee8e816322dad';

final class ClienteDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          ClienteDetail,
          AsyncValue<Cliente>,
          Cliente,
          FutureOr<Cliente>,
          int
        > {
  ClienteDetailFamily._()
    : super(
        retry: null,
        name: r'clienteDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ClienteDetailProvider call(int id) =>
      ClienteDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'clienteDetailProvider';
}

abstract class _$ClienteDetail extends $AsyncNotifier<Cliente> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<Cliente> build(int id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Cliente>, Cliente>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Cliente>, Cliente>,
              AsyncValue<Cliente>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(clienteKilos)
final clienteKilosProvider = ClienteKilosFamily._();

final class ClienteKilosProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, dynamic>?>,
          Map<String, dynamic>?,
          FutureOr<Map<String, dynamic>?>
        >
    with
        $FutureModifier<Map<String, dynamic>?>,
        $FutureProvider<Map<String, dynamic>?> {
  ClienteKilosProvider._({
    required ClienteKilosFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'clienteKilosProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$clienteKilosHash();

  @override
  String toString() {
    return r'clienteKilosProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Map<String, dynamic>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, dynamic>?> create(Ref ref) {
    final argument = this.argument as int;
    return clienteKilos(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ClienteKilosProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$clienteKilosHash() => r'1f689769c1be2bbe5886287799ab48e8a47fcba3';

final class ClienteKilosFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Map<String, dynamic>?>, int> {
  ClienteKilosFamily._()
    : super(
        retry: null,
        name: r'clienteKilosProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ClienteKilosProvider call(int id) =>
      ClienteKilosProvider._(argument: id, from: this);

  @override
  String toString() => r'clienteKilosProvider';
}

@ProviderFor(clientesWithKilosFiltrados)
final clientesWithKilosFiltradosProvider =
    ClientesWithKilosFiltradosProvider._();

final class ClientesWithKilosFiltradosProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Map<String, dynamic>>>,
          List<Map<String, dynamic>>,
          FutureOr<List<Map<String, dynamic>>>
        >
    with
        $FutureModifier<List<Map<String, dynamic>>>,
        $FutureProvider<List<Map<String, dynamic>>> {
  ClientesWithKilosFiltradosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clientesWithKilosFiltradosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clientesWithKilosFiltradosHash();

  @$internal
  @override
  $FutureProviderElement<List<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Map<String, dynamic>>> create(Ref ref) {
    return clientesWithKilosFiltrados(ref);
  }
}

String _$clientesWithKilosFiltradosHash() =>
    r'0169c1979243ccf2079c344ce6632ce71375776f';

@ProviderFor(clientesFiltrados)
final clientesFiltradosProvider = ClientesFiltradosProvider._();

final class ClientesFiltradosProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Cliente>>,
          List<Cliente>,
          FutureOr<List<Cliente>>
        >
    with $FutureModifier<List<Cliente>>, $FutureProvider<List<Cliente>> {
  ClientesFiltradosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clientesFiltradosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clientesFiltradosHash();

  @$internal
  @override
  $FutureProviderElement<List<Cliente>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Cliente>> create(Ref ref) {
    return clientesFiltrados(ref);
  }
}

String _$clientesFiltradosHash() => r'1dbbf4615d4af1e502ddccda5028df159e84eea6';
