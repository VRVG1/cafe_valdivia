import 'package:flutter/material.dart';

/// Nivel de alerta de stock de un artículo.
///
/// Se calcula a partir del porcentaje de stock que el artículo tiene respecto
/// al máximo de su familia (ver `Almacen` en `lib/Pages/Home/almacen.dart`).
enum NivelStock {
  /// Más del 40% del stock de la familia: se muestra normal.
  normal,

  /// Entre 20% y 40%: aviso visual de poco stock.
  advertencia,

  /// Menos del 20%: aviso visual grave.
  critico,

  /// Sin stock: aviso visual de peligro.
  sinStock;

  /// True cuando el nivel requiere algún tipo de aviso en pantalla.
  bool get requiereAviso => this != NivelStock.normal;

  /// Color de fondo del badge de cantidad.
  Color colorBadge(ColorScheme cs) {
    switch (this) {
      case NivelStock.normal:
        return cs.primaryContainer;
      case NivelStock.advertencia:
        return cs.tertiaryContainer;
      case NivelStock.critico:
        return cs.errorContainer;
      case NivelStock.sinStock:
        return cs.error;
    }
  }

  /// Color del texto del badge de cantidad.
  Color colorTextoBadge(ColorScheme cs) {
    switch (this) {
      case NivelStock.normal:
        return cs.onPrimaryContainer;
      case NivelStock.advertencia:
        return cs.onTertiaryContainer;
      case NivelStock.critico:
        return cs.onErrorContainer;
      case NivelStock.sinStock:
        return cs.onError;
    }
  }

  /// Tinte de fondo de la fila, o null si la fila usa el color alterno normal.
  Color? colorFila(ColorScheme cs) {
    switch (this) {
      case NivelStock.normal:
        return null;
      case NivelStock.advertencia:
        return cs.tertiaryContainer.withValues(alpha: 0.30);
      case NivelStock.critico:
        return cs.errorContainer.withValues(alpha: 0.38);
      case NivelStock.sinStock:
        return cs.error.withValues(alpha: 0.14);
    }
  }

  /// Icono de alerta que se muestra junto al nombre del artículo.
  IconData? icono(ColorScheme cs) {
    switch (this) {
      case NivelStock.normal:
        return null;
      case NivelStock.advertencia:
        return Icons.warning_amber_rounded;
      case NivelStock.critico:
        return Icons.error_outline_rounded;
      case NivelStock.sinStock:
        return Icons.production_quantity_limits_rounded;
    }
  }

  /// Color del icono de alerta.
  Color colorIcono(ColorScheme cs) {
    switch (this) {
      case NivelStock.normal:
        return cs.onSurfaceVariant;
      case NivelStock.advertencia:
        return cs.tertiary;
      case NivelStock.critico:
        return cs.error;
      case NivelStock.sinStock:
        return cs.error;
    }
  }

  /// Texto corto que resume el estado del artículo.
  String get etiqueta {
    switch (this) {
      case NivelStock.normal:
        return 'Stock normal';
      case NivelStock.advertencia:
        return 'Poco stock';
      case NivelStock.critico:
        return 'Stock crítico';
      case NivelStock.sinStock:
        return 'Sin stock';
    }
  }
}
