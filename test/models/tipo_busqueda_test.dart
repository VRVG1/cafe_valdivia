import 'package:cafe_valdivia/core/models/tipo_busqueda.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TipoBusqueda', () {
    test('debe tener los 4 valores correctos', () {
      expect(TipoBusqueda.values.length, 4);
      expect(TipoBusqueda.nombre, TipoBusqueda.nombre);
      expect(TipoBusqueda.email, TipoBusqueda.email);
      expect(TipoBusqueda.telefono, TipoBusqueda.telefono);
      expect(TipoBusqueda.costo, TipoBusqueda.costo);
    });
  });

  group('FiltroBusqueda', () {
    test('debe crearse con valores por defecto', () {
      final filtro = FiltroBusqueda();

      expect(filtro.query, '');
      expect(filtro.filtrosActivos, {TipoBusqueda.nombre});
    });

    test('debe crearse con valores personalizados', () {
      final filtro = FiltroBusqueda(
        query: 'Juan',
        filtrosActivos: {TipoBusqueda.nombre, TipoBusqueda.email},
      );

      expect(filtro.query, 'Juan');
      expect(filtro.filtrosActivos, {TipoBusqueda.nombre, TipoBusqueda.email});
    });

    test('agregarFiltro debe anadir un filtro sin mutar el original', () {
      final filtro = FiltroBusqueda();
      final nuevo = filtro.agregarFiltro(TipoBusqueda.email);

      expect(filtro.filtrosActivos, {TipoBusqueda.nombre});
      expect(nuevo.filtrosActivos, {TipoBusqueda.nombre, TipoBusqueda.email});
    });

    test('agregarFiltro no debe duplicar filtros existentes', () {
      final filtro = FiltroBusqueda();
      final nuevo = filtro
          .agregarFiltro(TipoBusqueda.nombre);

      expect(nuevo.filtrosActivos, {TipoBusqueda.nombre});
    });

    test('removerFiltro debe quitar un filtro sin mutar el original', () {
      final filtro = FiltroBusqueda(
        filtrosActivos: {TipoBusqueda.nombre, TipoBusqueda.telefono},
      );
      final nuevo = filtro.removerFiltro(TipoBusqueda.nombre);

      expect(filtro.filtrosActivos, {TipoBusqueda.nombre, TipoBusqueda.telefono});
      expect(nuevo.filtrosActivos, {TipoBusqueda.telefono});
    });

    test('toggleFiltro debe agregar si no existe y quitar si existe', () {
      final filtro = FiltroBusqueda(filtrosActivos: {TipoBusqueda.nombre});

      final conEmail = filtro.toggleFiltro(TipoBusqueda.email);
      expect(conEmail.filtrosActivos, {TipoBusqueda.nombre, TipoBusqueda.email});

      final sinNombre = filtro.toggleFiltro(TipoBusqueda.nombre);
      expect(sinNombre.filtrosActivos, <TipoBusqueda>{});
    });

    test('tieneFiltro debe retornar true si el filtro esta activo', () {
      final filtro = FiltroBusqueda(filtrosActivos: {TipoBusqueda.costo});

      expect(filtro.tieneFiltro(TipoBusqueda.costo), isTrue);
      expect(filtro.tieneFiltro(TipoBusqueda.nombre), isFalse);
    });

    test('getQuery debe retornar el query actual', () {
      final filtro = FiltroBusqueda(query: 'test');

      expect(filtro.getQuery(), 'test');
    });

    test('copyWith debe crear una copia con valores actualizados', () {
      final filtro = FiltroBusqueda(query: 'original');
      final copia = filtro.copyWith(query: 'modificado');

      expect(copia.query, 'modificado');
      expect(filtro.query, 'original');
    });

    test('toString debe incluir query y filtros', () {
      final filtro = FiltroBusqueda(query: 'test');
      final str = filtro.toString();

      expect(str, contains('test'));
      expect(str, contains('nombre'));
    });
  });
}
