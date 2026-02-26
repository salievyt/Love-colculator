import 'package:flutter/material.dart';

class LoveResult extends StatelessWidget {
  final int percent;
  final bool showResult;
  final String resultText;

  const LoveResult({
    super.key,
    required this.percent,
    required this.showResult,
    required this.resultText,
  });

  Color _getPercentColor() {
    if (percent > 80) return const Color(0xFFFF6B9D);
    if (percent > 50) return const Color(0xFFFFABAB);
    if (percent > 30) return const Color(0xFFB4A0FF);
    return const Color(0xFF6B7FD7);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: showResult ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 400),
      child: AnimatedSlide(
        offset: showResult ? Offset.zero : const Offset(0, 0.3),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        child: Column(
          children: [
            Text(
              '$percent%',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w200,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: _getPercentColor().withValues(alpha: 0.8),
                    blurRadius: 30,
                  ),
                ],
              ),
            ),
            Text(
              resultText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: _getPercentColor(),
                letterSpacing: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
