import 'package:flutter/material.dart';

/// Colores fijos de los niveles de stock.
///
/// Se usan para identificar el estado de un vistazo: verde cuando el nivel es
/// bueno, amarillo cuando hay poco stock y rojo cuando es crítico o no hay
/// stock.
abstract final class StockColores {
  static const verde = Color(0xFF2E7D32);
  static const amarillo = Color(0xFFF9A825);
  static const rojo = Color(0xFFC62828);
  static const rojoOscuro = Color(0xFF8E0000);
}

/// Nivel de alerta de stock de un artículo.
///
/// Se calcula a partir del porcentaje de stock que el artículo tiene respecto
/// al stock máximo manual de su familia (ver `Almacen` en
/// `lib/Pages/Home/almacen.dart`).
enum NivelStock {
  /// Desde 40% del stock máximo manual: se muestra en verde.
  normal,

  /// Entre 20% y 40%: aviso visual amarillo de poco stock.
  advertencia,

  /// Menos del 20%: aviso visual rojo grave.
  critico,

  /// Sin stock: aviso visual rojo oscuro de peligro.
  sinStock;

  /// True cuando el nivel requiere algún tipo de aviso en pantalla.
  bool get requiereAviso => this != NivelStock.normal;

  /// Color de fondo del badge de cantidad.
  Color colorBadge(ColorScheme cs) {
    switch (this) {
      case NivelStock.normal:
        return StockColores.verde;
      case NivelStock.advertencia:
        return StockColores.amarillo;
      case NivelStock.critico:
        return StockColores.rojo;
      case NivelStock.sinStock:
        return StockColores.rojoOscuro;
    }
  }

  /// Color del texto del badge de cantidad.
  Color colorTextoBadge(ColorScheme cs) {
    switch (this) {
      case NivelStock.normal:
        return Colors.white;
      case NivelStock.advertencia:
        return Colors.black87;
      case NivelStock.critico:
        return Colors.white;
      case NivelStock.sinStock:
        return Colors.white;
    }
  }

  /// Tinte de fondo de la fila.
  Color? colorFila(ColorScheme cs) {
    switch (this) {
      case NivelStock.normal:
        return StockColores.verde.withValues(alpha: 0.12);
      case NivelStock.advertencia:
        return StockColores.amarillo.withValues(alpha: 0.22);
      case NivelStock.critico:
        return StockColores.rojo.withValues(alpha: 0.18);
      case NivelStock.sinStock:
        return StockColores.rojoOscuro.withValues(alpha: 0.16);
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
        return StockColores.verde;
      case NivelStock.advertencia:
        return StockColores.amarillo;
      case NivelStock.critico:
        return StockColores.rojo;
      case NivelStock.sinStock:
        return StockColores.rojoOscuro;
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
