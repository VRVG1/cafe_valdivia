import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final IconData? prefixIcon;
  final String? suffixText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool readOnly;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final String? errorText;

  const CustomTextField({
    this.labelText,
    this.prefixIcon,
    this.suffixText,
    this.keyboardType,
    this.controller,
    this.readOnly = false,
    this.onTap,
    required this.onChanged,
    this.errorText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextFormField(
      style: TextStyle(color: theme.colorScheme.onSurface),
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixText: suffixText,
        suffixStyle: TextStyle(color: theme.colorScheme.onSurface),
        prefixStyle: TextStyle(color: theme.colorScheme.onSurface),
        border: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
      ),
    );
  }
}
