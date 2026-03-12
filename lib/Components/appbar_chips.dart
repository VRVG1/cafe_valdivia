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
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,

                onChanged: (value) {},

                // DECORACIÓN SIN LABEL FLOTANTE
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

                  // LABEL CENTRADO (no flota, se comporta como hint)
                  labelText: 'Buscar proveedor...',
                  labelStyle: TextStyle(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  // ESTO ES CLAVE: evita que el label flote
                  floatingLabelBehavior: FloatingLabelBehavior.never,

                  // Icono de búsqueda
                  prefixIcon: Icon(
                    Icons.search,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 48,
                    minHeight: 48,
                  ),

                  // Padding para centrar verticalmente
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
                    avatar: Icon(
                      Icons.person_outline,
                      size: 18,
                      color: colorScheme.onPrimaryContainer,
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Chip Email
                  FilterChip(
                    label: const Text('Email'),
                    onSelected: (selected) {},
                    selectedColor: colorScheme.tertiaryContainer,
                  ),

                  const SizedBox(width: 8),

                  // Chip Teléfono
                  // FilterChip(
                  //   label: const Text('Teléfono'),
                  //   selected: filtro.filtrosActivos.contains(
                  //     TipoBusqueda.telefono,
                  //   ),
                  //   onSelected: (selected) {
                  //     final nuevosFiltros = Set<TipoBusqueda>.from(
                  //       filtro.filtrosActivos,
                  //     );
                  //     if (selected) {
                  //       nuevosFiltros.add(TipoBusqueda.telefono);
                  //     } else {
                  //       nuevosFiltros.remove(TipoBusqueda.telefono);
                  //     }
                  //     ref.read(filtroBusquedaProvider.notifier).state = filtro
                  //         .copyWith(filtrosActivos: nuevosFiltros);
                  //   },
                  //   selectedColor: colorScheme.tertiaryContainer,
                  //   labelStyle: TextStyle(
                  //     color:
                  //         filtro.filtrosActivos.contains(TipoBusqueda.telefono)
                  //         ? colorScheme.onTertiaryContainer
                  //         : colorScheme.onSurfaceVariant,
                  //   ),
                  //   avatar: Icon(
                  //     Icons.phone_outlined,
                  //     size: 18,
                  //     color:
                  //         filtro.filtrosActivos.contains(TipoBusqueda.telefono)
                  //         ? colorScheme.onTertiaryContainer
                  //         : colorScheme.onSurfaceVariant,
                  //   ),
                  // ),
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
