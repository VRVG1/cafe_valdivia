import 'package:cafe_valdivia/Components/appbar_chips.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SeleccionPaginaEstado { loading, error, empty, data }

abstract class AgregarCompraSeleccionPage<T> extends ConsumerWidget {
  final AsyncValue<List<T>> asyncData;
  final Provider<T> provider;

  //Controller
  final ScrollController? controller;

  //Widgets
  final Widget Function(T element) titleBuilder;
  final Widget? Function(T element)? subtitleBuilder;
  final Widget Function(T element)? leadingBuilder;
  final Widget Function(T element)? trailingBuilder;
  final Key Function(T element) keyBuilder;
  final Widget? footer;
  final Widget? header;

  // Functions
  final void Function(T element)? onTapCallback;
  final Future<bool?> Function(T element)? onEditDismissed;
  final Future<bool?> Function(T element)? onDeleteDismissed;

  final Duration transitionDuration;
  final Duration reveseTransitionDuration;

  const AgregarCompraSeleccionPage({
    super.key,
    required this.asyncData,
    required this.provider,
    required this.titleBuilder,
    this.subtitleBuilder,
    this.leadingBuilder,
    this.trailingBuilder,
    required this.keyBuilder,
    this.onTapCallback,
    this.onEditDismissed,
    this.onDeleteDismissed,
    this.controller,
    this.footer,
    this.header,
    this.transitionDuration = const Duration(milliseconds: 400),
    this.reveseTransitionDuration = const Duration(milliseconds: 300),
  });

  String get mensajeVacio;
  String? get mensajeError => null;
  PreferredSizeWidget buildAppBar(BuildContext context, WidgetRef ref);
  Widget? buildEmptyState(BuildContext context, ColorScheme cs) => null;
  Widget? buildErrorState(BuildContext context, Object error, ColorScheme cs) =>
      null;
  Widget? buildLoadingState(BuildContext context, ColorScheme cs) => null;
  void Function()? get onRetry => null;

  @override
  ConsumerState<AgregarCompraSeleccionPage<T>> consumerState() =>
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
      duration: Duration(milliseconds: 1500),
    );

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
        reverseDuration: widget.reveseTransitionDuration,
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
        //child: _buildContentForStatus(cs, theme),
        child: Text("Hola"),
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

  Widget _buildContentFroStatus(ColorScheme cs, ThemeData theme) {
    switch (_currentStatus) {
      case SeleccionPaginaEstado.loading:
        return Text("text");
      case SeleccionPaginaEstado.error:
        return Text("text");
      case SeleccionPaginaEstado.data:
        return Text("text");
      case SeleccionPaginaEstado.empty:
        return Text("Text");
    }
  }
}
