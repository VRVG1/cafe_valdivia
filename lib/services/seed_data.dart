import 'package:cafe_valdivia/services/db_helper.dart';

Future<void> seedDatabase() async {
  final db = DatabaseHelper();

  final existing = await db.query('Unidad_Medida');
  if (existing.isNotEmpty) return;

  await db.transaction((txn) async {
    // ============================================================
    // 1. UNIDADES DE MEDIDA
    // ============================================================
    final qId = <int>[];
    for (final nombre in ['Kg', 'Pieza', 'Litro', 'Gramo', 'Paquete']) {
      qId.add(await txn.insert('Unidad_Medida', {'nombre': nombre}));
    }

    // ============================================================
    // 2. CLIENTES
    // ============================================================
    final clientes = [
      {
        'nombre': 'Vicente',
        'apellido': 'Valdivia',
        'telefono': '5550101000',
        'email': 'placeholderasdkl@pemail.com',
      },
      {
        'nombre': 'Rafael',
        'apellido': 'Valdivia',
        'telefono': '5550101000',
        'email': 'placeholssdader@email.com',
      },
      {
        'nombre': 'Sofia',
        'apellido': 'Valdivia',
        'telefono': '5550101000',
        'email': 'placeholdersdkjklj@email.com',
      },
      {
        'nombre': 'Veronica',
        'apellido': 'Valdivia',
        'telefono': '5550101000',
        'email': 'placeholderd980@email.com',
      },
      {
        'nombre': 'Emmanuel',
        'apellido': 'Valdivia',
        'telefono': '5550101000',
        'email': 'placeholder9213@email.com',
      },
      {
        'nombre': 'Veronica',
        'apellido': 'Gomez',
        'telefono': '5550101000',
        'email': 'placeholdersdsjakli9@email.com',
      },
      {
        'nombre': 'Tienda',
        'apellido': 'Rolon',
        'telefono': '5550101000',
        'email': 'placeholdersdsadwqwe089@email.com',
      },
      {
        'nombre': 'Restaurante',
        'apellido': 'Buen Sason',
        'telefono': '5550101000',
        'email': 'placeholderuujcashd@email.com',
      },
      {
        'nombre': 'Guadalupana',
        'apellido': 'Sayula',
        'telefono': '5550101000',
        'email': 'placeholdersdkjeuioqw@email.com',
      },
      {
        'nombre': 'San Bartolo',
        'apellido': 'Desconocido',
        'telefono': '5550101000',
        'email': 'placeholderssdjal@email.com',
      },
      {
        'nombre': 'Marcos',
        'apellido': 'Desconocido',
        'telefono': '5550101000',
        'email': 'placeholdekjsdakjr@email.com',
      },
      {
        'nombre': 'Chava',
        'apellido': 'Alvarez',
        'telefono': '5550101000',
        'email': 'placeholdesdasr@email.com',
      },
      {
        'nombre': 'Panaderia',
        'apellido': 'Tapalpa',
        'telefono': '5550101000',
        'email': 'placeholder6678897@email.com',
      },
      {
        'nombre': 'Rabago',
        'apellido': 'Autlan',
        'telefono': '5550101000',
        'email': 'placeholder78312@email.com',
      },
      {
        'nombre': 'Super',
        'apellido': 'Vicky',
        'telefono': '5550101000',
        'email': 'placeholder123@email.com',
      },
      {
        'nombre': 'Tia',
        'apellido': 'Cruz',
        'telefono': '5550101000',
        'email': 'placeholder43@email.com',
      },
      {
        'nombre': 'Carmelilia',
        'apellido': 'Autlan',
        'telefono': '5550101000',
        'email': 'placeholder312@email.com',
      },
      {
        'nombre': 'Dulce',
        'apellido': 'Guzman',
        'telefono': '5550101000',
        'email': 'placeholder1222@email.com',
      },
      {
        'nombre': 'Tienda',
        'apellido': 'esquina',
        'telefono': '5550101000',
        'email': 'placeholder05@email.com',
      },
      {
        'nombre': 'Eriberto',
        'apellido': 'Guzman',
        'telefono': '5550101000',
        'email': 'placeholder06@email.com',
      },
      {
        'nombre': 'Luis',
        'apellido': 'Manuel',
        'telefono': '5550101000',
        'email': 'placeholder07@email.com',
      },
      {
        'nombre': 'Cereales',
        'apellido': 'Zacoalco',
        'telefono': '5550101000',
        'email': 'placeholder08@email.com',
      },
      {
        'nombre': 'Micheladas',
        'apellido': 'Tapalpa',
        'telefono': '5550101000',
        'email': 'placeholder09@email.com',
      },
      {
        'nombre': 'Yoy',
        'apellido': 'Hernandez',
        'telefono': '5550101000',
        'email': 'placeholder10@email.com',
      },
      {
        'nombre': 'Miguel',
        'apellido': 'algo',
        'telefono': '5550101000',
        'email': 'placeholder11@email.com',
      },
      {
        'nombre': 'Senora',
        'apellido': 'chayo',
        'telefono': '5550101000',
        'email': 'placeholder12@email.com',
      },
      {
        'nombre': 'Alonso',
        'apellido': 'Perez Guerra',
        'telefono': '5550101000',
        'email': 'placeholder00@email.com',
      },
      {
        'nombre': 'Pedro',
        'apellido': 'Nicolas Rios',
        'telefono': '5550101000',
        'email': 'placeholder99@email.com',
      },
    ];
    for (final c in clientes) {
      await txn.insert('Cliente', c);
    }

    // ============================================================
    // 3. PROVEEDORES
    // ============================================================
    final proveedores = [
      {
        'nombre': 'Café Córdoba',
        'telefono': '5550101000',
        'email': 'placeholder1@email.com',
      },
      {
        'nombre': 'Milio',
        'telefono': '5550101000',
        'email': 'placeholder2@email.com',
      },
      {
        'nombre': 'Vicente',
        'telefono': '5550101000',
        'email': 'placeholder3@email.com',
      },
      {
        'nombre': 'Cafiver',
        'telefono': '5550101000',
        'email': 'placeholder4@email.com',
      },
      {
        'nombre': 'Llamas',
        'telefono': '5550101000',
        'email': 'placeholder5@email.com',
      },
      {
        'nombre': 'Nando',
        'telefono': '5550101000',
        'email': 'placeholder6@email.com',
      },
      {
        'nombre': 'Fanta',
        'telefono': '5550101000',
        'email': 'placeholder7@email.com',
      },
      {
        'nombre': 'Adrián',
        'telefono': '5550101000',
        'email': 'placeholder8@email.com',
      },
      {
        'nombre': 'Cristian de Tepec',
        'telefono': '5550101000',
        'email': 'placeholder9@email.com',
      },
      {
        'nombre': 'Mercedes',
        'telefono': '5550101000',
        'email': 'placeholder10@email.com',
      },
      {
        'nombre': 'Ruperto (Bolsas)',
        'telefono': '5550101000',
        'email': 'placeholder11@email.com',
      },
      {
        'nombre': 'Sayula (Etiquetas)',
        'telefono': '5550101000',
        'email': 'placeholder12@email.com',
      },
      {
        'nombre': 'Cuñado de Milio',
        'telefono': '5550101000',
        'email': 'placeholder13@email.com',
      },
      {
        'nombre': 'Plásticos México (bolsas)',
        'telefono': '5550101000',
        'email': 'placeholder14@email.com',
      },
    ];
    final pId = <int>[];
    for (final p in proveedores) {
      pId.add(await txn.insert('Proveedor', p));
    }
  });
}
