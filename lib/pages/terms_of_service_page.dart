import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/widgets/navbar.dart';
import '../core/widgets/mobile_drawer.dart';
import '../core/widgets/footer.dart';
import '../core/widgets/glass_container.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

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
                        'Terms of Service',
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
            
            // Terms Body Content
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
                          title: '1. Agreement to Terms',
                          text: 'By accessing or using our website devorastudios.dev, you agree to be bound by these Terms of Service and our Privacy Policy. If you do not agree to all of these terms, you are prohibited from using this website or our software services.',
                        ),
                        _buildSection(
                          theme,
                          title: '2. Intellectual Property Rights',
                          text: 'Unless otherwise indicated, the website and its entire content, source codes, databases, functionalities, designs, audio, video, text, photographs, and graphics are owned or controlled by Devora Studios and are protected by copyright, trademark, and intellectual property laws.',
                        ),
                        _buildSection(
                          theme,
                          title: '3. User Representations and Restrictions',
                          text: 'You agree not to use the website or its services to: (a) violate any laws or regulations; (b) distribute viruses, trojans, or malicious payloads; (c) attempt unauthorized access to our hosting accounts or servers; (d) execute automated web scrapers or indexers; or (e) harass, abuse, or harm another person.',
                        ),
                        _buildSection(
                          theme,
                          title: '4. Third-Party Links',
                          text: 'Our website or applications may contain links to third-party web sites or services that are not owned or controlled by Devora Studios. We assume no responsibility for the content, privacy policies, or practices of any third-party websites.',
                        ),
                        _buildSection(
                          theme,
                          title: '5. Disclaimer of Warranties',
                          text: 'The website and our services are provided on an "as-is" and "as-available" basis. You agree that your use of our services will be at your sole risk. To the fullest extent permitted by law, we disclaim all warranties, express or implied, including merchantability, fitness for a particular purpose, and non-infringement.',
                        ),
                        _buildSection(
                          theme,
                          title: '6. Limitation of Liability',
                          text: 'In no event will Devora Studios or its directors, employees, or agents be liable to you or any third party for any direct, indirect, consequential, exemplary, incidental, special, or punitive damages, including lost profit, lost revenue, or loss of data, arising from your use of the website.',
                        ),
                        _buildSection(
                          theme,
                          title: '7. Governing Law',
                          text: 'These Terms of Service and your use of the website are governed by and construed in accordance with the laws of the jurisdiction where Devora Studios operates, without regard to conflict of law principles.',
                        ),
                        _buildSection(
                          theme,
                          title: '8. Contact Information',
                          text: 'If you have any questions or concerns about these Terms, please email us at devcodeinnovations@gmail.com.',
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
