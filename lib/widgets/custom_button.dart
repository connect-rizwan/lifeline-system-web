import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum ButtonVariant { primary, secondary, outline }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final bool isLoading;
  final bool isFullWidth;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.isLoading = false,
    this.isFullWidth = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    Color getBackgroundColor() {
      switch (variant) {
        case ButtonVariant.primary:
          return colorScheme.primary;
        case ButtonVariant.secondary:
          return colorScheme.secondary;
        case ButtonVariant.outline:
          return Colors.transparent;
      }
    }

    Color getTextColor() {
      switch (variant) {
        case ButtonVariant.primary:
          return Colors.white;
        case ButtonVariant.secondary:
          return Colors.white;
        case ButtonVariant.outline:
          return colorScheme.primary;
      }
    }

    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: getBackgroundColor(),
          foregroundColor: getTextColor(),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: variant == ButtonVariant.outline
                ? BorderSide(color: colorScheme.primary)
                : BorderSide.none,
          ),
          elevation: variant == ButtonVariant.outline ? 0 : 2,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading)
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(getTextColor()),
                ),
              )
            else ...[
              if (icon != null) ...[
                Icon(icon, size: 20),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
