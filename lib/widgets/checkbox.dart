import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isChecked = false;

  void _toggleCheckbox() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: Container(
          decoration: BoxDecoration(color: Colors.white,
           borderRadius: BorderRadius.circular(6),
           boxShadow: const [
            BoxShadow(
              color: Color(0xFFE5E7EB),
              offset: Offset(0, 0),
              blurRadius: 0,
            ),
            BoxShadow(
              color: Color(0x33030712),
              offset: Offset(0, 1),
              blurRadius: 2,
            ),
          ],
           ),

        child: CustomPaint(
          painter: CheckboxPainter(isChecked: _isChecked),
          child: const SizedBox(
            width: 23,
            height: 23,
          ),
        ),
      ),
    );
  }
}

class CheckboxPainter extends CustomPainter {
  final bool isChecked;

  CheckboxPainter({required this.isChecked});

  @override
  void paint(Canvas canvas, Size size) {
    double borderRadius = 6.0;

    // Draw the shadow (elevation)
    Paint shadowPaint = Paint()
      ..color = Colors.black  ;
     // ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    Rect shadowRect = Rect.fromLTWH(4, 4, size.width - 8, size.height -  8);
    RRect shadowRRect = RRect.fromRectAndRadius(shadowRect, Radius.circular(borderRadius));
    canvas.drawRRect(shadowRRect, shadowPaint);

     
    Paint boxPaint = Paint()
      ..color = isChecked ? Colors.green : Colors.white
      ..style = PaintingStyle.fill;

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));
    canvas.drawRRect(rRect, boxPaint);

    if (isChecked) {
    
      Paint checkPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;

      
      Path path = Path()
        ..moveTo(size.width * 0.2, size.height * 0.5)
        ..lineTo(size.width * 0.4, size.height * 0.7)
        ..lineTo(size.width * 0.8, size.height * 0.3);

      
      canvas.drawPath(path, checkPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
