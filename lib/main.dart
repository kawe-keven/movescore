import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MoveScoreApp());
}

class MoveScoreApp extends StatelessWidget {
  const MoveScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoveScore',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}
