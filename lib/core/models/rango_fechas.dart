/// Rango de fechas usado como argumento en los providers familia.
class RangoFechas {
  final String fechaInicio;
  final String fechaFin;

  const RangoFechas(this.fechaInicio, this.fechaFin);

  @override
  bool operator ==(Object other) =>
      other is RangoFechas &&
      other.fechaInicio == fechaInicio &&
      other.fechaFin == fechaFin;

  @override
  int get hashCode => Object.hash(fechaInicio, fechaFin);
}
