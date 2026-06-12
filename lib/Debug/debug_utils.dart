import 'package:cafe_valdivia/Debug/debug_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

AsyncValue<T> debugOverride<T>(
  WidgetRef ref,
  String pageName,
  AsyncValue<T> actual,
) {
  final debug = ref.watch(debugStateProvider);
  if (debug.shouldFail(pageName)) {
    return AsyncValue.error(
      Exception('${debug.errors[pageName] ?? "Error forzado [$pageName]"}'),
      StackTrace.current,
    );
  }
  return actual;
}
