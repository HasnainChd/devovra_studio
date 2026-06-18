import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/responsive_layout.dart';
import '../../../services/navigation_service.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isDark = theme.brightness == Brightness.dark;
    
    // Responsive sizing
    final double headlineSize = ResponsiveLayout.isMobile(context) ? 36 : (ResponsiveLayout.isTablet(context) ? 52 : 68);
    final double subSize = ResponsiveLayout.isMobile(context) ? 16 : 20;
    final double paddingBottom = ResponsiveLayout.isMobile(context) ? 60 : 120;
    final double paddingTop = ResponsiveLayout.isMobile(context) ? 80 : 140;

    return Container(
      key: NavigationService.sectionKeys['hero'],
      width: double.infinity,
      padding: EdgeInsets.only(left: 24, right: 24, top: paddingTop, bottom: paddingBottom),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background soft glowing orbs (very premium)
          Positioned(
            top: -100,
            left: size.width * 0.1,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.primary.withValues(alpha: isDark ? 0.08 : 0.05),
              ),
            ).animate().fade(duration: 2.seconds).scale(
                  duration: 2.seconds,
                  begin: const Offset(0.8, 0.8),
                  end: const Offset(1.2, 1.2),
                ),
          ),
          Positioned(
            bottom: -50,
            right: size.width * 0.15,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.colorScheme.secondary.withValues(alpha: isDark ? 0.08 : 0.04),
              ),
            ).animate().fade(duration: 2.seconds).scale(
                  duration: 2.seconds,
                  begin: const Offset(1.2, 1.2),
                  end: const Offset(0.9, 0.9),
                ),
          ),

          // Main Content
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top micro-badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: theme.colorScheme.primary.withValues(alpha: 0.15),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF10B981), // Emerald active green
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Now building for 2026 and beyond',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                )
                .animate()
                .fade(duration: 600.ms)
                .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),
                
                const SizedBox(height: 32),

                // Large Headline with Gradient Text
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF4F46E5), Color(0xFF8B5CF6), Color(0xFFEC4899)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: Text(
                    'Build Modern Apps\nfor Modern Businesses',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.displayLarge?.copyWith(
                      fontSize: headlineSize,
                      color: Colors.white, // Required for ShaderMask to work correctly
                      fontWeight: FontWeight.w900,
                      height: 1.15,
                      letterSpacing: -1.5,
                    ),
                  ),
                )
                .animate()
                .fade(duration: 800.ms, delay: 200.ms)
                .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),

                const SizedBox(height: 24),

                // Short description
                Text(
                  'Devora Studios crafts premium Android, iOS, and Web solutions using Flutter. We build scalable architecture, modern user interfaces, and high-performance digital products that drive growth.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: subSize,
                    color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569),
                    height: 1.6,
                  ),
                )
                .animate()
                .fade(duration: 800.ms, delay: 400.ms)
                .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),

                const SizedBox(height: 40),

                // Buttons: Contact Us & Our Services
                Flex(
                  mainAxisAlignment: MainAxisAlignment.center,
                  direction: ResponsiveLayout.isMobile(context) ? Axis.vertical : Axis.horizontal,
                  children: [
                    CustomButton(
                      text: 'Contact Us',
                      icon: Icons.chat_bubble_outline_rounded,
                      onPressed: () => NavigationService.scrollToSection(context, 'contact'),
                      width: ResponsiveLayout.isMobile(context) ? double.infinity : null,
                    ),
                    if (ResponsiveLayout.isMobile(context))
                      const SizedBox(height: 16)
                    else
                      const SizedBox(width: 16),
                    CustomButton(
                      text: 'Our Services',
                      isSecondary: true,
                      icon: Icons.east_rounded,
                      onPressed: () => NavigationService.scrollToSection(context, 'services'),
                      width: ResponsiveLayout.isMobile(context) ? double.infinity : null,
                    ),
                  ],
                )
                .animate()
                .fade(duration: 800.ms, delay: 600.ms)
                .slideY(begin: 0.2, end: 0, curve: Curves.easeOutCubic),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
