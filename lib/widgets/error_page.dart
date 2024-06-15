import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_colors.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/image_view.dart';

import 'button_view.dart';

class ErrorPage extends StatelessWidget {
  final String statusCode;
  final Function() onTap;

  const ErrorPage({super.key, required this.statusCode, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                if (statusCode == "404") ...[
                  const SizedBox(
                     height: 199.34,
                      width: 229.5,
                    child: ImageView.svg(AppImages.notFound)),
                ] else if (statusCode == "500") ...[
                  const SizedBox(
                     height: 199.34,
                      width: 229.5,
                    child: ImageView.svg(AppImages.internalError)),
                ] else if (statusCode == "503") ...[
                  const SizedBox(
                     height: 199.34,
                      width: 229.5,
                    child: ImageView.svg(AppImages.maintenace)),
                ] else ...[
                  const SizedBox(
                      height: 199.34,
                      width: 229.5,
                      child: ImageView.svg(AppImages.noInternet)),
                ],
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                  child: Text(
                    (statusCode == "404")
                        ? 'Not Found'
                        : (statusCode == "500")
                            ? 'Internal Error'
                            : (statusCode == "503")
                                ? 'Maintenance'
                                : 'Opps an Error occur',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      height: 0.9,
                      color: const Color(0xFF131316),
                    ),
                  ),
                ),
                Text(
                  (statusCode == "404")
                      ? 'Whoops! this page is not available'
                      : (statusCode == "500")
                          ? 'Whoops! There seems to be a problem with our server'
                          : (statusCode == "503")
                              ? 'We’re undergoing maintenance'
                              : 'It seems you don’t have active internet',
                              textAlign: TextAlign.center,
                  style: GoogleFonts.getFont(
                    'Inter',
                    
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 1.5,
                    color: const Color(0xFF6B7280),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xFFFECDD3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (statusCode == "404") ...[
                        const ImageView.svg(AppImages.warningErrorIcon),
                      ] else if (statusCode == "500") ...[
                        const ImageView.svg(AppImages.supportIcon),
                      ] else if (statusCode == "503") ...[
                        const ImageView.svg(AppImages.supportIcon),
                      ] else ...[
                        const ImageView.svg(AppImages.refreshIcon),
                      ],
                      const SizedBox(
                        width: 12,
                      ),
                      Center(
                        child: Text(
                          (statusCode == "404")
                              ? 'Status Code: 404'
                              : (statusCode == "500")
                                  ? 'Contact support'
                                  : (statusCode == "503")
                                      ? 'Come back in 8hrs 24min'
                                      : 'Please refresh or try again',
                          style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.6,
                            color: const Color(0xFF131316),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ButtonView(
                    //processing: state is AccountLoading,
                    onPressed: () {
                      print('tapped');
                      onTap();
                    },
                    borderRadius: 100,
                    color: AppColors.lightSecondary,
                    child: Text(
                      (statusCode == "404")
                          ? 'Take me Home'
                          : (statusCode == "500")
                              ? 'Contact Support'
                              : (statusCode == "503")
                                  ? 'Okay'
                                  : 'Refresh',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.6,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
                   SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
