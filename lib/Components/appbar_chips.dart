import 'package:cafe_valdivia/core/models/tipo_busqueda.dart';
import 'package:cafe_valdivia/providers/filtro_busqueda_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppbarChips extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const AppbarChips({super.key});

  @override
  ConsumerState<AppbarChips> createState() => _AppbarChipsState();

  @override
  Size get preferredSize => const Size.fromHeight(120.0);
}

class _AppbarChipsState extends ConsumerState<AppbarChips> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final tt = theme.textTheme;
    final filtro = ref.watch(filtroBusquedaProvider);

    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: colorScheme.surface,
      toolbarHeight: 120, // Más alto para acomodar chips

      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),

            // TEXTFIELD CENTRADO SIN ANIMACIÓN FLOTANTE
            Container(
              width: 320,
              height: 48,
              child: TextField(
                //textAlign: TextAlign.center,
                onChanged: (value) {
                  ref
                      .read(filtroBusquedaProvider.notifier)
                      .actualizarQuery(value);
                },

                decoration: InputDecoration(
                  border: InputBorder.none,

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide(
                      color: colorScheme.primary,
                      width: 2,
                    ),
                  ),

                  filled: true,
                  fillColor: colorScheme.secondaryContainer.withOpacity(0.4),

                  labelText: 'Buscar proveedor...',
                  labelStyle: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,

                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),

                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),

                cursorColor: colorScheme.primary,
              ),
            ),

            const SizedBox(height: 8),

            // CHIPS DE FILTRO
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 16),

                  // Chip Nombre (siempre activo, no se puede desactivar)
                  FilterChip(
                    label: const Text('Nombre'),
                    selected: true,
                    onSelected: null, // Siempre activo
                    selectedColor: colorScheme.primaryContainer,
                    labelStyle: TextStyle(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                    showCheckmark: false,
                  ),

                  const SizedBox(width: 8),

                  // Chip Email
                  FilterChip(
                    label: const Text('Email'),
                    selected: filtro.tieneFiltro(TipoBusqueda.email),
                    onSelected: (selected) {
                      ref
                          .read(filtroBusquedaProvider.notifier)
                          .toggleFiltro(TipoBusqueda.email);
                    },
                    selectedColor: colorScheme.primaryContainer,
                    showCheckmark: false,
                    labelStyle: TextStyle(
                      fontWeight: filtro.tieneFiltro(TipoBusqueda.email)
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: filtro.tieneFiltro(TipoBusqueda.email)
                          ? colorScheme.onSurfaceVariant
                          : colorScheme.onPrimaryContainer,
                    ),
                  ),

                  const SizedBox(width: 8),

                  FilterChip(
                    label: const Text('Teléfono'),
                    selected: filtro.tieneFiltro(TipoBusqueda.telefono),
                    onSelected: (bool selected) {
                      ref
                          .read(filtroBusquedaProvider.notifier)
                          .toggleFiltro(TipoBusqueda.telefono);
                    },
                    selectedColor: colorScheme.primaryContainer,
                    showCheckmark: false,
                    labelStyle: TextStyle(
                      fontWeight: filtro.tieneFiltro(TipoBusqueda.telefono)
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: filtro.tieneFiltro(TipoBusqueda.telefono)
                          ? colorScheme.onSurfaceVariant
                          : colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
