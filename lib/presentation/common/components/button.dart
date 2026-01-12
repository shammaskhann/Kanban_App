import 'package:flutter/material.dart';

class SleekButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double elevation;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const SleekButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.backgroundColor,
    this.textColor,
    this.leadingIcon,
    this.trailingIcon,
    this.elevation = 0,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled && !isLoading ? onPressed : null,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding:
              padding ??
              const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: backgroundColor ?? colorScheme.primary,
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            boxShadow: [
              if (elevation > 0 && isEnabled && !isLoading)
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.2),
                  blurRadius: elevation * 2,
                  spreadRadius: 0,
                  offset: Offset(0, elevation),
                ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      textColor ?? colorScheme.onPrimary,
                    ),
                  ),
                ),

              if (!isLoading && leadingIcon != null) ...[
                Icon(
                  leadingIcon,
                  size: 18,
                  color: textColor ?? colorScheme.onPrimary,
                ),
                const SizedBox(width: 8),
              ],

              if (!isLoading)
                Text(
                  text,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: textColor ?? colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),

              if (!isLoading && trailingIcon != null) ...[
                const SizedBox(width: 8),
                Icon(
                  trailingIcon,
                  size: 18,
                  color: textColor ?? colorScheme.onPrimary,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
