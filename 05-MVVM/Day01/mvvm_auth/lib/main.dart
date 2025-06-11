import 'package:flutter/material.dart';
import 'package:mvvm_auth/core/services/preference_manager.dart';
import 'package:mvvm_auth/core/theme/dark_theme.dart';
import 'package:mvvm_auth/core/theme/light_theme.dart';
import 'package:mvvm_auth/core/theme/theme_controller.dart';
import 'package:mvvm_auth/features/auth/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager().init();
  await ThemeController().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
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
          home: SignUpScreen(),
          
        );
      },
    );
  }
}