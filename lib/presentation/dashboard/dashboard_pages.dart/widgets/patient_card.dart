import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/utils/app_utils.dart';

import '../../../../model/patients/patients_list.dart';
import '../../../../res/app_images.dart';
import '../../../../widgets/image_view.dart';

patientCard({required BuildContext context, required Patients patients}) {
  return Container(
    width: MediaQuery.sizeOf(context).width,
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
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
    child: SizedBox(
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: SizedBox(
                      width: 42.1,
                      height: 43,
                      child: Image.network(
                        fit: BoxFit.cover,
                        patients.picture ?? '',
                        errorBuilder: (context, error, stackTrace) {
                          return const ImageView.asset(AppImages.avatarIcon);
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const ImageView.asset(AppImages.avatarIcon);
                        },
                      )),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patients.firstName ?? '',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.4,
                        color: const Color(0xFF0A0D14),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppUtils.toTitleCase(patients.sex ?? ''),
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.7,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey.shade500,
            )
          ],
        ),
      ),
    ),
  );
}
