import 'package:cafe_valdivia/core/models/articulo.dart';
import 'package:cafe_valdivia/core/models/unidad_medida.dart';
import 'package:flutter/material.dart';

/// Modelo de datos que representa una fila de componente dentro del
/// formulario de receta (agregar o editar).
///
/// Contiene el artículo seleccionado, la unidad de medida y la cantidad.
/// Se utiliza como modelo interno en las listas de componentes de una receta.
///
/// ```dart
/// final row = ComponenteRow();
/// row.articulo = articulo;
/// row.unidad = unidadMedida;
/// row.cantidadController.text = "2.5";
/// ```
class ComponenteRow {
  /// Artículo seleccionado para este componente.
  Articulo? articulo;

  /// Unidad de medida seleccionada para este componente.
  UnidadMedida? unidad;

  /// Controlador del campo de cantidad del componente.
  TextEditingController cantidadController = TextEditingController();

  /// Libera los recursos del controlador.
  ///
  /// Debe llamarse cuando el componente se elimina de la lista
  /// para evitar fugas de memoria.
  void dispose() {
    cantidadController.dispose();
  }

  /// Indica si el componente tiene todos los campos obligatorios
  /// completos y válidos.
  ///
  /// Retorna `true` si:
  /// - [articulo] no es nulo
  /// - [unidad] no es nula
  /// - La cantidad es un número mayor a 0
  bool get isValid =>
      articulo != null &&
      unidad != null &&
      (double.tryParse(cantidadController.text) ?? 0) > 0;
}

/// Agrega un nuevo componente vacío a la lista y notifica el cambio
/// de estado.
///
/// [componentes] — lista mutable de [ComponenteRow] a modificar.
/// [setState] — callback de Flutter para notificar reconstrucción del widget.
///   Debe ser `void Function(VoidCallback)` (el `setState` de un [State]).
///
/// ```dart
/// agregarComponente(
///   componentes: _componentes,
///   setState: setState,
/// );
/// ```
void agregarComponente({
  required List<ComponenteRow> componentes,
  required void Function(VoidCallback) setState,
}) {
  setState(() {
    componentes.add(ComponenteRow());
  });
}

/// Remueve el componente en la posición [index] de la lista,
/// liberando sus recursos y notificando el cambio de estado.
///
/// [componentes] — lista mutable de [ComponenteRow] a modificar.
/// [setState] — callback de Flutter para notificar reconstrucción del widget.
///   Debe ser `void Function(VoidCallback)` (el `setState` de un [State]).
///
/// ```dart
/// removerComponente(
///   index: 0,
///   componentes: _componentes,
///   setState: setState,
/// );
/// ```
void removerComponente({
  required int index,
  required List<ComponenteRow> componentes,
  required void Function(VoidCallback) setState,
}) {
  setState(() {
    componentes[index].dispose();
    componentes.removeAt(index);
  });
}
