import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/widgets/navbar.dart';
import '../core/widgets/mobile_drawer.dart';
import '../core/widgets/footer.dart';
import '../core/widgets/custom_button.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

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
            // Centered 404 Hero Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 120),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Large 404 Gradient Text
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Color(0xFF4F46E5), Color(0xFFEC4899)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                        child: Text(
                          '404',
                          style: theme.textTheme.displayLarge?.copyWith(
                            fontSize: 100,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: -2.0,
                          ),
                        ),
                      ).animate().fade(duration: 500.ms).scale(begin: const Offset(0.8, 0.8)),
                      
                      const SizedBox(height: 16),
                      
                      Text(
                        'Page Not Found',
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ).animate().fade(delay: 200.ms).slideY(begin: 0.2, end: 0),
                      
                      const SizedBox(height: 16),
                      
                      Text(
                        'The page you are looking for does not exist, has been removed, or has been temporarily relocated.',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
                        ),
                      ).animate().fade(delay: 300.ms).slideY(begin: 0.2, end: 0),
                      
                      const SizedBox(height: 40),
                      
                      // Custom button back to home
                      CustomButton(
                        text: 'Return to Home',
                        icon: Icons.home_outlined,
                        onPressed: () => context.go('/'),
                      ).animate().fade(delay: 400.ms).slideY(begin: 0.2, end: 0),
                    ],
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
}
