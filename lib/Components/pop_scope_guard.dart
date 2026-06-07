import 'package:cafe_valdivia/Components/crud.dart';
import 'package:flutter/material.dart';

class PopScopeGuard extends StatelessWidget {
  final bool isDirty;
  final bool isLoading;
  final Widget child;

  const PopScopeGuard({
    super.key,
    required this.isDirty,
    this.isLoading = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !isDirty || isLoading,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) return;
        final bool shouldPop = await mostrarDialogoDescartarCambios(context);
        if (shouldPop && context.mounted) {
          Navigator.pop(context);
        }
      },
      child: child,
    );
  }
}
