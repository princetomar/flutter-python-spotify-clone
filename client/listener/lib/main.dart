import 'package:flutter/material.dart';
import 'package:listener/src/core/theme/theme.dart';
import 'package:listener/src/features/auth/presentation/pages/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      debugShowCheckedModeBanner: false,
      home: const SignUpPage(),
    );
  }
}
