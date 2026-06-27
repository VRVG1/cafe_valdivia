import 'package:flutter/material.dart';

class Cardalmacen extends StatefulWidget {
  final String titulo;
  final String cuerpo;
  final String? footer;

  const Cardalmacen({
    super.key,
    required this.titulo,
    required this.cuerpo,
    this.footer,
  });

  @override
  State<Cardalmacen> createState() => _CardalmacenState();
}

class _CardalmacenState extends State<Cardalmacen> {
  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Center(
      child: SizedBox(
        width: 188,
        height: 150,
        child: Card(
          color: cs.secondaryContainer,
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.titulo,
                  style: tt.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: cs.onSecondaryContainer,
                  ),
                ),
                Text(
                  widget.cuerpo,
                  style: tt.titleMedium?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: cs.onSecondaryContainer,
                  ),
                ),
                if (widget.footer != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    widget.footer!,
                    style: tt.bodySmall?.copyWith(
                      color: cs.onSecondaryContainer,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
