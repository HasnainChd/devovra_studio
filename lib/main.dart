import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_manager.dart';
import 'services/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DevoraStudiosApp());
}

class DevoraStudiosApp extends StatelessWidget {
  const DevoraStudiosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeManager.themeModeNotifier,
      builder: (context, themeMode, _) {
        return MaterialApp.router(
          title: 'Devora Studios',
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routerConfig: appRouter,
        );
      },
    );
  }
}
