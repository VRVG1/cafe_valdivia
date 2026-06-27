import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/core/models/orden_produccion.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:cafe_valdivia/providers/OrdenProduccion/orden_produccion_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditarOrdenProduccionPage extends ConsumerStatefulWidget {
  final OrdenProduccion orden;

  const EditarOrdenProduccionPage({super.key, required this.orden});

  @override
  EditarOrdenProduccionPageState createState() =>
      EditarOrdenProduccionPageState();
}

class EditarOrdenProduccionPageState
    extends ConsumerState<EditarOrdenProduccionPage> {
  late final TextEditingController _notasController;
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _notasController = TextEditingController(text: widget.orden.notas ?? '');
  }

  @override
  void dispose() {
    _notasController.dispose();
    super.dispose();
  }

  Future<void> _guardar() async {
    final ordenActualizada = widget.orden.copyWith(
      notas: _notasController.text.isNotEmpty ? _notasController.text : null,
    );

    try {
      await ref
          .read(ordenProduccionProvider.notifier)
          .updateElement(ordenActualizada);

      if (!context.mounted) return;

      ref.invalidate(
        ordenProduccionDetalladaProvider(widget.orden.idOrdenProduccion!),
      );

      showCustomSnackBar(
        context: context,
        mensaje: "Orden actualizada con exito",
      );
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!context.mounted) return;
      showCustomSnackBar(
        context: context,
        mensaje: "Error al actualizar la orden. Intente de nuevo.",
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
          "Editar Orden de Producción",
          style: tt.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: cs.onPrimaryContainer,
          ),
        ),
        leading: IconButton(
          tooltip: "Cerrar",
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
        actions: [
          Padding(
            padding: AppPadding.hMd,
            child: FilledButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                      if (_formKey.currentState?.validate() ?? false) {
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
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: AppPadding.formPage,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: AppPadding.allMd,
                decoration: BoxDecoration(
                  color: cs.surfaceContainerHighest,
                  borderRadius: AppRadius.mdCircular,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Información actual",
                      style: tt.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: cs.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildInfoRow(
                      "ID",
                      "#${widget.orden.idOrdenProduccion}",
                      cs,
                      tt,
                    ),
                    _buildInfoRow(
                      "Cantidad producida",
                      "${widget.orden.cantidadProducida} unidades",
                      cs,
                      tt,
                    ),
                    _buildInfoRow(
                      "Costo total",
                      "\$${widget.orden.costoTotalProduccion.toStringAsFixed(2)}",
                      cs,
                      tt,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                enabled: !_isLoading,
                controller: _notasController,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: "Notas",
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

  Widget _buildInfoRow(String label, String value, ColorScheme cs, TextTheme tt) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
