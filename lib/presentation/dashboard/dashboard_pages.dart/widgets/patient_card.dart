import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/utils/app_utils.dart';
import 'package:intl/intl.dart';

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
                      child: Row(
                        children: [
                          Text(
                            AppUtils.toTitleCase(patients.sex ?? ''),
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              height: 1.7,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                          Text(
                            " • ",
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              height: 1.7,
                              color:   Colors.grey.shade300,
                            ),
                          ),
                          Text(
                            (patients.dob == null)
                                            ? ''
                                            : calculateAge(
                                                patients.dob ?? ''),
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              height: 1.7,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                          Text(
                            ( ' years'),
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              height: 1.7,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6,),
              color: const Color(0xffF3F4F6),
              border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
              
              ),
              child: Text(patients.patientStatus.toString().toUpperCase() ?? '',
               style: GoogleFonts.getFont(
                          'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          height: 1.7,
                          color: const Color(0xFF838487),
                        ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
 String calculateAge(String birthdate) {
    if (birthdate.isEmpty) {
      return '';
    }

    try {
      DateTime birthDate = DateFormat('yyyy-MM-dd').parse(birthdate);
      DateTime today = DateTime.now();
      int age = today.year - birthDate.year;

      if (today.month < birthDate.month ||
          (today.month == birthDate.month && today.day < birthDate.day)) {
        age--;
      }

      return age.toString();
    } catch (e) {
      return 'Invalid date format';
    }
  }
