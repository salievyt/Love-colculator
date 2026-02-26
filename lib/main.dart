import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'widgets/widgets.dart';

void main() {
  runApp(MaterialApp(home: const App(), debugShowCheckedModeBanner: false));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

final random = Random();
String getResultText(int percent) {
  if (percent > 80) return 'Идеальная пара';
  if (percent > 50) return 'Есть шанс';
  if (percent > 30) return 'Ну такое';
  if (percent == 0) return '';
  return 'Лучше друзья';
}

class _AppState extends State<App> {
  int lovePercent = 0;
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  bool _showResult = false;

  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    super.dispose();
  }

  void _calculateLove() {
    if (firstNameController.text.trim().isEmpty ||
        secondNameController.text.trim().isEmpty) {
      HapticFeedback.heavyImpact();
      return;
    }
    HapticFeedback.mediumImpact();
    setState(() {
      lovePercent = random.nextInt(101);
      _showResult = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D0D0D),
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const Spacer(flex: 1),
                NeonHeart(percent: lovePercent, showResult: _showResult),
                const SizedBox(height: 40),
                LoveResult(
                  percent: lovePercent,
                  showResult: _showResult,
                  resultText: getResultText(lovePercent),
                ),
                const Spacer(flex: 1),
                NameInput(
                  controller: firstNameController,
                  hint: 'Твое имя',
                ),
                const SizedBox(height: 12),
                NameInput(
                  controller: secondNameController,
                  hint: 'Имя избранного',
                ),
                const SizedBox(height: 24),
                CalculateButton(onTap: _calculateLove),
                const Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
