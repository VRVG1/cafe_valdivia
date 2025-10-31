// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ClienteNotifier)
const clienteProvider = ClienteNotifierProvider._();

final class ClienteNotifierProvider
    extends $AsyncNotifierProvider<ClienteNotifier, List<Cliente>> {
  const ClienteNotifierProvider._()
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

String _$clienteNotifierHash() => r'bc97ee9aa34612b228404a9ba893f4d70507700e';

abstract class _$ClienteNotifier extends $AsyncNotifier<List<Cliente>> {
  FutureOr<List<Cliente>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Cliente>>, List<Cliente>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Cliente>>, List<Cliente>>,
              AsyncValue<List<Cliente>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
