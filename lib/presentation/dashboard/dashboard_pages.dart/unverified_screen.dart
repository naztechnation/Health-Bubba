import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/dashboard/dashboard.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';

import '../../../res/app_colors.dart';
import '../../../utils/navigator/page_navigator.dart';

class PendingVerification extends StatelessWidget {
  const PendingVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: const Color(0xFFFFFFFF),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0A000000),
                    offset: Offset(0, 1),
                    blurRadius: 1.5,
                  ),
                  BoxShadow(
                    color: Color(0x0D2F3037),
                    offset: Offset(0, 24),
                    blurRadius: 34,
                  ),
                  BoxShadow(
                    color: Color(0x0A222A35),
                    offset: Offset(0, 4),
                    blurRadius: 3,
                  ),
                  BoxShadow(
                    color: Color(0x0D000000),
                    offset: Offset(0, 1),
                    blurRadius: 0.5,
                  ),
                ],
              ),
              child: const ImageView.asset(AppImages.verifyIcon),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Pending Verification',
              style: GoogleFonts.getFont(
                'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: const Color(0xFF0A0D14),
                decorationColor: const Color(0xFF15141D),
              ),
            ),
             const SizedBox(
              height: 15,
            ),
            Text(
              'Your account is currently pending verification and you won’t be able to take this action at this time',
              style: GoogleFonts.getFont(
                'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFF6B7280),
                
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                AppNavigator.pushAndReplacePage(context, page: const Dashboard());
              },
              child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                      color: AppColors.lightPrimary,
                      border: Border.all(color: Colors.grey, width: 0.5)),
                  child: const Center(
                    child: Text(
                      'Go back to dashboard',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
