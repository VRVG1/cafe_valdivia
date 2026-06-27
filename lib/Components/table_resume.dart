import 'package:flutter/material.dart';
import 'package:cafe_valdivia/core/theme/app_constants.dart';

Widget tableResume(
  ColorScheme cs,
  TextTheme tt,
  List<Map<String, dynamic>> items,
  List<String> headers,
) {
  return ClipRRect(
    borderRadius: AppRadius.mdCircular,
    child: Table(
      columnWidths: const {
        0: FlexColumnWidth(3.0),
        1: FlexColumnWidth(1.5),
        2: FlexColumnWidth(1.8),
        3: FlexColumnWidth(1.8),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: cs.primary),
          children: headers
              .map(
                (h) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 11,
                  ),
                  child: Text(
                    h,
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: h == 'Precio' || h == 'Total'
                        ? TextAlign.right
                        : TextAlign.left,
                  ),
                ),
              )
              .toList(),
        ),
        ...items.asMap().entries.map((entry) {
          final i = entry.key;
          final item = entry.value;
          final isEven = i.isEven;

          return TableRow(
            decoration: BoxDecoration(
              color: isEven ? cs.surface : cs.surfaceContainerLowest,
              border: Border(
                bottom: BorderSide(
                  color: cs.outlineVariant.withOpacity(0.5),
                  width: 0.5,
                ),
              ),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['producto'], // TODO: Esto se tiene que cambiar
                            style: tt.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //Cantidad
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: cs.primaryContainer,
                      borderRadius: AppRadius.lgCircular,
                    ),
                    child: Text(
                      item['cantidad'], //TODO: Esto se tiene que cambiar
                      style: tt.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: cs.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Text(
                  "\$${item['precio']}", //TODO: Esto tiene que cambiar
                  style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Text(
                  "\$${item['total']}", //TODO: Esto tiene que cambiar
                  style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          );
        }),
      ],
    ),
  );
}
