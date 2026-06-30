import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/widgets/navbar.dart';
import '../core/widgets/mobile_drawer.dart';
import '../core/widgets/footer.dart';
import '../core/widgets/glass_container.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Title(
      title: 'Delete Account - Equally | Devora Studios',
      color: theme.colorScheme.primary,
      child: Scaffold(
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
                          'Delete Your Equally Account',
                          style: theme.textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1.0,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Last Updated: June 30, 2026',
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
              
              // Body Content
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
                            'Equally lets you permanently delete your account and associated data directly from the app. Follow the steps below.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 16,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 32),
                          
                          _buildSection(
                            theme,
                            title: 'HOW TO DELETE YOUR ACCOUNT',
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildStep(theme, 1, 'Open the Equally app'),
                                _buildStep(theme, 2, 'Go to the Profile tab'),
                                _buildStep(theme, 3, 'Tap "Edit Profile"'),
                                _buildStep(theme, 4, 'Scroll down to the "Danger Zone" and tap "Delete Account"'),
                                _buildStep(theme, 5, 'Confirm the deletion when prompted'),
                              ],
                            ),
                          ),

                          _buildSection(
                            theme,
                            title: 'WHAT GETS DELETED',
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildBulletPoint(theme, 'Your account profile details (full name, username, email address, profile photo, bio, and phone number)'),
                              ],
                            ),
                          ),

                          _buildSection(
                            theme,
                            title: 'WHAT MAY BE RETAINED',
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildBulletPoint(theme, 'Expense and settlement records you participated in within shared groups may remain associated with those groups, since other group members rely on this history for accurate balances.'),
                              ],
                            ),
                          ),

                          _buildSection(
                            theme,
                            title: 'PROCESSING TIME',
                            child: Text(
                              'Account deletion is processed immediately when you confirm in the app.',
                              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15, height: 1.6),
                            ),
                          ),

                          _buildSection(
                            theme,
                            title: 'CONTACT FALLBACK & HELP',
                            child: Text(
                              'If you\'re unable to access the app or need help, email devcodeinnovations@gmail.com with the subject \'Delete My Equally Account\' from your registered email address, and we will process your request within 7 business days.',
                              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15, height: 1.6),
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
      ),
    );
  }

  Widget _buildSection(ThemeData theme, {required String title, required Widget child}) {
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
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildStep(ThemeData theme, int index, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Text(
              '$index',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 14.5,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(ThemeData theme, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 4, right: 12),
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 14.5,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
