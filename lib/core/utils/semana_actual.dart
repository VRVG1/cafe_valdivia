import 'package:cafe_valdivia/core/models/rango_fechas.dart';
import 'package:intl/intl.dart';

/// Rango de fechas de la semana actual, de lunes a domingo.
///
/// Si se omite [hoy], se usa la fecha actual del sistema. Las fechas se
/// devuelven en formato `yyyy-MM-dd`, que es el que esperan los providers.
RangoFechas rangoSemanaActual([DateTime? hoy]) {
  final fecha = hoy ?? DateTime.now();
  final lunes = DateTime(
    fecha.year,
    fecha.month,
    fecha.day - (fecha.weekday - DateTime.monday),
  );
  final domingo = DateTime(lunes.year, lunes.month, lunes.day + 6);
  final formato = DateFormat('yyyy-MM-dd');

  return RangoFechas(formato.format(lunes), formato.format(domingo));
}
