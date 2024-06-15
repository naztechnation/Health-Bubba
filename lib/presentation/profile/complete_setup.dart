import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/navigator/page_navigator.dart';
import '../dashboard/dashboard.dart';

class CompleteSetUpScreen extends StatefulWidget {
  const CompleteSetUpScreen({super.key});

  @override
  _CompleteSetUpScreenState createState() => _CompleteSetUpScreenState();
}

class _CompleteSetUpScreenState extends State<CompleteSetUpScreen> {
  double _progress = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_progress < 1.0) {
        setState(() {
          _progress += Random().nextDouble() * 0.1;
          if (_progress > 1.0) {
            _progress = 1.0;
          }
        });
      } else {
        _timer.cancel();
        _onComplete();
      }
    });
  }

  void _onComplete() {
    AppNavigator.pushAndReplacePage(context,
                              page: const Dashboard());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              child: Text(
                'Setting Up Your Account',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  height: 1.4,
                  color: const Color(0xFF0A0D14),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 149.19,
                  height: 149.19,
                  child: CustomPaint(
                    painter: ProgressPainter(progress: _progress),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      '${(_progress * 100).round()}%',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        height: 1.4,
                        color: const Color(0xFF0A0D14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = const Color(0xFFB1E2AF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13   
      ..strokeCap = StrokeCap.round;

    Paint progressPaint = Paint()
      ..color = const Color(0xFF40B93C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13   
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (size.width / 2) - 10;   

    canvas.drawCircle(center, radius, backgroundPaint);

    double sweepAngle = 2 * pi * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

 
