import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/presentation/settings/wallet_page/withdrawal_screen.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/utils/navigator/page_navigator.dart';
import 'package:healthbubba/widgets/image_view.dart';

 
import '../../../widgets/modals.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 440,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    color: Color(0xFF299B68),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x21212614),
                        offset: Offset(0, 4),
                        blurRadius: 6,
                      ),
                      BoxShadow(
                        color: Color(0xFF238157),
                        offset: Offset(0, 0),
                        blurRadius: 0,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Color(0x0D000000),
                        offset: Offset(0, 1),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 12,
                  left: 12,
                  child: SafeArea(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                child: Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    shape: BoxShape.circle,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x21212614),
                                        offset: Offset(0, 4),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(
                                width: 55,
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x21212614),
                                      offset: Offset(0, 4),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ImageView.svg(AppImages.settingsIcon),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 20,
                  right: 20,
                  child: Column(
                    children: [
                      Text(
                        'Cleared Balance',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.7,
                          color: const Color(0xFFD2D2D2),
                        ),
                      ),
                      Text(
                        'N 0.00',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          height: 1.7,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Pending Balance',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          height: 1.7,
                          color: const Color(0xFFD2D2D2),
                        ),
                      ),
                      Text(
                        'N 1,000,000.00',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          height: 1.7,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          AppNavigator.pushAndStackPage(context, page: const WithdrawalScreen());
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                            child: Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                shape: BoxShape.circle,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x21212614),
                                    offset: Offset(0, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Withdraw',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 1.7,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transaction History',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      height: 1.7,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      itemCount: 6,
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return buildHistoryContainer(index, context);
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildHistoryContainer(int index, BuildContext context) {
    return ListTile(
      onTap: () {
        Modals.showBottomSheetModal(context,
            heightFactor: 0.6,
            isDissmissible: true,
            isScrollControlled: true,
            page: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: const BoxDecoration(
                         color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x21212614),
                                  offset: Offset(0, 4),
                                  blurRadius: 6,
                                ),
                              ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            (index % 2 == 0)
                                ? Icons.arrow_downward : Icons.arrow_upward,
                            color: (index % 2 == 0)
                                ? const Color(0xffFF0000)
                                : const Color(0xff299B68),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    child: Text(
                     (index % 2 == 0)
                                ? 'NGN -500.00 ' : 'NGN 17,000.00 ',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        height: 1.6,
                        color:  (index % 2 == 0)
                                ? const Color(0xffFF0000)
                                : const Color(0xff299B68),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    child: Text(
                      'Withdrawal from your cleared balance',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        height: 1.6,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x12000000),
                            offset: Offset(0, 0),
                            blurRadius: 0,
                            spreadRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFF7F7F7)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Transaction Details ',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      height: 1.6,
                                      color: const Color(0xFF131316),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x08000000),
                                  offset: Offset(0, 0),
                                  blurRadius: 0,
                                  spreadRadius: 1,
                                ),
                                BoxShadow(
                                  color: Color(0x0F191C21),
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                ),
                                BoxShadow(
                                  color: Color(0x14000000),
                                  offset: Offset(0, 0),
                                  blurRadius: 2,
                                  spreadRadius: 0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Transaction Date',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        height: 1.4,
                                        color: const Color(0xFF6B7280),
                                      ),
                                    ),
                                    Text(
                                      'May 18, 2024',
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        height: 1.4,
                                        color: const Color(0xFF131316),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Transaction Time',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        height: 1.4,
                                        color: const Color(0xFF6B7280),
                                      ),
                                    ),
                                    Text(
                                      '10:00 AM',
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        height: 1.4,
                                        color: const Color(0xFF131316),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Wallet Balance',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        height: 1.4,
                                        color: const Color(0xFF6B7280),
                                      ),
                                    ),
                                    Text(
                                      'NGN 5,000',
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        height: 1.4,
                                        color: const Color(0xFF131316),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Transaction ID',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        height: 1.4,
                                        color: const Color(0xFF6B7280),
                                      ),
                                    ),
                                    Text(
                                      '2398DGDC7CS873',
                                      textAlign: TextAlign.end,
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        height: 1.4,
                                        color: const Color(0xFF131316),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ));
      },
      contentPadding: const EdgeInsets.all(0),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 65,
          height: 65,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x14123769),
                offset: Offset(0, 4),
                blurRadius: 8,
              ),
              BoxShadow(
                color: Color(0x0A123769),
                offset: Offset(0, 2),
                blurRadius: 2,
              ),
              BoxShadow(
                color: Color(0x14123769),
                offset: Offset(0, 0),
                blurRadius: 0,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: (index % 2 == 0)
                ? const Icon(
                    Icons.arrow_downward,
                    color: Color(0xffFF0000),
                  )
                : const Icon(
                    Icons.arrow_upward,
                    color: Color(0xff299B68),
                  ),
          ),
        ),
      ),
      title: Text(
        (index % 2 == 0) ? 'Withdrawal' : 'Alex Ogunyemi Consultation',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.7,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        (index % 2 == 0) ? 'ID: 39828CBE83' : 'Order #3287DSF',
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.7,
          color: const Color(0xff5E5F6E),
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'N 500',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 1.7,
              color: (index % 2 == 0)
                  ? const Color(0xffFF0000)
                  : const Color(0xff299B68),
            ),
          ),
          Text(
            'Feb 14th, 19:03',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 1.7,
              color: const Color(0xff5E5F6E),
            ),
          ),
        ],
      ),
    );
  }
}
