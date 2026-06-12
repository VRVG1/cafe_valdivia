import 'package:flutter_riverpod/flutter_riverpod.dart';

class DebugState {
  final bool enabled;
  final Map<String, String> errors;

  const DebugState({this.enabled = false, this.errors = const {}});

  DebugState copyWith({bool? enabled, Map<String, String>? errors}) {
    return DebugState(
      enabled: enabled ?? this.enabled,
      errors: errors ?? this.errors,
    );
  }

  bool shouldFail(String pageName) => enabled && errors.containsKey(pageName);

  Set<String> get pagesWithErrors => errors.keys.toSet();
}

class DebugStateNotifier extends Notifier<DebugState> {
  @override
  DebugState build() => const DebugState();

  void toggle() => state = state.copyWith(enabled: !state.enabled);

  void forceError(String pageName, String message) {
    state = state.copyWith(
      errors: {...state.errors, pageName: message},
    );
  }

  void clearError(String pageName) {
    final updated = Map<String, String>.from(state.errors);
    updated.remove(pageName);
    state = state.copyWith(errors: updated);
  }

  void clearAll() => state = state.copyWith(errors: {});
}

final debugStateProvider =
    NotifierProvider<DebugStateNotifier, DebugState>(DebugStateNotifier.new);
