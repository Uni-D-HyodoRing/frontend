import 'package:flutter/material.dart';
import 'package:frontend/const/app_color.dart';

class ScoreRing extends StatelessWidget {
  final double score; // 0.0 to 1.0
  final double size;
  final double strokeWidth;

  const ScoreRing({
    super.key,
    required this.score,
    this.size = 200.0,
    this.strokeWidth = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ScoreRingPainter(
        score: score,
        strokeWidth: strokeWidth,
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor, // 진한 오렌지
            Colors.white, // 연한 오렌지
          ],
          stops: [0.0, 1.0],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
    );
  }
}

class _ScoreRingPainter extends CustomPainter {
  final double score;
  final double strokeWidth;
  final Gradient gradient;

  _ScoreRingPainter({
    required this.score,
    required this.strokeWidth,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    // 흰색 베이스 원 그리기
    final whitePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Colors.white;

    canvas.drawCircle(center, radius, whitePaint);

    // 그라데이션 마스크 생성
    final gradientPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = LinearGradient(
        colors: [
          AppColors.primaryColor,
          Colors.white,
        ],
        stops: [0.0, score / 100], // score에 따라 그라데이션 비중 조절
        begin: const Alignment(-1.0, 1.0),
        end: const Alignment(1.0, -1.0),
      ).createShader(rect);

    // 완전한 원 그리기
    canvas.drawCircle(center, radius, gradientPaint);

    // 퍼센트 텍스트 그리기
    final textSpan = TextSpan(
      text: '${score.toInt()}%',
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: size.width * 0.2,
        fontWeight: FontWeight.bold,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final textOffset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
