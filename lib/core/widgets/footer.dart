import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/navigation_service.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;

    return Container(
      width: double.infinity,
      color: isDark ? const Color(0xFF070A10) : const Color(0xFFF3F4F6),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              if (isMobile)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildBrand(theme),
                    const SizedBox(height: 32),
                    _buildLinks(context, theme, isCenter: true),
                    const SizedBox(height: 32),
                    _buildContact(theme, isCenter: true),
                    const SizedBox(height: 32),
                    _buildSocials(theme),
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildBrand(theme),
                          const SizedBox(height: 16),
                          Text(
                            'Building premium digital products with clean code, scalable architectures, and beautiful interfaces.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Explore',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildLinks(context, theme),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Us',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildContact(theme),
                          const SizedBox(height: 24),
                          _buildSocials(theme),
                        ],
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 48),
              const Divider(height: 1),
              const SizedBox(height: 32),
              Flex(
                direction: isMobile ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© 2026 Devora Studios. All rights reserved.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDark ? Colors.white38 : Colors.black45,
                    ),
                  ),
                  if (isMobile) const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _FooterBottomLink(
                        text: 'Privacy Policy',
                        onTap: () => context.go('/privacy'),
                      ),
                      const SizedBox(width: 24),
                      _FooterBottomLink(
                        text: 'Terms of Service',
                        onTap: () => context.go('/terms'),
                      ),
                      const SizedBox(width: 24),
                      _FooterBottomLink(
                        text: 'Equaly Privacy',
                        onTap: () => context.go('/equaly/privacy'),
                      ),
                      const SizedBox(width: 24),
                      _FooterBottomLink(
                        text: 'Equaly Terms',
                        onTap: () => context.go('/equaly/terms'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrand(ThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF4F46E5), Color(0xFF8B5CF6)],
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'DEVORA STUDIOS',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildLinks(BuildContext context, ThemeData theme,
      {bool isCenter = false}) {
    final alignment =
        isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    return Column(
      crossAxisAlignment: alignment,
      children: [
        _FooterLink(
            text: 'Home',
            onTap: () => NavigationService.scrollToSection(context, 'hero')),
        _FooterLink(
            text: 'About Us',
            onTap: () => NavigationService.scrollToSection(context, 'about')),
        _FooterLink(
            text: 'Our Services',
            onTap: () =>
                NavigationService.scrollToSection(context, 'services')),
        _FooterLink(
            text: 'Technologies',
            onTap: () =>
                NavigationService.scrollToSection(context, 'technologies')),
        _FooterLink(
            text: 'Why Choose Us',
            onTap: () => NavigationService.scrollToSection(context, 'why')),
      ],
    );
  }

  Widget _buildContact(ThemeData theme, {bool isCenter = false}) {
    final alignment =
        isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.mail_outline_rounded,
                size: 16, color: theme.colorScheme.primary),
            const SizedBox(width: 8),
            SelectableText(
              'devcodeinnovations@gmail.com',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on_outlined,
                size: 16, color: theme.colorScheme.primary),
            const SizedBox(width: 8),
            Text(
              'Global Digital Agency',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocials(ThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialIcon(
          icon: Icons.code_rounded,
          tooltip: 'GitHub',
          onTap: () => launchUrl(
              Uri.parse('https://github.com/Muhammad-Hasnain67'),
              mode: LaunchMode.externalApplication),
        ),
        const SizedBox(width: 12),
        _SocialIcon(
          icon: Icons.business_rounded,
          tooltip: 'LinkedIn',
          onTap: () => launchUrl(
              Uri.parse('https://www.linkedin.com/in/muhammad-hasnain309/'),
              mode: LaunchMode.externalApplication),
        ),
        const SizedBox(width: 12),
        _SocialIcon(
          icon: Icons.language_rounded,
          tooltip: 'Portfolio',
          onTap: () => launchUrl(
              Uri.parse('https://nainportfolio.netlify.app/'),
              mode: LaunchMode.externalApplication),
        ),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _FooterLink({required this.text, required this.onTap});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            widget.text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: _isHovered
                  ? theme.colorScheme.primary
                  : theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterBottomLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _FooterBottomLink({required this.text, required this.onTap});

  @override
  State<_FooterBottomLink> createState() => _FooterBottomLinkState();
}

class _FooterBottomLinkState extends State<_FooterBottomLink> {
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
        child: Text(
          widget.text,
          style: theme.textTheme.bodySmall?.copyWith(
            color: _isHovered
                ? theme.colorScheme.primary
                : (isDark ? Colors.white38 : Colors.black45),
            decoration:
                _isHovered ? TextDecoration.underline : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;

  const _SocialIcon(
      {required this.icon, required this.tooltip, required this.onTap});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: widget.tooltip,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _isHovered
                  ? theme.colorScheme.primary
                  : (isDark
                      ? Colors.white.withValues(alpha: 0.05)
                      : Colors.black.withValues(alpha: 0.04)),
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.icon,
              size: 18,
              color: _isHovered
                  ? Colors.white
                  : (isDark ? Colors.white70 : Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
