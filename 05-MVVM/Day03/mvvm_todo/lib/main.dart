import 'package:flutter/material.dart';
import 'package:mvvm_todo/core/services/preference_manager.dart';
import 'package:mvvm_todo/core/theme/dark_theme.dart';
import 'package:mvvm_todo/core/theme/light_theme.dart';
import 'package:mvvm_todo/core/theme/theme_controller.dart';
import 'package:mvvm_todo/features/home/presentation/screens/home_screen.dart';
import 'package:mvvm_todo/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager().init();
  ThemeController().init();

  setupLocatot();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.themeNotifier,
      builder: (context, value, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'YumSlice',
          themeMode: value,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: HomeScreen(),
        );
      });
  }
}
