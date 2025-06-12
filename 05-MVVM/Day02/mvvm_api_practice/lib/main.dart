import 'package:flutter/material.dart';
import 'package:mvvm_api_practice/core/services/preference_manager.dart';
import 'package:mvvm_api_practice/core/services/service_locator.dart';
import 'package:mvvm_api_practice/core/theme/dark_theme.dart';
import 'package:mvvm_api_practice/core/theme/light_theme.dart';
import 'package:mvvm_api_practice/core/theme/theme_controller.dart';
import 'package:mvvm_api_practice/features/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager().init();
  await ThemeController().init();

  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeController.themeNotifier,
      builder: (_, value, _) {
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
