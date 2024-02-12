import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.type = ButtonType.primary,
    this.showLoading = true,
  });
  final String label;
  final VoidCallback? onPressed;
  final ButtonType type;
  final bool showLoading;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 16,
              ),
              child: Text(
                label,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        if (onPressed == null && showLoading)
          const Padding(
            padding: EdgeInsets.only(right: 32),
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),
          ),
      ],
    );
  }
}

enum ButtonType {
  primary,
  secondary,
}
