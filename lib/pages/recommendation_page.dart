import 'package:flutter/material.dart';
import 'dart:math' as math;

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy progress values (0.0 - 1.0 arası)
    final fullBodyProgress = 0.8;
    final upperProgress = 0.6;
    final lowerProgress = 0.4;
    final cardioProgress = 0.2;

    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8E8E8),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Recommendation",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
        children: [
          const SizedBox(height: 10),

          // 4 HALKALI APPLE STYLE RING
          Center(
            child: SizedBox(
              width: 230,
              height: 230,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _buildRing(cardioProgress, 110, Colors.redAccent),
                  _buildRing(lowerProgress, 140, const Color(0xFFFFD60A)),
                  _buildRing(upperProgress, 170, Colors.blueAccent),
                  _buildRing(fullBodyProgress, 200, Colors.greenAccent),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),

          // TODAY
          const Text(
            "TODAY'S SUGGESTION",
            style: TextStyle(
              fontSize: 13,
              letterSpacing: 1,
              color: Colors.black54,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          const Text(
            "Full Body Day 💪",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 28),

          // RECOMMENDED LIST TITLE
          const Text(
            "Recommended Exercises",
            style: TextStyle(
              fontSize: 15,
              letterSpacing: .5,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),

          // EXERCISE LIST
          _buildExerciseTile("Squat — 3×10"),
          _buildExerciseTile("Chest Press — 3×10"),
          _buildExerciseTile("Lat Pulldown — 3×10"),
          _buildExerciseTile("Plank — 1×20"),
        ],
      ),
    );
  }

  // HALKA ÇİZEN WIDGET
  Widget _buildRing(double progress, double size, Color color) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _RingPainter(progress: progress, color: color),
      ),
    );
  }

  // LİSTE ELEMANI
  Widget _buildExerciseTile(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}

// CUSTOM RING PAINTER (APPLE STYLE - TELİFSİZ)
class _RingPainter extends CustomPainter {
  final double progress;
  final Color color;

  _RingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 14.0;
    final radius = size.width / 2;

    // Background (light ring)
    final bgPaint = Paint()
      ..color = color.withOpacity(0.18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Progress (foreground ring)
    final fgPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);

    // Draw background ring
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi * 1.5,
      math.pi * 2,
      false,
      bgPaint,
    );

    // Draw progress ring
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi * 1.5,
      math.pi * 2 * progress,
      false,
      fgPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}