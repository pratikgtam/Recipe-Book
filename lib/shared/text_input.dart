import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.name,
    this.labelText,
    this.showLabel = true,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.validator,
    this.initialValue,
    this.textInputAction,
    this.hintText,
    this.autofocus = true,
  });

  final String name;
  final String? labelText;
  final String? hintText;
  final bool showLabel;
  final bool obscureText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final String? initialValue;

  final TextInputAction? textInputAction;

  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel && labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              labelText ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        FormBuilderTextField(
          autofocus: autofocus,
          textInputAction: textInputAction,
          initialValue: initialValue,
          name: name,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          textAlignVertical: TextAlignVertical.center,
          validator: validator,
          keyboardType: textInputType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            hintText: hintText,
            filled: true,
          ),
          obscureText: obscureText,
        ),
      ],
    );
  }
}
