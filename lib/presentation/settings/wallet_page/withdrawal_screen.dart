import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../model/view_model/onboard_view_model.dart';
import '../../../res/app_colors.dart';
import '../../../res/app_images.dart';
import '../../../utils/validator.dart';
import '../../../widgets/button_view.dart';
import '../../../widgets/image_view.dart';
import '../../../widgets/modals.dart';
import '../../../widgets/text_edit_view.dart';

class WithdrawalScreen extends StatefulWidget {
  const WithdrawalScreen({super.key});

  @override
  State<WithdrawalScreen> createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  @override
  Widget build(BuildContext context) {
    final userAuth = Provider.of<OnboardViewModel>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Withdraw',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 12.0, top: 19, bottom: 19),
            child: SizedBox(
              width: 15,
              height: 15,
              child: ImageView.svg(
                AppImages.backBtn,
                height: 15,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 120,
                decoration: const BoxDecoration(
                  color: Color(0xFF299B68),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14212126),
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
                top: 30,
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
                      'N 56,000.00',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        height: 1.7,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Amount to Withdraw',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.4,
                        color: const Color(0xFF131316),
                      ),
                    ),
                  ),
                ),
                TextEditView(
                  controller: TextEditingController(),
                  borderColor: Colors.grey.shade200,
                  borderWidth: 0.5,
                  hintText: ' ',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "₦",
                      style: GoogleFonts.inter(
                          fontSize: 20, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  validator: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Destination Bank Account',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.4,
                        color: const Color(0xFF131316),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF3C7),
                    borderRadius: BorderRadius.circular(16),
                    border: const Border(
                      bottom: BorderSide(
                        color: Color(0xFFE2E4E9),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ImageView.svg(AppImages.bankIcon),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Polaris Bank",
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.4,
                              color: const Color(0xFF131316),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Alexander Ogunyemi",
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 1.4,
                              color: const Color(0xFF5E5F6E),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "3028426150",
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 1.4,
                              color: const Color(0xFF5E5F6E),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Password',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.4,
                    color: const Color(0xFF131316),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextEditView(
                  controller: TextEditingController(),
                  borderColor: Colors.grey.shade200,
                  borderWidth: 0.5,
                  onChanged: (value) {},
                  validator: (value) {
                    return Validator.validate(value, 'Password');
                  },
                  obscureText: userAuth.showPasswordStatus,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      userAuth.showPassword();
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: userAuth.showPasswordStatus
                            ? const ImageView.svg(
                                AppImages.eyeClosedIcon,
                                color: Colors.grey,
                              )
                            : const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: ImageView.svg(
                                  AppImages.eyeOpenIcon,
                                  color: Colors.grey,
                                ),
                              )),
                  ),
                ),
                const SizedBox(height: 100,),
                ButtonView(
                                onPressed: () {
                                  
                                  Modals.showBottomSheetModal(context,
                    heightFactor: 0.45,
                    isDissmissible: true,
                    isScrollControlled: true,
                    page: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                         Container(
                    padding: const EdgeInsets.all(14),
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x14020617),
                          offset: Offset(0, 0),
                          blurRadius: 0,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Color(0x0A020617),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          spreadRadius: -2,
                        ),
                        BoxShadow(
                          color: Color(0x14020617),
                          offset: Offset(0, 6),
                          blurRadius: 6,
                          spreadRadius: -3,
                        ),
                        BoxShadow(
                          color: Color(0x05020617),
                          offset: Offset(0, 2),
                          blurRadius: 2,
                          spreadRadius: -1,
                        ),
                        BoxShadow(
                          color: Color(0x14020617),
                          offset: Offset(0, 1),
                          blurRadius: 1,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ImageView.svg(AppImages.check, height: 10,),
                    )),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Withdrawal Successful',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 1.6,
                              color: const Color(0xFF131316),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Your withdrawal has been process and will arrive in your bank account shortly',
                            
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Inter',
                              
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1.6,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          ButtonView(
                              onPressed: () {
                                Navigator.pop(context);
                               
                              },
                              borderRadius: 100,
                              color: AppColors.lightSecondary,
                              child: const Text(
                                'Okay',
                                style: TextStyle(
                                    color: AppColors.lightPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              )),
                        ],
                      ),
                    ));
                                  FocusScope.of(context).unfocus();
                                },
                                borderRadius: 100,
                                color: AppColors.lightSecondary,
                                child: const Text(
                                  'Confirm Withdrawal',
                                  style: TextStyle(
                                      color: AppColors.lightPrimary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
