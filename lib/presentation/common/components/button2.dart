import 'package:flutter/material.dart';

class MinimalButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  final bool isLoading;
  final IconData? icon;
  final Color? accentColor;

  const MinimalButton({
    super.key,
    this.icon,
    required this.label,
    required this.onTap,
    this.isActive = true,
    this.isLoading = false,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final activeColor = accentColor ?? colorScheme.primary;

    return GestureDetector(
      onTap: isActive && !isLoading ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        decoration: BoxDecoration(
          color: activeColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isActive ? activeColor : colorScheme.outline,
            width: isActive ? 1.5 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isLoading)
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: activeColor,
                ),
              ),
            if (!isLoading)
              Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(icon, size: 16),
            ],
          ],
        ),
      ),
    );
  }
}

class GlowingButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  final IconData? icon;
  final Color glowColor;

  const GlowingButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isActive = true,
    this.icon,
    this.glowColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer glow
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: isActive
                  ? LinearGradient(
                      colors: [
                        glowColor.withOpacity(0.3),
                        glowColor.withOpacity(0.1),
                        glowColor.withOpacity(0.3),
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    )
                  : LinearGradient(
                      colors: [
                        Colors.grey.withOpacity(0.1),
                        Colors.grey.withOpacity(0.05),
                      ],
                    ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
              decoration: BoxDecoration(
                color: isActive
                    ? glowColor.withOpacity(0.08)
                    : Colors.grey.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isActive
                      ? glowColor.withOpacity(0.2)
                      : Colors.grey.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isActive ? glowColor : Colors.grey,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                    ),
                  ),
                  if (icon != null) ...[
                    const SizedBox(width: 8),
                    Icon(
                      icon,
                      size: 16,
                      color: isActive ? glowColor : Colors.grey,
                    ),
                  ],
                ],
              ),
            ),
          ),

          // Inner shimmer
          if (isActive)
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              child: Container(
                width: 20,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      glowColor.withOpacity(0),
                      glowColor.withOpacity(0.3),
                      glowColor.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
