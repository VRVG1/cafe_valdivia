// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
