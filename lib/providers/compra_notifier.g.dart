// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compra_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CompraNotifier)
const compraProvider = CompraNotifierProvider._();

final class CompraNotifierProvider
    extends $AsyncNotifierProvider<CompraNotifier, List<Map<String, dynamic>>> {
  const CompraNotifierProvider._()
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

String _$compraNotifierHash() => r'26330291c503a676cbd1a57881c2ab6f7c701311';

abstract class _$CompraNotifier
    extends $AsyncNotifier<List<Map<String, dynamic>>> {
  FutureOr<List<Map<String, dynamic>>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
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
    element.handleValue(ref, created);
  }
}
