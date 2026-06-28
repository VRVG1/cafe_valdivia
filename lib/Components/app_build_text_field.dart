import 'package:flutter/material.dart';

class AppBuildTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final IconData icon;
  final TextInputType? textInputType;
  final String? Function(String?)? customValidator;
  final bool isLoading;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? suffixText;
  final Widget? suffixIcon;
  final int? maxLines;
  final void Function(String)? onChanged;
  final bool autofocus;
  final String? hintText;
  final Widget? prefix;
  final FocusNode? focusNode;

  const AppBuildTextField({
    super.key,
    required this.text,
    required this.controller,
    required this.icon,
    this.textInputType,
    this.customValidator,
    this.isLoading = false,
    this.readOnly = false,
    this.onTap,
    this.suffixText,
    this.suffixIcon,
    this.maxLines = 1,
    this.onChanged,
    this.autofocus = false,
    this.hintText,
    this.prefix,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: !isLoading,
      readOnly: readOnly,
      keyboardType: textInputType,
      controller: controller,
      validator: customValidator,
      onTap: onTap,
      maxLines: maxLines,
      onChanged: onChanged,
      autofocus: autofocus,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: text,
        hintText: hintText,
        border: const OutlineInputBorder(),
        prefixIcon: prefix ?? Icon(icon),
        suffixText: suffixText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
