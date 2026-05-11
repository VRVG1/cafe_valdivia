String fecha(String fechaIso) {
  //2026-04-14T23:11:40.870974
  final String fechaCortada = fechaIso.substring(0, 10);
  final String fechaInvetida =
      "${fechaCortada.substring(8, 10)}/${fechaCortada.substring(5, 7)}/${fechaCortada.substring(0, 4)}";
  return fechaInvetida;
}

String fechaORD(String fechaIso) {
  //2026-04-14T23:11:40.870974
  final String fechaCortada = fechaIso.substring(0, 10);
  final String fechaInvetida =
      "${fechaCortada.substring(8, 10)}${fechaCortada.substring(5, 7)}${fechaCortada.substring(0, 4)}";
  return fechaInvetida;
}
