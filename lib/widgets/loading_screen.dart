import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_colors.dart';

class LoadersPage extends StatelessWidget {
  final int length;
  const LoadersPage({this.length = 5, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.lightSecondary),
              backgroundColor: AppColors.lightSecondary.withOpacity(0.5),
              strokeWidth: 6,
            ),
            const SizedBox(height: 9),
            Text(
              'Please wait...',
              style: GoogleFonts.getFont(
                'Inter',
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 1.4,
                color: const Color(0xFF131316),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
