// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimiento_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Resumen mensual de ventas y compras para la gráfica del Home.
///
/// Devuelve los 12 meses del año [anio]; los meses sin movimientos vienen en
/// cero, incluidos los meses futuros del año en curso.

@ProviderFor(movimientoMensual)
final movimientoMensualProvider = MovimientoMensualFamily._();

/// Resumen mensual de ventas y compras para la gráfica del Home.
///
/// Devuelve los 12 meses del año [anio]; los meses sin movimientos vienen en
/// cero, incluidos los meses futuros del año en curso.

final class MovimientoMensualProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Map<String, dynamic>>>,
          List<Map<String, dynamic>>,
          FutureOr<List<Map<String, dynamic>>>
        >
    with
        $FutureModifier<List<Map<String, dynamic>>>,
        $FutureProvider<List<Map<String, dynamic>>> {
  /// Resumen mensual de ventas y compras para la gráfica del Home.
  ///
  /// Devuelve los 12 meses del año [anio]; los meses sin movimientos vienen en
  /// cero, incluidos los meses futuros del año en curso.
  MovimientoMensualProvider._({
    required MovimientoMensualFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'movimientoMensualProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movimientoMensualHash();

  @override
  String toString() {
    return r'movimientoMensualProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Map<String, dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Map<String, dynamic>>> create(Ref ref) {
    final argument = this.argument as int;
    return movimientoMensual(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MovimientoMensualProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movimientoMensualHash() => r'599cdb74221585b9a1ae20710ae7be7e1e0c918e';

/// Resumen mensual de ventas y compras para la gráfica del Home.
///
/// Devuelve los 12 meses del año [anio]; los meses sin movimientos vienen en
/// cero, incluidos los meses futuros del año en curso.

final class MovimientoMensualFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Map<String, dynamic>>>, int> {
  MovimientoMensualFamily._()
    : super(
        retry: null,
        name: r'movimientoMensualProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Resumen mensual de ventas y compras para la gráfica del Home.
  ///
  /// Devuelve los 12 meses del año [anio]; los meses sin movimientos vienen en
  /// cero, incluidos los meses futuros del año en curso.

  MovimientoMensualProvider call(int anio) =>
      MovimientoMensualProvider._(argument: anio, from: this);

  @override
  String toString() => r'movimientoMensualProvider';
}
