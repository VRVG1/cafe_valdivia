import 'package:cafe_valdivia/Components/componente_row.dart';
import 'package:cafe_valdivia/Components/error_view.dart';
import 'package:cafe_valdivia/Components/loading_view.dart';
import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Card que representa un componente individual dentro del formulario
/// de receta (agregar o editar).
///
/// Muestra un encabezado con el número de componente y un botón de
/// eliminación, seguido de:
/// - Dropdown de artículo (con carga asíncrona)
/// - Fila de cantidad + unidad de medida
///
/// ## Parámetros
/// - [index]: Posición del componente en la lista (0-indexed).
/// - [componente]: Modelo de datos del componente.
/// - [asyncInsumos]: AsyncValue con la lista de artículos disponibles.
/// - [asyncUms]: AsyncValue con la lista de unidades de medida.
/// - [onRemove]: Callback invocado al presionar el botón de eliminar.
/// - [onArticuloChanged]: Callback invocado al cambiar el artículo seleccionado.
/// - [onUnidadChanged]: Callback invocado al cambiar la unidad seleccionada.
/// - [onCantidadChanged]: Callback invocado al modificar la cantidad (opcional).
/// - [isLoading]: Si es `true`, deshabilita los campos de entrada.
/// - [showCaritaInsumo]: Si es `true`, muestra el ícono de carita en el
///   error del dropdown de artículo. Por defecto `false`.
/// - [loadingWidget]: Widget mostrado durante la carga de datos asíncronos.
///   Por defecto [SkeletonDropMenu].
///
/// ```dart
/// ComponenteCard(
///   index: 0,
///   componente: componente,
///   asyncInsumos: asyncInsumos,
///   asyncUms: asyncUms,
///   onRemove: () => removerComponente(...),
///   onArticuloChanged: (a) => setState(() => componente.articulo = a),
///   onUnidadChanged: (u) => setState(() => componente.unidad = u),
///   onCantidadChanged: () => _calcularCostoEstimado(),
///   isLoading: _isLoading,
/// )
/// ```
class ComponenteCard extends StatelessWidget {
  const ComponenteCard({
    super.key,
    required this.index,
    required this.componente,
    required this.asyncInsumos,
    required this.asyncUms,
    required this.onRemove,
    required this.onArticuloChanged,
    required this.onUnidadChanged,
    this.onCantidadChanged,
    this.isLoading = false,
    this.showCaritaInsumo = false,
    this.loadingWidget = const SkeletonDropMenu(),
  });

  /// Posición del componente en la lista (0-indexed), utilizada
  /// para mostrar "Componente N".
  final int index;

  /// Modelo de datos del componente con artículo, unidad y cantidad.
  final ComponenteRow componente;

  /// AsyncValue con la lista de artículos (insumos) disponibles
  /// para el dropdown.
  final AsyncValue<List<Articulo>> asyncInsumos;

  /// AsyncValue con la lista de unidades de medida disponibles
  /// para el dropdown.
  final AsyncValue<List<UnidadMedida>> asyncUms;

  /// Callback invocado al presionar el botón de eliminar componente.
  final VoidCallback onRemove;

  /// Callback invocado al seleccionar un artículo en el dropdown.
  final ValueChanged<Articulo?> onArticuloChanged;

  /// Callback invocado al seleccionar una unidad de medida en el dropdown.
  final ValueChanged<UnidadMedida?> onUnidadChanged;

  /// Callback invocado al modificar el campo de cantidad.
  /// Si es `null`, el campo de cantidad no ejecuta acción adicional
  /// al cambiar.
  final VoidCallback? onCantidadChanged;

  /// Si es `true`, deshabilita los campos de entrada del componente.
  final bool isLoading;

  /// Si es `true`, muestra el ícono de carita en el error del
  /// dropdown de artículo.
  final bool showCaritaInsumo;

  /// Widget mostrado durante la carga de datos asíncronos de
  /// insumos y unidades de medida.
  final Widget loadingWidget;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.mdCircular,
          side: BorderSide(color: cs.outlineVariant),
        ),
        child: Padding(
          padding: AppPadding.allMd,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Componente ${index + 1}",
                    style: tt.labelLarge?.copyWith(
                      color: cs.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: "Eliminar componente",
                    onPressed: onRemove,
                    icon: Icon(Icons.delete_outline_rounded, color: cs.error),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              asyncInsumos.when(
                data: (insumos) => DropdownMenu<Articulo>(
                  expandedInsets: EdgeInsets.zero,
                  initialSelection: componente.articulo,
                  label: const Text("Artículo"),
                  leadingIcon: const Icon(Icons.inventory_2_rounded),
                  onSelected: onArticuloChanged,
                  dropdownMenuEntries: insumos.map((a) {
                    return DropdownMenuEntry<Articulo>(
                      value: a,
                      label: a.nombre,
                    );
                  }).toList(),
                ),
                error: (e, _) => ErrorRetryField(
                  label: "Artículo",
                  leadingIcon: Icons.inventory_2_rounded,
                  showCarita: showCaritaInsumo,
                  onRetry: () {},
                ),
                loading: () => loadingWidget,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      enabled: !isLoading,
                      controller: componente.cantidadController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Cantidad",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: onCantidadChanged != null
                          ? (_) => onCantidadChanged!()
                          : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 3,
                    child: asyncUms.when(
                      data: (ums) => DropdownMenu<UnidadMedida>(
                        expandedInsets: EdgeInsets.zero,
                        initialSelection: componente.unidad,
                        label: const Text("Unidad"),
                        onSelected: onUnidadChanged,
                        dropdownMenuEntries: ums.map((u) {
                          return DropdownMenuEntry<UnidadMedida>(
                            value: u,
                            label: u.nombre,
                          );
                        }).toList(),
                      ),
                      error: (e, _) => ErrorRetryField(
                        label: "Unidad",
                        leadingIcon: Icons.balance_rounded,
                        showCarita: true,
                        onRetry: () {},
                      ),
                      loading: () => loadingWidget,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
