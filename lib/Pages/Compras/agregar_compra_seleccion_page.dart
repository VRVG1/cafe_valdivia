import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/listview_custom.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/Debug/debug_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class AgregarCompraSeleccionPage<T> extends ConsumerStatefulWidget {
  //final AsyncValue<List<T>> asyncData;
  final ProviderListenable<AsyncValue<List<T>>> provider;
  final Widget addElement;

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
    required this.provider,
    required this.addElement,
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
    final asyncData = debugOverride(
      ref,
      'seleccion_compra',
      ref.watch(widget.provider),
    );

    return asyncData.when(
      //skipLoadingOnReload: true,
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
          floatingActionButton: FloatingActionButton(
            tooltip: "Agregar",
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => widget.addElement,
                ),
              );
              if (result != null && context.mounted) {
                Navigator.pop(context, result);
              }
            },
            child: const Icon(Icons.add_rounded),
          ),
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
          appBar: SkeletonAppBar(chipsCount: 3),
          body: SkeletonListTiles(),
        );
      },
    );
  }

  Widget _buildErrorState(ColorScheme cs, TextTheme tt, Object error) {
    return ErrorView(
      message: widget.mensajeError ?? 'Ocurrió un error inesperado',
      description: error.toString(),
      onRetry: widget.onRetry,
    );
  }

  Widget _buildEmptyState(ColorScheme cs) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_rounded, size: 80, color: cs.outline),
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
