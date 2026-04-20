// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compra_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompraNotifier)
final compraProvider = CompraNotifierProvider._();

final class CompraNotifierProvider
    extends $AsyncNotifierProvider<CompraNotifier, List<Map<String, dynamic>>> {
  CompraNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'compraProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$compraNotifierHash();

  @$internal
  @override
  CompraNotifier create() => CompraNotifier();
}

String _$compraNotifierHash() => r'e473df2db99ef690cd4b3a9d0dd6af8d3c9f668a';

abstract class _$CompraNotifier
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
