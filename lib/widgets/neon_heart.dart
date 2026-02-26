import 'package:flutter/material.dart';
import 'package:love_colculator/animated_love_heart.dart';

class NeonHeart extends StatelessWidget {
  final int percent;
  final bool showResult;

  const NeonHeart({
    super.key,
    required this.percent,
    required this.showResult,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.85, end: showResult ? 1.0 : 0.85),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutBack,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.pink.withValues(alpha: 0.3),
              blurRadius: 60,
              spreadRadius: 10,
            ),
            BoxShadow(
              color: Colors.red.withValues(alpha: 0.5),
              blurRadius: 30,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedLoveHeart(percent: percent),
            if (!showResult)
              Icon(
                Icons.favorite,
                size: 48,
                color: Colors.pink.withValues(alpha: 0.3),
              ),
          ],
        ),
      ),
    );
  }
}
