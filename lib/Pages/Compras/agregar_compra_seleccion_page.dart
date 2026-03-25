import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SeleccionPaginaEstado { loading, error, empty, data }

abstract class AgregarCompraSeleccionPage<T> extends ConsumerStatefulWidget {
  final AsyncValue<List<T>> asyncData;
  final Provider<T> provider;

  //Controller
  final ScrollController? controller;

  //Widgets
  final Widget Function(T element)? subtitleBuilder;
  final Widget Function(T element)? leadingBuilder;
  final Widget Function(T element)? trailingBuilder;
  final Key Function(T element)? keyBuilder;
  final Widget? footer;
  final Widget? header;

  // Functions
  final void Function(T element)? onTapCallback;
  final Future<bool?> Function(T element)? onEditDismissed;
  final Future<bool?> Function(T element)? onDeleteDismissed;

  final Duration transitionDuration;
  final Duration reverseTransitionDuration;

  const AgregarCompraSeleccionPage({
    super.key,
    required this.asyncData,
    required this.provider,
    this.subtitleBuilder,
    this.leadingBuilder,
    this.trailingBuilder,
    this.keyBuilder,
    this.onTapCallback,
    this.onEditDismissed,
    this.onDeleteDismissed,
    this.controller,
    this.footer,
    this.header,
    this.transitionDuration = const Duration(milliseconds: 400),
    this.reverseTransitionDuration = const Duration(milliseconds: 300),
  });

  Widget Function(T element) get titleBuilder;

  String get mensajeVacio;
  String? get mensajeError => null;
  PreferredSizeWidget buildAppBar(BuildContext context, WidgetRef ref);
  Widget? buildEmptyState(BuildContext context, ColorScheme cs) => null;
  Widget? buildErrorState(BuildContext context, Object error, ColorScheme cs) =>
      null;
  Widget? buildLoadingState(BuildContext context, ColorScheme cs) => null;
  void Function()? get onRetry => null;

  @override
  ConsumerState<AgregarCompraSeleccionPage<T>> createState() =>
      _AgregarCompraSeleccionPageState<T>();
}

class _AgregarCompraSeleccionPageState<T>
    extends ConsumerState<AgregarCompraSeleccionPage<T>>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _slideController;
  late final AnimationController _pulseController;

  SeleccionPaginaEstado _currentStatus = SeleccionPaginaEstado.loading;
  SeleccionPaginaEstado? _previousStatus;
  Object? _lastError;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: widget.transitionDuration,
    );
    _slideController = AnimationController(
      vsync: this,
      duration: widget.transitionDuration,
    );
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _updateStatus(widget.asyncData);
  }

  @override
  void didUpdateWidget(covariant AgregarCompraSeleccionPage<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.asyncData != widget.asyncData) {
      _previousStatus = _currentStatus;
      _updateStatus(widget.asyncData);
    }
  }

  void _updateStatus(AsyncValue<List<T>> asyncData) {
    setState(() {
      _currentStatus = asyncData.map(
        data: (data) => data.value.isEmpty
            ? SeleccionPaginaEstado.empty
            : SeleccionPaginaEstado.data,
        loading: (_) => SeleccionPaginaEstado.loading,
        error: (error) {
          _lastError = error.error;
          return SeleccionPaginaEstado.error;
        },
      );
    });

    _fadeController.forward(from: 0);
    _slideController.forward(from: 0);
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ColorScheme cs = theme.colorScheme;

    return Scaffold(
      appBar: widget.buildAppBar(context, ref),
      body: AnimatedSwitcher(
        duration: widget.transitionDuration,
        reverseDuration: widget.reverseTransitionDuration,
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (child, animation) {
          return _buildTransition(
            child,
            animation,
            _previousStatus,
            _currentStatus,
          );
        },
        child: _buildContentForStatus(cs, theme),
      ),
    );
  }

  Widget _buildTransition(
    Widget child,
    Animation<double> animation,
    SeleccionPaginaEstado? from,
    SeleccionPaginaEstado to,
  ) {
    final isLoadingToData =
        from == SeleccionPaginaEstado.loading &&
        to == SeleccionPaginaEstado.data;
    final isErrorToLoading =
        from == SeleccionPaginaEstado.error &&
        to == SeleccionPaginaEstado.loading;

    if (isLoadingToData) {
      // Fade + Scale para carga a datos
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.95, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
          ),
          child: child,
        ),
      );
    }

    if (isErrorToLoading) {
      // Slide up para error a carga
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(animation),
        child: FadeTransition(opacity: animation, child: child),
      );
    }
    final slideAnimation = Tween<Offset>(
      begin: const Offset(0.05, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic));
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(position: slideAnimation, child: child),
    );
  }

  Widget _buildContentForStatus(ColorScheme cs, ThemeData theme) {
    switch (_currentStatus) {
      case SeleccionPaginaEstado.loading:
        return _buildLoadingState(cs);
      case SeleccionPaginaEstado.error:
        return _buildErrorState(cs);
      case SeleccionPaginaEstado.data:
        return _buildDataState();
      case SeleccionPaginaEstado.empty:
        return _buildEmptyState(cs);
    }
  }

  Widget _buildLoadingState(ColorScheme cs) {
    final customLoading = widget.buildLoadingState(context, cs);
    if (customLoading != null) return customLoading;
    return Center(
      key: const ValueKey('loading'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Transform.scale(
                scale: 1.0 + (_pulseController.value + 0.1),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cs.primaryContainer.withValues(alpha: 0.3),
                  ),
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(cs.primary),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          FadeTransition(
            opacity: _fadeController,
            child: Text(
              "Cargando ...",
              style: TextStyle(
                color: cs.onSurfaceVariant,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(ColorScheme cs) {
    final customError = widget.buildErrorState(context, _lastError!, cs);
    if (customError != null) return customError;

    final canRetry = widget.onRetry != null;

    return Center(
      key: const ValueKey("error"),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 800),
              curve: Curves.elasticOut,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: cs.errorContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.error_outline_rounded,
                      size: 50,
                      color: cs.onErrorContainer,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Text(
              widget.mensajeError ?? 'Ocurrio un error inserperado',
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 8),
            if (_lastError != null)
              Text(
                _lastError.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            const SizedBox(height: 24),
            if (canRetry)
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + (_pulseController.value) + 0.02,
                    child: FilledButton.icon(
                      onPressed: widget.onRetry,
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Reintentar'),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(ColorScheme cs) {
    final customEmpty = widget.buildEmptyState(context, cs);

    if (customEmpty != null) return customEmpty;

    return Center(
      key: const ValueKey("empty"),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _pulseController.value * -8),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerHighest,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.inbox_outlined,
                      size: 60,
                      color: cs.outline,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            _buildStaggeredText(
              widget.mensajeVacio,
              Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: cs.onSurfaceVariant),
              delay: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaggeredText(
    String text,
    TextStyle? style, {
    required int delay,
  }) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 600 + delay),
      tween: Tween(begin: 0, end: 1),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: Text(text, textAlign: TextAlign.center, style: style),
          ),
        );
      },
    );
  }

  Widget _buildDataState() {
    final data = widget.asyncData.value!;

    return ListviewCustom<T>(
      data: data,
      titleBuilder: widget.titleBuilder,
      keyBuilder: widget.keyBuilder ?? _defaultKeyBuilder,
      subtitleBuilder: widget.subtitleBuilder,
      leadingBuilder: widget.leadingBuilder,
      trailingBuilder: widget.trailingBuilder,
      onTapCallback: widget.onTapCallback,
      onDeleteDismissed: widget.onDeleteDismissed,
      onEditDismissed: widget.onEditDismissed,
      header: _buildListHeader(data.length),
    );
  }

  Key _defaultKeyBuilder(T t) {
    return ValueKey(t != null ? 'T-${t.hashCode}' : t.hashCode);
  }

  Widget? _buildListHeader(int count) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4, right: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$count elementos',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
