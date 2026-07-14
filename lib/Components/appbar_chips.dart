import 'package:cafe_valdivia/core/models/tipo_busqueda.dart';
import 'package:cafe_valdivia/providers/filtro_busqueda_notifier.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppbarChips extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const AppbarChips({
    super.key,
    this.extraFilters = const [],
    this.labelText = 'Buscar proveedor...',
    this.backOption = true,
  });

  @override
  ConsumerState<AppbarChips> createState() => _AppbarChipsState();

  @override
  Size get preferredSize => const Size.fromHeight(120.0);

  final List<TipoBusqueda> extraFilters;
  final String labelText;
  final bool backOption;
}

class _AppbarChipsState extends ConsumerState<AppbarChips> {
  DateTimeRange? _selectedDateRange;
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

  void datePicker(FiltroBusqueda filtro) async {
    _selectedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDateRange: filtro.fechaInicial != null && filtro.fechaFinal != null
          ? DateTimeRange(start: filtro.fechaInicial!, end: filtro.fechaFinal!)
          : DateTimeRange(
              start: DateTime.now(),
              end: DateTime.now().add(const Duration(days: 7)),
            ),
    );
    if (_selectedDateRange != null) {
      ref
          .read(filtroBusquedaProvider.notifier)
          .actualizarRangoFecha(
            _selectedDateRange!.start,
            _selectedDateRange!.end,
          );
    }
  }

  Widget _buildFilterChip(
    WidgetRef ref,
    TipoBusqueda tipo,
    ColorScheme colorScheme,
  ) {
    final filtro = ref.watch(filtroBusquedaProvider);
    final isSelected = filtro.tieneFiltro(tipo);
    String label = "${tipo.name[0].toUpperCase()}${tipo.name.substring(1)}";

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) {
          if (label == "Fecha") {
            if (isSelected) {
              ref.read(filtroBusquedaProvider.notifier).limpiarFecha();
            } else {
              datePicker(filtro);
            }
          }
          ref.read(filtroBusquedaProvider.notifier).toggleFiltro(tipo);
          if (label == "Fecha") {
            ref.read(filtroBusquedaProvider.notifier).actualizarQuery("");
          }
        },
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

    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: colorScheme.surface,
      toolbarHeight: 120, // Más alto para acomodar chips
      leading: widget.backOption
          ? IconButton(
              tooltip: "Volver",
              onPressed: () {
                ref.invalidate(filtroBusquedaProvider);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_rounded),
            )
          : null,

      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Container(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 48),
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
                    borderRadius: AppRadius.xlCircular,
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: AppRadius.xlCircular,
                    borderSide: BorderSide(
                      color: colorScheme.primary,
                      width: 2,
                    ),
                  ),

                  filled: true,
                  fillColor: colorScheme.secondaryContainer.withOpacity(0.4),

                  labelText: widget.labelText,
                  labelStyle: tt.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,

                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),

                style: tt.bodyLarge?.copyWith(
                  color: colorScheme.onSurface,
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
