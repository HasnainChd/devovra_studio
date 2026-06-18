import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/widgets/responsive_layout.dart';
import '../../../services/navigation_service.dart';

class TechData {
  final String name;
  final IconData icon;
  final String category;
  final Color activeColor;

  const TechData({
    required this.name,
    required this.icon,
    required this.category,
    required this.activeColor,
  });
}

class TechnologiesSection extends StatelessWidget {
  const TechnologiesSection({super.key});

  static const List<TechData> techStack = [
    TechData(
      name: 'Flutter',
      icon: Icons.flutter_dash_rounded,
      category: 'Framework',
      activeColor: Color(0xFF02569B),
    ),
    TechData(
      name: 'Dart',
      icon: Icons.code_rounded,
      category: 'Language',
      activeColor: Color(0xFF00B4AB),
    ),
    TechData(
      name: 'Firebase',
      icon: Icons.local_fire_department_rounded,
      category: 'Backend / Cloud',
      activeColor: Color(0xFFFFCA28),
    ),
    TechData(
      name: 'Xcode',
      icon: Icons.apple_rounded,
      category: 'iOS Suite',
      activeColor: Color(0xFF1473E6),
    ),
    TechData(
      name: 'Android Studio',
      icon: Icons.android_rounded,
      category: 'Android Suite',
      activeColor: Color(0xFF3DDC84),
    ),
    TechData(
      name: 'Git',
      icon: Icons.commit_rounded,
      category: 'VCS',
      activeColor: Color(0xFFF05032),
    ),
    TechData(
      name: 'GitHub',
      icon: Icons.hub_rounded,
      category: 'VCS Hosting',
      activeColor: Color(0xFF181717),
    ),
    TechData(
      name: 'App Publishing',
      icon: Icons.publish_rounded,
      category: 'Deployment',
      activeColor: Color(0xFF4F46E5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final paddingVertical = ResponsiveLayout.isMobile(context) ? 60.0 : 120.0;

    // Responsive grid
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 4;
    if (screenWidth < 600) {
      crossAxisCount = 2;
    } else if (screenWidth < 900) {
      crossAxisCount = 3;
    }

    return Container(
      key: NavigationService.sectionKeys['technologies'],
      width: double.infinity,
      color: isDark ? const Color(0xFF0C111C) : const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: paddingVertical),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'TECHNOLOGY STACK',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ).animate().fade().slideY(begin: 0.2, end: 0),
              
              const SizedBox(height: 16),
              
              Text(
                'Our Powerhouse Tech Stack',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ).animate().fade(delay: 100.ms).slideY(begin: 0.2, end: 0),
              
              const SizedBox(height: 16),
              
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'We utilize the latest stable industry-standard tools and platforms to guarantee speed, reliability, and security for your products.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                  ),
                ),
              ).animate().fade(delay: 200.ms).slideY(begin: 0.2, end: 0),
              
              const SizedBox(height: 60),

              // Grid of technology items
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: techStack.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: ResponsiveLayout.isMobile(context) ? 1.4 : 1.6,
                ),
                itemBuilder: (context, index) {
                  final tech = techStack[index];
                  return _TechCard(tech: tech, index: index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TechCard extends StatefulWidget {
  final TechData tech;
  final int index;

  const _TechCard({
    required this.tech,
    required this.index,
  });

  @override
  State<_TechCard> createState() => _TechCardState();
}

class _TechCardState extends State<_TechCard> {
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
        customColor: isDark ? const Color(0xFF151B26) : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Tech Icon with dynamic color change
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isHovered
                    ? widget.tech.activeColor.withValues(alpha: 0.12)
                    : (isDark ? Colors.white.withValues(alpha: 0.04) : Colors.black.withValues(alpha: 0.03)),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.tech.icon,
                size: 28,
                color: _isHovered ? widget.tech.activeColor : (isDark ? Colors.white70 : Colors.black87),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.tech.name,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              widget.tech.category,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 12,
                color: isDark ? const Color(0xFF64748B) : const Color(0xFF94A3B8),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ).animate().fade(
          duration: 500.ms,
          delay: (40 * widget.index).ms,
        ).scale(
          begin: const Offset(0.95, 0.95),
          end: const Offset(1, 1),
        );
  }
}
