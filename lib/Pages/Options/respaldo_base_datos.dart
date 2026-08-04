import 'dart:io';

import 'package:cafe_valdivia/Components/snack_bar_message.dart';
import 'package:cafe_valdivia/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class RespaldoBaseDatos extends StatefulWidget {
  const RespaldoBaseDatos({super.key});

  @override
  State<RespaldoBaseDatos> createState() => _RespaldoBaseDatosState();
}

class _RespaldoBaseDatosState extends State<RespaldoBaseDatos> {
  bool _procesando = false;
  String _rutaDb = '';
  String _tamanoDb = '';

  Future<String> get _rutaDbActual => DatabaseHelper.resolveDatabasePath();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _cargarInfoDb());
  }

  Future<Directory> _dirRespaldos() async {
    final support = await getApplicationSupportDirectory();
    final dir = Directory(p.join(support.path, 'backups'));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  Future<String> _tamanoLegible(int bytes) async {
    if (bytes >= 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
    }
    return '${(bytes / 1024).toStringAsFixed(1)} KB';
  }

  Future<void> _cargarInfoDb() async {
    final ruta = await _rutaDbActual;
    final file = File(ruta);
    final tamano = await file.exists()
        ? await _tamanoLegible(await file.length())
        : 'No existe';
    if (!mounted) return;
    setState(() {
      _rutaDb = ruta;
      _tamanoDb = tamano;
    });
  }

  Future<List<File>> _listarRespaldos() async {
    final result = <File>[];
    final dirs = <Directory>[];
    dirs.add(await _dirRespaldos());
    try {
      final downloads = await getDownloadsDirectory();
      if (downloads != null) dirs.add(downloads);
    } catch (_) {}

    for (final dir in dirs) {
      if (!await dir.exists()) continue;
      await for (final entity in dir.list()) {
        if (entity is File) {
          final ext = p.extension(entity.path).toLowerCase();
          if (ext == '.db' || ext == '.sqlite' || ext == '.sqlite3') {
            result.add(entity);
          }
        }
      }
    }
    result.sort((a, b) => b.path.compareTo(a.path));
    return result;
  }

  Future<bool> _esBaseValida(String path) async {
    try {
      final db = await databaseFactory.openDatabase(
        path,
        options: OpenDatabaseOptions(readOnly: true),
      );
      await db.close();
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<void> _exportar() async {
    final cs = Theme.of(context).colorScheme;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Exportar base de datos'),
        content: const Text(
          'Se creara una copia de respaldo con los datos actuales.\n\n'
          'La base de datos se cerrara brevemente durante el proceso.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              'Exportar',
              style: TextStyle(color: cs.onErrorContainer),
            ),
          ),
        ],
      ),
    );
    if (confirm != true || !mounted) return;

    setState(() => _procesando = true);
    try {
      final origen = File(await _rutaDbActual);
      if (!await origen.exists()) {
        throw Exception('No se encontro la base de datos');
      }

      await DatabaseHelper().closeAndReset();

      final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final nombre = 'cafe_sales_backup_$timestamp.db';

      final destinos = <File>[];
      final destinoRespaldo = File(
        p.join((await _dirRespaldos()).path, nombre),
      );
      await origen.copy(destinoRespaldo.path);
      destinos.add(destinoRespaldo);

      try {
        final downloads = await getDownloadsDirectory();
        if (downloads != null) {
          final destinoDescargas = File(p.join(downloads.path, nombre));
          await origen.copy(destinoDescargas.path);
          destinos.add(destinoDescargas);
        }
      } catch (_) {}

      if (!mounted) return;
      showCustomSnackBar(
        context: context,
        mensaje:
            'Base de datos exportada:\n${destinos.map((f) => f.path).join('\n')}',
      );
    } catch (e) {
      if (mounted) {
        showCustomSnackBar(
          context: context,
          mensaje: 'Error al exportar: $e',
          isError: true,
        );
      }
    } finally {
      if (mounted) setState(() => _procesando = false);
    }
  }

  Future<void> _importar() async {
    if (_procesando) return;

    List<File> backups;
    setState(() => _procesando = true);
    try {
      backups = await _listarRespaldos();
    } catch (e) {
      if (mounted) {
        showCustomSnackBar(
          context: context,
          mensaje: 'Error al buscar respaldos: $e',
          isError: true,
        );
      }
      setState(() => _procesando = false);
      return;
    }
    if (!mounted) return;
    setState(() => _procesando = false);

    if (backups.isEmpty) {
      showCustomSnackBar(
        context: context,
        mensaje: 'No se encontraron respaldos disponibles',
        isError: true,
      );
      return;
    }

    final elegido = await showModalBottomSheet<File>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Selecciona un respaldo para importar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: backups.length,
                itemBuilder: (ctx, i) {
                  final file = backups[i];
                  return FutureBuilder<FileStat>(
                    future: file.stat(),
                    builder: (ctx, snap) {
                      final stat = snap.data;
                      final sub = <String>[];
                      if (stat != null) {
                        sub.add('${stat.size} bytes');
                        final fecha = DateFormat('dd/MM/yyyy HH:mm').format(
                          stat.modified,
                        );
                        sub.add(fecha);
                      }
                      return ListTile(
                        leading: Icon(Icons.storage_rounded),
                        title: Text(p.basename(file.path)),
                        subtitle: Text(sub.join('  ·  ')),
                        onTap: () => Navigator.of(ctx).pop(file),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
    if (elegido == null || !mounted) return;

    final cs = Theme.of(context).colorScheme;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Importar base de datos'),
        content: Text(
          'Se reemplazara la base de datos actual con:\n\n'
          '${p.basename(elegido.path)}\n\n'
          'Esta accion no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              'Importar',
              style: TextStyle(color: cs.onErrorContainer),
            ),
          ),
        ],
      ),
    );
    if (confirm != true || !mounted) return;

    setState(() => _procesando = true);
    try {
      if (!await _esBaseValida(elegido.path)) {
        throw Exception('El archivo seleccionado no es una base de datos valida');
      }

      await DatabaseHelper().closeAndReset();

      final destino = File(await _rutaDbActual);
      await elegido.copy(destino.path);

      for (final sufijo in ['-wal', '-shm']) {
        final residuo = File('${destino.path}$sufijo');
        if (await residuo.exists()) {
          await residuo.delete();
        }
      }

      if (!mounted) return;
      showCustomSnackBar(
        context: context,
        mensaje: 'Base de datos importada correctamente',
      );
    } catch (e) {
      if (mounted) {
        showCustomSnackBar(
          context: context,
          mensaje: 'Error al importar: $e',
          isError: true,
        );
      }
    } finally {
      if (mounted) setState(() => _procesando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Respaldo de Base de datos')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: ListTile(
                leading: Icon(Icons.storage_rounded, color: cs.primary),
                title: const Text('Base de datos actual'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(_rutaDb, style: tt.bodySmall),
                    const SizedBox(height: 4),
                    Text('Tamaño: $_tamanoDb', style: tt.bodySmall),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _procesando ? null : _exportar,
              icon: const Icon(Icons.upload_file_rounded),
              label: const Text('Exportar base de datos'),
            ),
            const SizedBox(height: 12),
            FilledButton.tonalIcon(
              onPressed: _procesando ? null : _importar,
              icon: const Icon(Icons.download_rounded),
              label: const Text('Importar base de datos'),
            ),
            if (_procesando) ...[
              const SizedBox(height: 24),
              const LinearProgressIndicator(),
            ],
            const SizedBox(height: 24),
            Text(
              'Los respaldos se guardan en la carpeta de respaldos de la '
              'aplicacion y en Descargas (si esta disponible). Importar '
              'reemplaza los datos actuales.',
              style: tt.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
