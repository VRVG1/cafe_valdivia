// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
