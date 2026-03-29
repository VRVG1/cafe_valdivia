import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class AgregarCompraSeleccionPage<T> extends ConsumerStatefulWidget {
  //final AsyncValue<List<T>> asyncData;
  final ProviderListenable<AsyncValue<List<T>>> provider;

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

  const AgregarCompraSeleccionPage({
    super.key,
    //required this.asyncData,
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
  });

  Widget Function(T element) get titleBuilder;
  String get mensajeVacio;
  String? get mensajeError => null;
  PreferredSizeWidget buildAppBar(BuildContext context, WidgetRef ref);
  void Function()? get onRetry => null;

  @override
  ConsumerState<AgregarCompraSeleccionPage<T>> createState() =>
      _AgregarCompraSeleccionPageState<T>();
}

class _AgregarCompraSeleccionPageState<T>
    extends ConsumerState<AgregarCompraSeleccionPage<T>>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextTheme tt = theme.textTheme;
    final ColorScheme cs = theme.colorScheme;
    final asyncData = ref.watch(widget.provider);

    return asyncData.when(
      skipLoadingOnReload: true,
      //skipLoadingOnRefresh: true,
      data: (elements) {
        if (elements.isEmpty) {
          return Scaffold(
            appBar: widget.buildAppBar(context, ref),
            body: _buildEmptyState(cs),
          );
        }
        return Scaffold(
          appBar: widget.buildAppBar(context, ref),
          body: _buildDataState(elements),
        );
      },
      error: (err, stack) {
        return Scaffold(
          appBar: widget.buildAppBar(context, ref),
          body: _buildErrorState(cs, tt, err),
        );
      },
      loading: () {
        return Scaffold(
          appBar: widget.buildAppBar(context, ref),
          body: _buildLoadingState(cs),
        );
      },
    );
  }

  Widget _buildLoadingState(ColorScheme cs) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: cs.primary),
          const SizedBox(height: 24),
          Text("Cargando...", style: TextStyle(color: cs.onSurfaceVariant)),
        ],
      ),
    );
  }

  Widget _buildErrorState(ColorScheme cs, TextTheme tt, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outlined, size: 60, color: cs.error),
            const SizedBox(height: 16),
            Text(
              widget.mensajeError ?? 'Ocurrió un error inesperado',
              textAlign: TextAlign.center,
            ),
            Text(
              error.toString(),
              style: tt.bodySmall,
              textAlign: TextAlign.center,
            ),
            if (widget.onRetry != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: widget.onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Reintentar'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(ColorScheme cs) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 80, color: cs.outline),
          const SizedBox(height: 16),
          Text(
            widget.mensajeVacio,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }

  Widget _buildDataState(List<T> data) {
    return ListviewCustom<T>(
      data: data,
      titleBuilder: widget.titleBuilder,
      keyBuilder: widget.keyBuilder ?? _defaultKeyBuilder,
      subtitleBuilder: widget.subtitleBuilder,
      leadingBuilder: widget.leadingBuilder,
      trailingBuilder: widget.trailingBuilder,
      onTapCallback: (element) {
        if (widget.onTapCallback != null) {
          widget.onTapCallback!(element);
        }
        Navigator.pop(context, element);
      },
      onDeleteDismissed: widget.onDeleteDismissed,
      onEditDismissed: widget.onEditDismissed,
      header: _buildListHeader(data.length),
    );
  }

  Key _defaultKeyBuilder(T t) {
    return ValueKey(t != null ? 'T-${t.hashCode}' : t.hashCode);
  }

  Widget _buildListHeader(int count) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Badge(
        label: Text('$count elementos'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        textColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
