import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final VoidCallback onTap;

  const CalculateButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: [
              Colors.pink.shade600,
              Colors.pink.shade400,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.pink.withValues(alpha: 0.4),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: const Text(
          'ПРОВЕРИТЬ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 4,
          ),
        ),
      ),
    );
  }
}
