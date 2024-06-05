import 'package:flutter/material.dart';

class TimeSlot extends StatelessWidget {
  final int index;
  final bool isSelected;

  TimeSlot({required this.index, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.white,
        border: const Border(
          top: BorderSide(
            color: Color(0xFFE5E7EB),
            width: 1,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, -4),
            blurRadius: 8.8999996185,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: isSelected ? Colors.white : const Color(0xFF093126),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33212126),
                offset: Offset(0, 1),
                blurRadius: 1.5,
              ),
              BoxShadow(
                color: Color(0xFF083025),
                offset: Offset(0, 0),
                blurRadius: 0,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: () {
              // Handle button tap
              print('Button ${index + 1} tapped');
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                isSelected ? Colors.black : const Color(0xFF093126),
              ),
              foregroundColor: MaterialStateProperty.all<Color>(
                isSelected ? Colors.white : const Color(0xFF093126),
              ),
            ),
            child: Text(
              'Schedule an Appointment ${index + 1}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}