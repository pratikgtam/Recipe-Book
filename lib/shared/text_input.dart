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
    this.maxLines = 1,
    this.suffixText,
    this.readOnly = false,
    this.onChanged,
  });
  final Null Function(dynamic value)? onChanged;

  final String name;
  final String? labelText;
  final String? hintText;
  final bool showLabel;
  final bool obscureText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final String? initialValue;
  final String? suffixText;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final bool autofocus;
  final bool readOnly;

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
              ),
            ),
          ),
        FormBuilderTextField(
          autofocus: autofocus,
          textInputAction: textInputAction,
          initialValue: initialValue,
          maxLines: maxLines,
          name: name,
          onChanged: onChanged,
          readOnly: readOnly,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          textAlignVertical: TextAlignVertical.center,
          validator: validator,
          keyboardType: textInputType,
          decoration: InputDecoration(
            suffixText: suffixText,
            contentPadding: const EdgeInsets.all(16),
            hintText: hintText,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey[500],
            ),
            filled: true,
          ),
          obscureText: obscureText,
        ),
      ],
    );
  }
}
