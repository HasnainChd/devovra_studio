import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/widgets/navbar.dart';
import '../core/widgets/mobile_drawer.dart';
import '../core/widgets/footer.dart';
import '../core/widgets/glass_container.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: const NavBar(),
      endDrawer: const MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Page Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
              color: isDark ? const Color(0xFF0C111C) : const Color(0xFFF8FAFC),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Back Button
                      TextButton.icon(
                        onPressed: () => context.go('/'),
                        icon: const Icon(Icons.arrow_back_rounded, size: 16),
                        label: const Text('Back to Home'),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Privacy Policy',
                        style: theme.textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1.0,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Last Updated: June 18, 2026',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: isDark ? Colors.white54 : Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Policy Body Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: GlassContainer(
                    customColor: isDark ? const Color(0xFF131924) : Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSection(
                          theme,
                          title: '1. Introduction',
                          text: 'Devora Studios ("we," "us," or "our") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website devorastudios.dev or use our applications and services.',
                        ),
                        _buildSection(
                          theme,
                          title: '2. Information We Collect',
                          text: 'We may collect information about you in a variety of ways. This includes information you provide directly (such as name, email address, and message details when filling out our contact form) and information collected automatically (such as IP addresses, browser types, operating systems, and access times via tracking cookies).',
                        ),
                        _buildSection(
                          theme,
                          title: '3. How We Use Your Information',
                          text: 'We use the information we collect to communicate with you, analyze website performance and traffic, deliver requested services, troubleshoot technical problems, and send updates regarding our products or policy modifications.',
                        ),
                        _buildSection(
                          theme,
                          title: '4. Sharing Your Information',
                          text: 'We do not sell, rent, or trade your personal information to third parties. We may share information with trusted third-party service providers (such as hosting servers or email dispatch networks) who assist us in operating our business, under strict confidentiality terms.',
                        ),
                        _buildSection(
                          theme,
                          title: '5. Security of Your Information',
                          text: 'We use industry-standard physical, electronic, and managerial procedures to safeguard and secure your information. However, no data transmission over the internet can be guaranteed to be 100% secure, and you submit data at your own risk.',
                        ),
                        _buildSection(
                          theme,
                          title: '6. Your Rights',
                          text: 'Depending on your location, you may have rights under regional regulations (like GDPR or CCPA) to access, correct, delete, or limit the use of your personal data. To exercise these rights, please email us at devcodeinnovations@gmail.com.',
                        ),
                        _buildSection(
                          theme,
                          title: '7. Updates to This Policy',
                          text: 'We reserve the right to modify this Privacy Policy at any time. We will alert you about any changes by updating the "Last Updated" date at the top of this page. You are encouraged to periodically review this page to stay informed.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(ThemeData theme, {required String title, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 15,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
