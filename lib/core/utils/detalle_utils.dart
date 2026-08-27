List<Map<String, dynamic>> reagruparDetalles(
  List<dynamic> detalles, {
  required String precioKey,
}) {
  return detalles.map((element) {
    return {
      "producto": element['nombre_articulo']?.toString() ?? 'Sin nombre',
      "cantidad": element['cantidad']?.toStringAsFixed(1) ?? '0',
      "precio": element[precioKey]?.toStringAsFixed(2) ?? '0.00',
      "total": element['subtotal']?.toStringAsFixed(2) ?? '0.00',
    };
  }).toList();
}

int numeroDeArticulos(List<Map<String, dynamic>> lista) {
  return lista.fold<int>(
    0,
    (int t, Map<String, dynamic> e) =>
        t + (int.tryParse(e['cantidad'].toString()) ?? 0),
  );
}

String calcularTotal(List<double> cantidades) {
  double total = cantidades.fold(0.0, (t, e) => t + e);
  return "\$${total.toStringAsFixed(2)}";
}
