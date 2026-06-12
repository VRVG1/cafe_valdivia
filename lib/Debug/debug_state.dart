import 'package:flutter_riverpod/flutter_riverpod.dart';

class DebugState {
  final bool enabled;
  final Set<String> loadings;
  final Map<String, String> errors;

  const DebugState({
    this.enabled = false,
    this.errors = const {},
    this.loadings = const {},
  });

  DebugState copyWith({
    bool? enabled,
    Map<String, String>? errors,
    Set<String>? loadings,
  }) {
    return DebugState(
      enabled: enabled ?? this.enabled,
      errors: errors ?? this.errors,
      loadings: loadings ?? this.loadings,
    );
  }

  bool shouldFail(String pageName) => enabled && errors.containsKey(pageName);
  bool shouldLoad(String pageName) => enabled && loadings.contains(pageName);

  Set<String> get pagesWithErrors => errors.keys.toSet();
}

class DebugStateNotifier extends Notifier<DebugState> {
  @override
  DebugState build() => const DebugState();

  void toggle() => state = state.copyWith(enabled: !state.enabled);

  void forceError(String pageName, String message) {
    state = state.copyWith(errors: {...state.errors, pageName: message});
  }

  void forceLoading(String pageName) {
    state = state.copyWith(loadings: {...state.loadings, pageName});
  }

  void clearError(String pageName) {
    final updated = Map<String, String>.from(state.errors);
    updated.remove(pageName);
    state = state.copyWith(errors: updated);
  }

  void clearLoading(String pageName) {
    final updated = Set<String>.from(state.loadings);
    updated.remove(pageName);
    state = state.copyWith(loadings: updated);
  }

  void clearAll() => state = state.copyWith(errors: {}, loadings: {});
}

final debugStateProvider = NotifierProvider<DebugStateNotifier, DebugState>(
  DebugStateNotifier.new,
);
