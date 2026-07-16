import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velotask/widgets/utils/app_theme.dart';
import 'providers/task_provider.dart';
import 'widgets/screens/home_screen.dart';
import 'widgets/utils/constants.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const VeloTaskApp(),
    ),
  );
}

class VeloTaskApp extends StatelessWidget {
  const VeloTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VeloTask',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}