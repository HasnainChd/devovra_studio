import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../services/navigation_service.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    void navigateTo(String sectionId) {
      Navigator.of(context).pop(); // Close drawer
      NavigationService.scrollToSection(context, sectionId);
    }

    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer Header with Logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4F46E5), Color(0xFF8B5CF6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'DEVORA',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      fontSize: 16,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                    ),
                  ),
                  Text(
                    ' STUDIOS',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2.0,
                      fontSize: 16,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            
            const Divider(height: 1),
            
            // Drawer Menu List Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _DrawerItem(
                    icon: Icons.info_outline_rounded,
                    title: 'About',
                    onTap: () => navigateTo('about'),
                  ),
                  _DrawerItem(
                    icon: Icons.design_services_outlined,
                    title: 'Services',
                    onTap: () => navigateTo('services'),
                  ),
                  _DrawerItem(
                    icon: Icons.code_rounded,
                    title: 'Technologies',
                    onTap: () => navigateTo('technologies'),
                  ),
                  _DrawerItem(
                    icon: Icons.verified_user_outlined,
                    title: 'Why Choose Us',
                    onTap: () => navigateTo('why'),
                  ),
                  _DrawerItem(
                    icon: Icons.mail_outline_rounded,
                    title: 'Contact Us',
                    onTap: () => navigateTo('contact'),
                  ),
                  const Divider(height: 32),
                  _DrawerItem(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    onTap: () {
                      Navigator.of(context).pop();
                      context.go('/privacy');
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.description_outlined,
                    title: 'Terms of Service',
                    onTap: () {
                      Navigator.of(context).pop();
                      context.go('/terms');
                    },
                  ),
                ],
              ),
            ),
            
            // Drawer Footer
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                '© 2026 Devora Studios.\nAll rights reserved.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isDark ? Colors.white54 : Colors.black45,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(icon, color: theme.colorScheme.primary, size: 22),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      hoverColor: theme.colorScheme.primary.withValues(alpha: 0.05),
      onTap: onTap,
    );
  }
}
