import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline_system_website/config/Colors/app_colors.dart';

class ModernButton extends StatefulWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onPressed;
  final IconData icon;
  const ModernButton(
      {super.key,
      required this.text,
      required this.isPrimary,
      required this.onPressed,
      required this.icon});

  @override
  State<ModernButton> createState() => _ModernButtonState();
}

class _ModernButtonState extends State<ModernButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: widget.isPrimary
            ? [
                BoxShadow(
                  color: AppColors.callToActionColor.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: ElevatedButton.icon(
        onPressed: widget.onPressed,
        icon: Icon(widget.icon, size: 20),
        label: Text(widget.text),
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isPrimary
              ? AppColors.callToActionColor
              : Colors.transparent,
          foregroundColor:
              widget.isPrimary ? Colors.white : const Color(0xFF94A3B8),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: widget.isPrimary
                ? BorderSide.none
                : const BorderSide(color: Color(0xFF475569)),
          ),
          elevation: 0,
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
