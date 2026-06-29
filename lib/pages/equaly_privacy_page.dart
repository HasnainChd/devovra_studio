import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/widgets/navbar.dart';
import '../core/widgets/mobile_drawer.dart';
import '../core/widgets/footer.dart';
import '../core/widgets/glass_container.dart';

class EqualyPrivacyPage extends StatelessWidget {
  const EqualyPrivacyPage({super.key});

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
                        'Privacy Policy — Equaly',
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
                        Text(
                          'Equaly ("the app") is operated by Devora Studios. This policy explains what data we collect, why, and how it\'s handled.',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        _buildSection(
                          theme,
                          title: 'INFORMATION WE COLLECT',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSubSection(
                                theme,
                                subTitle: 'Account Information',
                                text: 'When you create an account, we collect your full name, username, email address, and optionally a profile photo. If you sign in with Google, we receive your name, email, and profile photo from your Google account.',
                              ),
                              _buildSubSection(
                                theme,
                                subTitle: 'Financial & Expense Data',
                                text: 'We collect the expense and balance information you enter, including expense descriptions, amounts, categories, split details (who owes what), payment/settlement records, and currency preferences. This data is necessary for the app\'s core function of tracking shared expenses between you and other users.',
                              ),
                              _buildSubSection(
                                theme,
                                subTitle: 'Group & Contact Information',
                                text: 'When you create or join groups, we store group names, member lists, and the connections between users within shared groups.',
                              ),
                              _buildSubSection(
                                theme,
                                subTitle: 'Receipt Images',
                                text: 'If you choose to attach a photo of a receipt to an expense, that image is uploaded and stored securely.',
                              ),
                              _buildSubSection(
                                theme,
                                subTitle: 'Device & Notification Data',
                                text: 'We collect a device token to deliver push notifications (such as new expense alerts or payment reminders). We do not use this token for any purpose other than sending you app-related notifications.',
                              ),
                            ],
                          ),
                        ),

                        _buildSection(
                          theme,
                          title: 'HOW WE USE YOUR INFORMATION',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildBulletPoint(theme, 'To provide the app\'s core functionality: tracking, splitting, and settling shared expenses between users you choose to connect with'),
                              _buildBulletPoint(theme, 'To sync your data across your devices'),
                              _buildBulletPoint(theme, 'To send you notifications about activity relevant to you (new expenses, settlements, group updates)'),
                              _buildBulletPoint(theme, 'To improve app performance and fix issues'),
                            ],
                          ),
                        ),

                        _buildSection(
                          theme,
                          title: 'THIRD-PARTY SERVICES WE USE',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Equaly relies on the following third-party infrastructure providers to operate. These providers process data on our behalf under their own security and privacy standards:',
                                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15, height: 1.6),
                              ),
                              const SizedBox(height: 16),
                              _buildBulletPoint(theme, 'Supabase: our primary database, authentication, and file storage provider. Account information, expense data, and group data are stored here.'),
                              _buildBulletPoint(theme, 'Firebase Cloud Messaging (Google): used solely to deliver push notifications to your device.'),
                              _buildBulletPoint(theme, 'Cloudinary: used to store receipt images you choose to upload.'),
                              const SizedBox(height: 16),
                              Text(
                                'We do not sell your personal or financial data to any third party, and we do not use your data for advertising purposes.',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        ),

                        _buildSection(
                          theme,
                          title: 'DATA STORAGE & SECURITY',
                          child: Text(
                            'Your data is protected using industry-standard security practices, including encrypted connections and access controls (Row Level Security) that restrict who can view your information to only you and the members of groups you\'ve joined.',
                            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15, height: 1.6),
                          ),
                        ),

                        _buildSection(
                          theme,
                          title: 'YOUR RIGHTS',
                          child: Text(
                            'You can request access to, correction of, or deletion of your personal data at any time by contacting us at the email below. You may also delete your account directly within the app\'s settings, which will remove your profile information; some historical expense records shared with other group members may be retained to preserve the accuracy of those other users\' financial records.',
                            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15, height: 1.6),
                          ),
                        ),

                        _buildSection(
                          theme,
                          title: 'CHILDREN\'S PRIVACY',
                          child: Text(
                            'Equaly is not directed at children under 13, and we do not knowingly collect data from children under 13.',
                            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15, height: 1.6),
                          ),
                        ),

                        _buildSection(
                          theme,
                          title: 'CHANGES TO THIS POLICY',
                          child: Text(
                            'We may update this policy as the app evolves. Material changes will be reflected with an updated "Last updated" date at the top of this page.',
                            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15, height: 1.6),
                          ),
                        ),

                        _buildSection(
                          theme,
                          title: 'CONTACT US',
                          child: Text(
                            'If you have questions about this policy or your data, contact us at: devcodeinnovations@gmail.com',
                            style: theme.textTheme.bodyMedium?.copyWith(fontSize: 15, height: 1.6),
                          ),
                        ),

                        const SizedBox(height: 24),
                        const Divider(),
                        const SizedBox(height: 24),

                        // Cross-Link
                        Center(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => context.go('/equaly/terms'),
                              child: Text(
                                'Looking for the Terms of Service? View the Equaly Terms of Service.',
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

  Widget _buildSubSection(ThemeData theme, {required String subTitle, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subTitle,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 14.5,
              height: 1.6,
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
