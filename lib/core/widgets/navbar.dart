import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/theme_manager.dart';
import '../../services/navigation_service.dart';
import 'custom_button.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xFF090D16).withValues(alpha: 0.7)
                : Colors.white.withValues(alpha: 0.8),
            border: Border(
              bottom: BorderSide(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.06),
                width: 1,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo/Brand
                _BrandLogo(
                  onTap: () {
                    final currentRoute = GoRouterState.of(context).uri.path;
                    if (currentRoute == '/') {
                      NavigationService.scrollToSection(context, 'hero');
                    } else {
                      context.go('/');
                    }
                  },
                ),
                
                // Navigation items (Desktop only)
                if (MediaQuery.of(context).size.width >= 900)
                  Row(
                    children: [
                      _NavLink(
                        text: 'About',
                        onTap: () => NavigationService.scrollToSection(context, 'about'),
                      ),
                      _NavLink(
                        text: 'Services',
                        onTap: () => NavigationService.scrollToSection(context, 'services'),
                      ),
                      _NavLink(
                        text: 'Technologies',
                        onTap: () => NavigationService.scrollToSection(context, 'technologies'),
                      ),
                      _NavLink(
                        text: 'Why Choose Us',
                        onTap: () => NavigationService.scrollToSection(context, 'why'),
                      ),
                      _NavLink(
                        text: 'Contact',
                        onTap: () => NavigationService.scrollToSection(context, 'contact'),
                      ),
                    ],
                  ),

                // Theme switch & Call to Action (Desktop) or Menu button (Mobile)
                Row(
                  children: [
                    ValueListenableBuilder<ThemeMode>(
                      valueListenable: ThemeManager.themeModeNotifier,
                      builder: (context, mode, _) {
                        final isCurrentlyDark = mode == ThemeMode.dark;
                        return IconButton(
                          icon: Icon(
                            isCurrentlyDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                            size: 20,
                          ),
                          onPressed: ThemeManager.toggleTheme,
                          tooltip: 'Toggle Theme',
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    if (MediaQuery.of(context).size.width >= 900)
                      CustomButton(
                        text: 'Get in Touch',
                        height: 42,
                        onPressed: () => NavigationService.scrollToSection(context, 'contact'),
                      )
                    else
                      IconButton(
                        icon: const Icon(Icons.menu_rounded),
                        onPressed: () {
                          // Open drawer
                          Scaffold.of(context).openEndDrawer();
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BrandLogo extends StatelessWidget {
  final VoidCallback onTap;

  const _BrandLogo({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Custom drawn Premium Logo Emblem
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4F46E5), Color(0xFF8B5CF6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4F46E5),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'DEVORA',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
                fontSize: 18,
                color: isDark ? Colors.white : const Color(0xFF0F172A),
              ),
            ),
            Text(
              ' STUDIOS',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w300,
                letterSpacing: 2.5,
                fontSize: 18,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _NavLink({
    required this.text,
    required this.onTap,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: _isHovered
                  ? theme.colorScheme.primary
                  : (isDark ? Colors.white.withValues(alpha: 0.8) : const Color(0xFF475569)),
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
