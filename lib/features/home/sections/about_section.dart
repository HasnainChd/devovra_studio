import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/widgets/responsive_layout.dart';
import '../../../services/navigation_service.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final paddingVertical = ResponsiveLayout.isMobile(context) ? 60.0 : 120.0;

    return Container(
      key: NavigationService.sectionKeys['about'],
      width: double.infinity,
      color: isDark ? const Color(0xFF0C111C) : const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: paddingVertical),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: ResponsiveLayout(
            mobile: _buildMobileContent(context, theme),
            desktop: _buildDesktopContent(context, theme),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopContent(BuildContext context, ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 6,
          child: _buildIntroText(theme),
        ),
        const SizedBox(width: 80),
        Expanded(
          flex: 5,
          child: _buildStatsGrid(theme),
        ),
      ],
    );
  }

  Widget _buildMobileContent(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildIntroText(theme),
        const SizedBox(height: 48),
        _buildStatsGrid(theme),
      ],
    );
  }

  Widget _buildIntroText(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'WHO WE ARE',
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ).animate().fade().slideX(begin: -0.2, end: 0),
        const SizedBox(height: 16),
        Text(
          'We design, code, and deploy elite digital experiences',
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ).animate().fade(delay: 100.ms).slideX(begin: -0.2, end: 0),
        const SizedBox(height: 24),
        Text(
          'At Devora Studios, we operate at the intersection of engineering excellence and creative design. We specialize in cross-platform mobile apps for Android and iOS using Flutter, backend system architectures, and modern web applications.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.brightness == Brightness.dark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
          ),
        ).animate().fade(delay: 200.ms).slideX(begin: -0.2, end: 0),
        const SizedBox(height: 16),
        Text(
          'Our mission is to help modern businesses transform their ideas into premium software products. By combining clean code bases, optimized architecture, and beautiful interfaces, we deliver products that outperform competitors and satisfy users.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.brightness == Brightness.dark ? const Color(0xFF64748B) : const Color(0xFF64748B),
          ),
        ).animate().fade(delay: 300.ms).slideX(begin: -0.2, end: 0),
      ],
    );
  }

  Widget _buildStatsGrid(ThemeData theme) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.15,
      children: [
        _buildStatCard(
          theme,
          number: '100%',
          label: 'Client Satisfaction',
          subLabel: 'Exceptional feedback',
        ),
        _buildStatCard(
          theme,
          number: '50+',
          label: 'Apps Delivered',
          subLabel: 'Globally shipped',
        ),
        _buildStatCard(
          theme,
          number: '5x',
          label: 'Faster Launch',
          subLabel: 'Via Flutter efficiency',
        ),
        _buildStatCard(
          theme,
          number: '99.9%',
          label: 'Uptime Systems',
          subLabel: 'Robust backends',
        ),
      ],
    ).animate().fade(delay: 200.ms).scale(begin: const Offset(0.95, 0.95));
  }

  Widget _buildStatCard(
    ThemeData theme, {
    required String number,
    required String label,
    required String subLabel,
  }) {
    final isDark = theme.brightness == Brightness.dark;
    return GlassContainer(
      isHoverable: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      customColor: isDark ? const Color(0xFF151B26) : Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: theme.textTheme.headlineLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: -0.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            subLabel,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 11,
              color: theme.brightness == Brightness.dark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
