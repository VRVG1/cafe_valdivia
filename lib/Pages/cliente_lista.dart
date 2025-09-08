import 'package:cafe_valdivia/Pages/cliente_detallado.dart';
import 'package:cafe_valdivia/models/cliente.dart';
import 'package:cafe_valdivia/repositorys/cliente_repository.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:flutter/material.dart';

class Clientelista extends StatefulWidget {
  const Clientelista({super.key});

  @override
  State<Clientelista> createState() => ClientelistaState();
}

class ClientelistaState extends State<Clientelista> {
  late Future<List<Cliente>> _clientesFuture;

  @override
  void initState() {
    super.initState();
    _clientesFuture = _fetchClientes();
  }

  Future<List<Cliente>> _fetchClientes() async {
    final dbHelper = DatabaseHelper();
    final repoCliente = ClienteRepository(dbHelper);
    final clientes = await repoCliente.getAll();
    return clientes;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return FutureBuilder(
      future: _clientesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No hay clientes para mostrar.'));
        } else {
          final clientes = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: clientes.length,
            itemBuilder: (BuildContext context, int index) {
              final Cliente cliente = clientes[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      index % 2 == 0
                          ? theme.colorScheme.tertiaryContainer
                          : theme.colorScheme.errorContainer,
                  child: Text(
                    "R",
                    style: TextStyle(
                      color:
                          index % 2 == 0
                              ? theme.colorScheme.onTertiaryContainer
                              : theme.colorScheme.onErrorContainer,
                    ),
                  ),
                ),
                title: Text(
                  cliente.nombre.isNotEmpty ? cliente.nombre : 'Jonh Doe',
                ),
                subtitle: Text(
                  cliente.telefono.toString().isNotEmpty
                      ? cliente.telefono.toString()
                      : "xxxxxxxxxx",
                ),
                trailing: Text(
                  "5"
                  "KG",
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClienteDetallado()),
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
