import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  NavigationService._();

  static final Map<String, GlobalKey> sectionKeys = {
    'hero': GlobalKey(debugLabel: 'hero'),
    'about': GlobalKey(debugLabel: 'about'),
    'services': GlobalKey(debugLabel: 'services'),
    'technologies': GlobalKey(debugLabel: 'technologies'),
    'why': GlobalKey(debugLabel: 'why'),
    'contact': GlobalKey(debugLabel: 'contact'),
  };

  static void scrollToSection(BuildContext context, String sectionId) {
    // If not on Home page, go to Home page first
    final currentRoute = GoRouterState.of(context).uri.path;
    
    if (currentRoute != '/') {
      context.go('/');
      // Wait for the Home Page to build, then scroll
      Future.delayed(const Duration(milliseconds: 400), () {
        _performScroll(sectionId);
      });
    } else {
      _performScroll(sectionId);
    }
  }

  static void _performScroll(String sectionId) {
    final key = sectionKeys[sectionId];
    if (key == null) return;

    final currentContext = key.currentContext;
    if (currentContext != null) {
      Scrollable.ensureVisible(
        currentContext,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }
}
