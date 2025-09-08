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
    final ThemeData theme = Theme.of(context);
    return Center(
      child: SizedBox(
        width: 188,
        height: 150,
        child: Card(
          color: theme.colorScheme.secondaryContainer,
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
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                ),
                Text(
                  widget.cuerpo,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                ),
                if (widget.footer != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    widget.footer!,
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.onSecondaryContainer,
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
