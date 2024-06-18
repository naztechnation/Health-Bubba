

 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'package:healthbubba/res/app_colors.dart';

class LoadersPage extends StatefulWidget {
  final int length;
  const LoadersPage({this.length = 5, Key? key}) : super(key: key);

  @override
  State<LoadersPage> createState() => _LoadersPageState();
}

class _LoadersPageState extends State<LoadersPage> {

   

  
   @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CustomCircularProgressIndicator(
                progressColor: AppColors.lightSecondary,
                backgroundColor: AppColors.lightSecondary.withOpacity(0.5),
                strokeWidth: 9,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: 9,),
          Text(
                                                  'Please wait...',
                                                  
                                                  style: GoogleFonts.getFont(
                                                    fontStyle: FontStyle.italic,
                                                    'Inter',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    height: 1.4,
                                                    color:
                                                        const Color(0xFF131316),
                                                  ),
                                                ),
        ],
      ),
    );
  }
}

class CustomCircularProgressIndicator extends StatefulWidget {
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;
  final double size;

  const CustomCircularProgressIndicator({
    super.key,
    required this.progressColor,
    required this.backgroundColor,
    required this.strokeWidth,
    required this.size,
  });

  @override
  _CustomCircularProgressIndicatorState createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _CircularProgressPainter(
              progress: _controller.value,
              progressColor: widget.progressColor,
              backgroundColor: widget.backgroundColor,
              strokeWidth: widget.strokeWidth,
            ),
          );
        },
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final double strokeWidth;

  _CircularProgressPainter({
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Paint progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double radius = (size.width / 2) - (strokeWidth / 2);
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double startAngle = - math.pi / 2;
    final double sweepAngle = 2 * math.pi * progress;

    // Draw the background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.progressColor != progressColor ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}