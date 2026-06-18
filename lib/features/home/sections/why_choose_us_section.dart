import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/widgets/responsive_layout.dart';
import '../../../services/navigation_service.dart';

class WhyChooseUsData {
  final IconData icon;
  final String title;
  final String description;

  const WhyChooseUsData({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  static const List<WhyChooseUsData> reasons = [
    WhyChooseUsData(
      icon: Icons.palette_outlined,
      title: 'Modern UI',
      description: 'Stunning, custom-tailored user interfaces with rich design systems, fluid micro-animations, and intuitive user experiences.',
    ),
    WhyChooseUsData(
      icon: Icons.clean_hands_outlined,
      title: 'Clean Code',
      description: 'Strict adherence to code guidelines, robust tests, and organized folder structures for maintainable and bug-free platforms.',
    ),
    WhyChooseUsData(
      icon: Icons.speed_rounded,
      title: 'Fast Delivery',
      description: 'Accelerated development lifecycles. Flutter lets us release simultaneous features across iOS, Android, and Web quickly.',
    ),
    WhyChooseUsData(
      icon: Icons.alt_route_rounded,
      title: 'Scalable Architecture',
      description: 'Centralized state management, design patterns, and modular dependencies built to handle infinite future business growth.',
    ),
    WhyChooseUsData(
      icon: Icons.aspect_ratio_rounded,
      title: 'Responsive Design',
      description: 'Your products will render beautifully and operate flawlessly on mobile screens, tablet viewports, and desktop browsers alike.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final paddingVertical = ResponsiveLayout.isMobile(context) ? 60.0 : 120.0;

    return Container(
      key: NavigationService.sectionKeys['why'],
      width: double.infinity,
      color: isDark ? const Color(0xFF090D16) : Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: paddingVertical),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: ResponsiveLayout(
            mobile: _buildMobile(theme),
            desktop: _buildDesktop(theme),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktop(ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: StickyHeader(
            child: _buildTitle(theme),
          ),
        ),
        const SizedBox(width: 80),
        Expanded(
          flex: 6,
          child: _buildReasonsList(theme),
        ),
      ],
    );
  }

  Widget _buildMobile(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(theme),
        const SizedBox(height: 48),
        _buildReasonsList(theme),
      ],
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'WHY CHOOSE US',
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ).animate().fade().slideX(begin: -0.2, end: 0),
        const SizedBox(height: 16),
        Text(
          'Engineered for excellence. Architected for growth.',
          style: theme.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ).animate().fade(delay: 100.ms).slideX(begin: -0.2, end: 0),
        const SizedBox(height: 24),
        Text(
          'We do not build basic minimum viable products. We partner with clients to design, engineer, and launch industry-leading software architectures that capture users and drive market expansions.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.brightness == Brightness.dark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
          ),
        ).animate().fade(delay: 200.ms).slideX(begin: -0.2, end: 0),
      ],
    );
  }

  Widget _buildReasonsList(ThemeData theme) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reasons.length,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final item = reasons[index];
        return _WhyCard(item: item, index: index);
      },
    );
  }
}

class StickyHeader extends StatelessWidget {
  final Widget child;
  const StickyHeader({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Basic helper for desktop scrolling layouts
    return child;
  }
}

class _WhyCard extends StatefulWidget {
  final WhyChooseUsData item;
  final int index;

  const _WhyCard({
    required this.item,
    required this.index,
  });

  @override
  State<_WhyCard> createState() => _WhyCardState();
}

class _WhyCardState extends State<_WhyCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GlassContainer(
        isHoverable: true,
        customColor: isDark ? const Color(0xFF131924) : const Color(0xFFF8FAFC),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left icon container with animated background
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isHovered
                    ? theme.colorScheme.primary
                    : theme.colorScheme.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                widget.item.icon,
                color: _isHovered ? Colors.white : theme.colorScheme.primary,
                size: 24,
              ),
            ),
            const SizedBox(width: 20),
            
            // Text details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.item.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      height: 1.5,
                      color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fade(
          duration: 500.ms,
          delay: (60 * widget.index).ms,
        ).slideX(
          begin: 0.1,
          end: 0,
          curve: Curves.easeOutCubic,
        );
  }
}
