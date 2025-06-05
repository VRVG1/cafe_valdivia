class Cliente {
  int? idCliente;
  String nombre;
  String? apellido;
  String? telefono;
  String? email;
  double kilosComprados;
  double ventasTotales;

  Cliente({
    this.idCliente,
    required this.nombre,
    required this.apellido,
    required this.telefono,
    this.email,
    this.kilosComprados = 0.0,
    this.ventasTotales = 0.0,
  });

  // Convertir un Cliente a un Map para insertarlo en la BD.
  Map<String, dynamic> toMap() {
    return {
      'id_cliente': idCliente,
      'nombre': nombre,
      'apellido': apellido,
      'telefono': telefono,
      'email': email,
      'kilos_comprados': kilosComprados,
      'ventas_totales': ventasTotales,
    };
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      idCliente: map['id_cliente'],
      nombre: map['nombre'],
      apellido: map['apellido'],
      telefono: map['telefono'],
      email: map['email'],
      kilosComprados: map['kilos_comprados'],
      ventasTotales: map['ventas_totales'],
    );
  }
}
