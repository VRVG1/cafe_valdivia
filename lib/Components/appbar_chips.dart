import 'package:cafe_valdivia/core/models/tipo_busqueda.dart';
import 'package:cafe_valdivia/providers/filtro_busqueda_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppbarChips extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const AppbarChips({super.key, this.extraFilters = const []});

  @override
  ConsumerState<AppbarChips> createState() => _AppbarChipsState();

  @override
  Size get preferredSize => const Size.fromHeight(120.0);

  final List<TipoBusqueda> extraFilters;
}

class _AppbarChipsState extends ConsumerState<AppbarChips> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final filtro = ref.read(filtroBusquedaProvider);
      _controller.text = filtro.query;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildFilterChip(
    WidgetRef ref,
    TipoBusqueda tipo,
    ColorScheme colorScheme,
  ) {
    final filtro = ref.watch(filtroBusquedaProvider);
    final isSelected = filtro.tieneFiltro(tipo);
    //"${this[0].toUpperCase()}${this.substring(1)}";
    String label = "${tipo.name[0].toUpperCase()}${tipo.name.substring(1)}";

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) =>
            ref.read(filtroBusquedaProvider.notifier).toggleFiltro(tipo),
        selectedColor: colorScheme.primaryContainer,
        showCheckmark: false,
        labelStyle: TextStyle(
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          color: isSelected
              ? colorScheme.onSurfaceVariant
              : colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }

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
      leading: IconButton(
        onPressed: () {
          ref.invalidate(filtroBusquedaProvider);
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_rounded),
      ),

      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),

            Container(
              width: 320,
              height: 48,
              child: TextField(
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

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 16),
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
                  const SizedBox(width: 8.0),
                  ...widget.extraFilters.map(
                    (tipo) => _buildFilterChip(ref, tipo, colorScheme),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
