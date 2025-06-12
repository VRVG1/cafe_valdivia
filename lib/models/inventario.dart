import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/models/insumos.dart';

class Inventario implements BaseModel {
  final int idInsumol;
  final double stock;
  Insumos? insumo;

  Inventario({required this.idInsumol, required this.stock, this.insumo});

  @override
  int? get id => null;

  @override
  set id(int? value) {
    if (value != null) {
      throw UnimplementedError('Inventario no tiene un ID modifiable');
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return {'idInsumol': idInsumol, 'stock': stock};
  }

  factory Inventario.fromMap(Map<String, dynamic> map) {
    return Inventario(
      idInsumol: map['idInsumol'],
      stock: map['stock']?.toDouble() ?? 0.0,
    );
  }
}
