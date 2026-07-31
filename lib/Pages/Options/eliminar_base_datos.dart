import 'dart:io';

import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class EliminarBaseDatos extends StatefulWidget {
  const EliminarBaseDatos({super.key});

  @override
  State<EliminarBaseDatos> createState() => _EliminarBaseDatosState();
}

class _EliminarBaseDatosState extends State<EliminarBaseDatos> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _confirmarEliminacion(),
    );
  }

  Future<void> _confirmarEliminacion() async {
    final cs = Theme.of(context).colorScheme;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Eliminar TODOS los datos"),
        content: const Text(
          'Esta accion no se puede deshacer.\n\nSe eliminaran todos los registros, recetas, movimientos y configuracion.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              "Eliminar",
              style: TextStyle(color: cs.onErrorContainer),
            ),
          ),
        ],
      ),
    );

    if (!mounted) return;

    if (confirm == true) {
      try {
        await DatabaseHelper().closeAndReset();

        final directory = Directory.current.path;
        final dbPath = p.join(directory, "cafe_sales.db");
        final file = File(dbPath);
        if (await file.exists()) {
          await file.delete();
        }

        if (mounted) {
          showCustomSnackBar(
            context: context,
            mensaje: "Base de datos eliminada",
            isError: true,
          );
        }
      } catch (e) {
        if (mounted) {
          showCustomSnackBar(
            context: context,
            mensaje: "Error al eliminar: $e",
            isError: true,
          );
        }
      }
    }

    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
