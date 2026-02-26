import 'package:flutter/material.dart';
import 'package:love_colculator/heart_painter.dart';

class AnimatedLoveHeart extends StatefulWidget {
  final int percent;

  const AnimatedLoveHeart({super.key, required this.percent});

  @override
  State<AnimatedLoveHeart> createState() => _AnimatedLoveHeartState();
}

class _AnimatedLoveHeartState extends State<AnimatedLoveHeart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fillAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _updateAnimation();
  }

  @override
  void didUpdateWidget(covariant AnimatedLoveHeart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percent != widget.percent) {
      _updateAnimation();
    }
  }

  void _updateAnimation() {
    _fillAnimation = Tween<double>(
      begin: 0,
      end: widget.percent / 100,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: AnimatedBuilder(
        animation: _fillAnimation,
        builder: (context, _) {
          return Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(200, 200),
                painter: HeartPainter(
                  fillPercent: _fillAnimation.value,
                ),
              ),
              Text(
                '${widget.percent}%',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}