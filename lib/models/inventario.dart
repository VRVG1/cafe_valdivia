import 'package:cafe_valdivia/models/base_model.dart';
import 'package:cafe_valdivia/models/insumos.dart';

class Inventario implements BaseModel {
  final int idInsumo;
  final double stock;
  Insumos? insumo;

  Inventario({required this.idInsumo, required this.stock, this.insumo});

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
    return {'id_insumo': idInsumo, 'stock': stock};
  }

  factory Inventario.fromMap(Map<String, dynamic> map) {
    return Inventario(
      idInsumo: map['id_insumo'],
      stock: map['stock']?.toDouble() ?? 0.0,
    );
  }
}
