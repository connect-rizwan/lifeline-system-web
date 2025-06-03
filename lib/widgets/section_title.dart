import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum SectionTitleAlignment { left, center, right }

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final SectionTitleAlignment alignment;
  final Color? titleColor;
  final Color? subtitleColor;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.alignment = SectionTitleAlignment.center,
    this.titleColor,
    this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: _getCrossAxisAlignment(),
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: titleColor ?? colorScheme.onSurface,
          ),
          textAlign: _getTextAlign(),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          Text(
            subtitle!,
            style: GoogleFonts.inter(
              fontSize: 18,
              color:
                  subtitleColor ?? colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: _getTextAlign(),
          ),
        ],
      ],
    );
  }

  CrossAxisAlignment _getCrossAxisAlignment() {
    switch (alignment) {
      case SectionTitleAlignment.left:
        return CrossAxisAlignment.start;
      case SectionTitleAlignment.center:
        return CrossAxisAlignment.center;
      case SectionTitleAlignment.right:
        return CrossAxisAlignment.end;
    }
  }

  TextAlign _getTextAlign() {
    switch (alignment) {
      case SectionTitleAlignment.left:
        return TextAlign.left;
      case SectionTitleAlignment.center:
        return TextAlign.center;
      case SectionTitleAlignment.right:
        return TextAlign.right;
    }
  }
}
