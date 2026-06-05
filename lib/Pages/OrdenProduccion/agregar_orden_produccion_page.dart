import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/Pages/OrdenProduccion/orden_produccion_seleccion_receta_page.dart';
import 'package:cafe_valdivia/core/models/orden_produccion.dart';
import 'package:cafe_valdivia/core/models/orden_produccion_consumo.dart';
import 'package:cafe_valdivia/core/models/receta.dart';
import 'package:cafe_valdivia/core/models/receta_detalle.dart';
import 'package:cafe_valdivia/providers/Articulo/articulo_provider.dart';
import 'package:cafe_valdivia/providers/OrdenProduccion/orden_produccion_notifier.dart';
import 'package:cafe_valdivia/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgregarOrdenProduccionPage extends ConsumerStatefulWidget {
  const AgregarOrdenProduccionPage({super.key});

  @override
  AgregarOrdenProduccionPageState createState() =>
      AgregarOrdenProduccionPageState();
}

class AgregarOrdenProduccionPageState
    extends ConsumerState<AgregarOrdenProduccionPage> {
  final TextEditingController _cantidadController =
      TextEditingController(text: '1');
  final TextEditingController _notasController = TextEditingController();
  final TextEditingController _recetaController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Receta? _recetaSeleccionada;
  List<RecetaDetalle>? _recetaDetalles;
  bool _isLoading = false;
  bool _cargandoDetalles = false;

  @override
  void dispose() {
    _cantidadController.dispose();
    _notasController.dispose();
    _recetaController.dispose();
    super.dispose();
  }

  Future<void> _seleccionarReceta() async {
    final receta = await Navigator.push<Receta>(
      context,
      MaterialPageRoute(
        builder: (context) => const OrdenProduccionSeleccionRecetaPage(),
      ),
    );

    if (receta == null) return;

    setState(() {
      _recetaSeleccionada = receta;
      _recetaController.text = receta.nombre;
      _recetaDetalles = null;
      _cargandoDetalles = true;
    });

    try {
      final repo = ref.read(recetaRepositoryProvider);
      final detalles = await repo.getRecetaDetalles(receta.idReceta!);
      if (mounted) {
        setState(() {
          _recetaDetalles = detalles;
          _cargandoDetalles = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() => _cargandoDetalles = false);
      }
    }
  }

  Future<void> _guardar() async {
    if (_recetaSeleccionada == null || _recetaDetalles == null) return;
    if (_recetaSeleccionada!.idReceta == null) return;

    final cantidad =
        double.tryParse(_cantidadController.text) ?? 0;
    if (cantidad <= 0) return;

    final insumos = await ref.read(articuloProviderProvider.future);
    final factor = cantidad / _recetaSeleccionada!.cantidad_base;

    double costoTotal = 0;
    final List<OrdenProduccionConsumo> consumos = [];

    for (final detalle in _recetaDetalles!) {
      final cantidadUsada = detalle.cantidad * factor;
      final insumo = insumos.where(
        (a) => a.idArticulo == detalle.idArticulo,
      ).firstOrNull;
      final costoArticulo = insumo?.costoUnitario ?? 0;
      costoTotal += cantidadUsada * costoArticulo;

      consumos.add(
        OrdenProduccionConsumo(
          idOrdenProduccion: 0,
          idArticulo: detalle.idArticulo,
          cantidadUsada: cantidadUsada,
          costoArticuloMomento: costoArticulo,
        ),
      );
    }

    final orden = OrdenProduccion(
      idReceta: _recetaSeleccionada!.idReceta!,
      cantidadProducida: cantidad,
      fecha: DateTime.now(),
      costoTotalProduccion: costoTotal,
      notas: _notasController.text.isNotEmpty
          ? _notasController.text
          : null,
    );

    try {
      await ref
          .read(ordenProduccionProvider.notifier)
          .create(orden, consumos);

      if (!context.mounted) return;

      showCustomSnackBar(
        context: context,
        mensaje: "Orden de producción creada con exito",
      );
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!context.mounted) return;
      showCustomSnackBar(
        context: context,
        mensaje: "Error al crear la orden. Intente de nuevo.",
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nueva Orden de Producción",
          style: tt.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: cs.onPrimaryContainer,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildSaveButton(cs),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Seleccione una receta";
                  }
                  return null;
                },
                readOnly: true,
                controller: _recetaController,
                onTap: _seleccionarReceta,
                decoration: InputDecoration(
                  labelText: "Receta",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.menu_book_rounded),
                  suffixIcon: const Icon(Icons.chevron_right_rounded),
                ),
              ),
              const SizedBox(height: 16),
              if (_recetaSeleccionada != null) ...[
                _buildRecetaInfoCard(cs, tt),
                const SizedBox(height: 16),
              ],
              if (_cargandoDetalles)
                const LinearProgressIndicator(),
              TextFormField(
                enabled: !_isLoading,
                controller: _cantidadController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese la cantidad a producir';
                  }
                  if ((double.tryParse(value) ?? 0) <= 0) {
                    return 'Debe ser mayor a 0';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Cantidad a producir",
                  border: const OutlineInputBorder(),
                  prefixIcon:
                      const Icon(Icons.production_quantity_limits_rounded),
                  suffixText: "unidades",
                ),
              ),
              const SizedBox(height: 16),
              if (_recetaDetalles != null && !_cargandoDetalles)
                _buildCostoEstimado(cs, tt),
              const SizedBox(height: 16),
              TextFormField(
                enabled: !_isLoading,
                controller: _notasController,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Notas (opcional)",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.notes_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecetaInfoCard(ColorScheme cs, TextTheme tt) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline_rounded, color: cs.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _recetaSeleccionada!.nombre,
                  style: tt.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Base: ${_recetaSeleccionada!.cantidad_base} unidades',
                  style: tt.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
                if (_recetaDetalles != null)
                  Text(
                    '${_recetaDetalles!.length} componentes',
                    style: tt.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCostoEstimado(ColorScheme cs, TextTheme tt) {
    final cantidad =
        double.tryParse(_cantidadController.text) ?? 0;
    if (cantidad <= 0) return const SizedBox.shrink();

    final factor = cantidad / _recetaSeleccionada!.cantidad_base;

    return Consumer(
      builder: (context, ref, child) {
        final asyncInsumos = ref.watch(articuloProviderProvider);
        return asyncInsumos.when(
          data: (insumos) {
            double total = 0;
            for (final detalle in _recetaDetalles!) {
              final cantidadUsada = detalle.cantidad * factor;
              final insumo = insumos.where(
                (a) => a.idArticulo == detalle.idArticulo,
              ).firstOrNull;
              total += cantidadUsada * (insumo?.costoUnitario ?? 0);
            }

            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cs.tertiaryContainer.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.calculate_rounded, color: cs.tertiary),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Costo total estimado",
                        style: tt.bodySmall?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        "\$${total.toStringAsFixed(2)}",
                        style: tt.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          error: (_, __) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildSaveButton(ColorScheme cs) {
    return FilledButton(
      onPressed: _isLoading
          ? null
          : () async {
              if (_formKey.currentState?.validate() ?? false) {
                if (_recetaSeleccionada == null) {
                  showCustomSnackBar(
                    context: context,
                    mensaje: "Seleccione una receta",
                    isError: true,
                  );
                  return;
                }
                setState(() => _isLoading = true);
                try {
                  await _guardar();
                } finally {
                  if (context.mounted) {
                    setState(() => _isLoading = false);
                  }
                }
              }
            },
      child: _isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: cs.onSecondaryContainer,
                strokeWidth: 2,
              ),
            )
          : const Text("Guardar"),
    );
  }
}
