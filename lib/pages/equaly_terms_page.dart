import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/widgets/navbar.dart';
import '../core/widgets/mobile_drawer.dart';
import '../core/widgets/footer.dart';
import '../core/widgets/glass_container.dart';

class EqualyTermsPage extends StatelessWidget {
  const EqualyTermsPage({super.key});

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
                        'Terms of Service — Equaly',
                        style: theme.textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1.0,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Last Updated: June 29, 2026',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: isDark ? Colors.white54 : Colors.black45,
                          fontWeight: FontWeight.w600,
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
                        Text(
                          'These Terms of Service ("Terms") govern your use of Equaly ("the app"), operated by Devora Studios. By creating an account or using the app, you agree to these Terms.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        _buildSection(
                          theme,
                          title: '1. DESCRIPTION OF SERVICE',
                          text: 'Equaly is a tool for tracking, splitting, and managing shared expenses between users. Equaly does not process, hold, or transfer real money between users — it is a record-keeping and calculation tool only. Any "settlement" recorded in the app is a manual record you create to track that a payment happened outside the app (e.g. via cash, bank transfer, or another payment app); Equaly does not facilitate or guarantee the actual transfer of funds.',
                        ),

                        _buildSection(
                          theme,
                          title: '2. ACCOUNTS',
                          text: 'You are responsible for maintaining the accuracy of your account information and for any activity that occurs under your account. You must be at least 13 years old to use Equaly.',
                        ),

                        _buildSection(
                          theme,
                          title: '3. USER-GENERATED CONTENT',
                          text: 'You are solely responsible for the accuracy of expenses, amounts, and balances you enter. Equaly is not responsible for disputes between users regarding the accuracy of expense splits, the existence of a debt, or whether a settlement actually occurred outside the app.',
                        ),

                        _buildSection(
                          theme,
                          title: '4. EQUALY PRO (SUBSCRIPTION)',
                          text: 'Equaly Pro is an optional paid subscription offering additional features. Subscriptions automatically renew at the end of each billing period unless canceled before the renewal date. You can cancel your subscription at any time through your device\'s app store account settings (Google Play / Apple App Store), and cancellation will take effect at the end of the current billing period. Refunds are subject to the policies of the app store through which you subscribed (Google Play or Apple App Store).',
                        ),

                        _buildSection(
                          theme,
                          title: '5. ACCEPTABLE USE',
                          text: 'You agree not to use Equaly to harass other users, submit fraudulent expense records intended to deceive other group members, or attempt to access accounts or data that are not yours.',
                        ),

                        _buildSection(
                          theme,
                          title: '6. TERMINATION',
                          text: 'We may suspend or terminate accounts that violate these Terms or engage in abusive behavior toward other users.',
                        ),

                        _buildSection(
                          theme,
                          title: '7. LIMITATION OF LIABILITY',
                          text: 'Equaly is provided "as is." We are not liable for financial disputes between users, inaccuracies in user-entered data, or any loss arising from your use of the app. Equaly is a tracking tool, not a financial institution, and does not guarantee the resolution of any debt or dispute between users.',
                        ),

                        _buildSection(
                          theme,
                          title: '8. CHANGES TO THESE TERMS',
                          text: 'We may update these Terms as the app evolves. Continued use of the app after changes take effect constitutes acceptance of the updated Terms.',
                        ),

                        _buildSection(
                          theme,
                          title: '9. CONTACT',
                          text: 'Questions about these Terms can be sent to: devcodeinnovations@gmail.com',
                        ),

                        const SizedBox(height: 24),
                        const Divider(),
                        const SizedBox(height: 24),

                        // Cross-Link
                        Center(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => context.go('/equaly/privacy'),
                              child: Text(
                                'Looking for the Privacy Policy? View the Equaly Privacy Policy.',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
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
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
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
