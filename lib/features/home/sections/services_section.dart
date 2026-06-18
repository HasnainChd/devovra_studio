import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/widgets/glass_container.dart';
import '../../../core/widgets/responsive_layout.dart';
import '../../../services/navigation_service.dart';

class ServiceData {
  final IconData icon;
  final String title;
  final String description;

  const ServiceData({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const List<ServiceData> services = [
    ServiceData(
      icon: Icons.layers_rounded,
      title: 'Flutter Development',
      description: 'Ship beautiful, high-performance apps for iOS, Android, Web, and Desktop from a single shared codebase.',
    ),
    ServiceData(
      icon: Icons.android_rounded,
      title: 'Android Development',
      description: 'Native Android apps using Kotlin and Java. Fully optimized for responsiveness, performance, and Play Store standards.',
    ),
    ServiceData(
      icon: Icons.phone_iphone_rounded,
      title: 'iOS Development',
      description: 'Tailored, native iOS experiences using Swift and SwiftUI. Adhering strictly to Apple Design Guidelines and App Store quality.',
    ),
    ServiceData(
      icon: Icons.devices_rounded,
      title: 'Cross Platform Apps',
      description: 'Cross-platform engineering strategies that maximize code reuse without sacrificing native look, feel, or speed.',
    ),
    ServiceData(
      icon: Icons.local_fire_department_rounded,
      title: 'Firebase Integration',
      description: 'Rapid backend integration: Realtime Database, Firestore, Authentication, Cloud Functions, FCM, and Analytics.',
    ),
    ServiceData(
      icon: Icons.api_rounded,
      title: 'Backend/API Integration',
      description: 'Design and implementation of highly scalable RESTful APIs, Supabase databases, webhooks, Node.js routers, and third-party integrations.',
    ),
    ServiceData(
      icon: Icons.build_circle_outlined,
      title: 'App Maintenance',
      description: 'Post-launch operations, server health monitoring, immediate hotfixes, OS updates (iOS/Android), and ongoing performance optimization.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    final paddingVertical = ResponsiveLayout.isMobile(context) ? 60.0 : 120.0;
    
    // Grid settings
    final screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 3;
    if (screenWidth < 600) {
      crossAxisCount = 1;
    } else if (screenWidth < 1000) {
      crossAxisCount = 2;
    }

    return Container(
      key: NavigationService.sectionKeys['services'],
      width: double.infinity,
      color: isDark ? const Color(0xFF090D16) : Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: paddingVertical),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'SERVICES',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ).animate().fade().slideY(begin: 0.2, end: 0),
              
              const SizedBox(height: 16),
              
              Text(
                'Comprehensive App Solutions',
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
                  'We construct end-to-end applications, robust system integrations, and cloud architectures engineered to support millions of active sessions.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                  ),
                ),
              ).animate().fade(delay: 200.ms).slideY(begin: 0.2, end: 0),
              
              const SizedBox(height: 60),

              // Grid of service cards
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: ResponsiveLayout.isMobile(context) ? 1.4 : 1.15,
                ),
                itemBuilder: (context, index) {
                  final service = services[index];
                  return _ServiceCard(service: service, index: index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final ServiceData service;
  final int index;

  const _ServiceCard({
    required this.service,
    required this.index,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
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
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon wrapper with animation
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _isHovered
                        ? theme.colorScheme.primary
                        : theme.colorScheme.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    widget.service.icon,
                    size: 24,
                    color: _isHovered ? Colors.white : theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.service.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.service.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    height: 1.5,
                    color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            
            // Premium micro-interaction indicator (small arrow that slides right)
            AnimatedOpacity(
              opacity: _isHovered ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 250),
              child: Row(
                children: [
                  Text(
                    'Learn more',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 14,
                    color: theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fade(
          duration: 500.ms,
          delay: (50 * widget.index).ms,
        ).slideY(
          begin: 0.1,
          end: 0,
          curve: Curves.easeOutCubic,
        );
  }
}
