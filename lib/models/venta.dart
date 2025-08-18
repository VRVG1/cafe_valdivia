import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/models/cliente.dart';
import 'package:cafe_valdivia/models/detalle_venta.dart';

enum VentaEstado {
  completa('Completa'),
  anulada('Anulada');

  final String value;
  const VentaEstado(this.value);

  factory VentaEstado.fromValue(String value) {
    return VentaEstado.values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw ArgumentError('Estado de venta desconocido: $value'),
    );
  }
}

class Venta implements BaseModel {
  @override
  int? id;
  final int idCliente;
  final DateTime fecha;
  final String? detalles;
  final bool pagado;
  final VentaEstado estado;
  Cliente? cliente; // Relacion cargada
  List<DetalleVenta> detallesVenta = []; // Relacion cargada

  Venta({
    this.id,
    required this.idCliente,
    required this.fecha,
    this.detalles,
    this.pagado = false,
    this.estado = VentaEstado.completa,
    this.cliente,
    List<DetalleVenta>? detallesVenta,
  }) : detallesVenta = detallesVenta ?? [];

  double get total => detallesVenta.fold(
    0,
    (sum, detalle) => sum + (detalle.cantidad * detalle.precioUnitarioVenta),
  );

  // Convertir un Cliente a un Map para insertarlo en la BD.
  @override
  Map<String, dynamic> toMap() {
    return {
      'id_venta': id,
      'id_cliente': idCliente,
      'fecha': fecha.toIso8601String(),
      'detalles': detalles,
      'pagado': pagado ? 1 : 0,
      'estado': estado.value,
    };
  }

  factory Venta.fromMap(Map<String, dynamic> map) {
    return Venta(
      id: map['id_venta'],
      idCliente: map['id_cliente'],
      fecha: DateTime.parse(map['fecha']), // Parsear String a DateTime
      detalles: map['detalles'],
      pagado: map['pagado'] == 1, // Convertir int a bool
      estado: VentaEstado.fromValue(
        map['estado'] ?? VentaEstado.completa.value,
      ),
    );
  }
}
