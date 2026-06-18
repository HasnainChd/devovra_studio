import 'package:flutter/material.dart';

class GlassContainer extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final bool isHoverable;
  final Color? customColor;
  final Color? customBorderColor;

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius,
    this.isHoverable = false,
    this.customColor,
    this.customBorderColor,
  });

  @override
  State<GlassContainer> createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final defaultBorderRadius = widget.borderRadius ?? BorderRadius.circular(24);
    final defaultBgColor = widget.customColor ??
        (isDark ? theme.colorScheme.surface.withValues(alpha: 0.4) : theme.colorScheme.surface);
    final defaultBorderColor = widget.customBorderColor ??
        (isDark ? theme.dividerColor.withValues(alpha: 0.3) : theme.dividerColor.withValues(alpha: 0.7));

    Widget container = AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      width: widget.width,
      height: widget.height,
      padding: widget.padding ?? const EdgeInsets.all(24),
      margin: widget.margin,
      decoration: BoxDecoration(
        color: _isHovered && widget.isHoverable
            ? (isDark ? defaultBgColor.withValues(alpha: 0.55) : defaultBgColor.withValues(alpha: 0.95))
            : defaultBgColor,
        borderRadius: defaultBorderRadius,
        border: Border.all(
          color: _isHovered && widget.isHoverable
              ? theme.colorScheme.primary.withValues(alpha: 0.5)
              : defaultBorderColor,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: _isHovered && widget.isHoverable ? 0.35 : 0.2)
                : Colors.grey.withValues(alpha: _isHovered && widget.isHoverable ? 0.12 : 0.05),
            blurRadius: _isHovered && widget.isHoverable ? 30 : 20,
            offset: _isHovered && widget.isHoverable ? const Offset(0, 15) : const Offset(0, 8),
          ),
        ],
      ),
      child: widget.child,
    );

    if (widget.isHoverable) {
      container = MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedScale(
          scale: _isHovered ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          child: container,
        ),
      );
    }

    return container;
  }
}
