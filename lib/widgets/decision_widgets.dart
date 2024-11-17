import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthbubba/res/app_images.dart';
import 'package:healthbubba/widgets/button_view.dart';
import 'package:healthbubba/widgets/image_view.dart';

import '../res/app_colors.dart';
 

destructiveActions({
  required String message,
  required String primaryText,
  required String secondaryText,
  required Function primaryAction,
  Function? secondaryAction,
  required BuildContext context,
  required Color primaryBgColor,
  required Color secondaryBgColor,
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(fontSize: 16),
        ),
        const SizedBox(
          height: 30,
        ),
        ButtonView(
            color: primaryBgColor,
            borderColor: primaryBgColor,
            borderRadius: 100,
            onPressed: () {
              primaryAction();
            },
            child: Text(
              primaryText,
              style: const TextStyle(color: Colors.white),
            )),
        const SizedBox(
          height: 13,
        ),
        GestureDetector(
          onTap: () {
            if (secondaryAction != null) {
              secondaryAction();
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                  color: secondaryBgColor,
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child: Center(
                child: Text(
                  secondaryText,
                  style: const TextStyle(
                      color: AppColors.lightSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              )),
        )
      ],
    ),
  );
}

destructiveActions1({
  required String message,
  required String primaryText,
  required String secondaryText,
  required String secondary2Text,
  required Function primaryAction,
  Function? secondaryAction,
  Function? secondary2Action,
  required BuildContext context,
  required Color primaryBgColor,
  required Color secondaryBgColor,
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          message,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(fontSize: 16),
        ),
        const SizedBox(
          height: 30,
        ),
        ButtonView(
            color: primaryBgColor,
            borderColor: primaryBgColor,
            borderRadius: 100,
            onPressed: () {
              primaryAction();
            },
            child: Text(
              primaryText,
              style:   GoogleFonts.inter(color: Colors.white, fontSize: 14),
            )),
        const SizedBox(
          height: 13,
        ),
        GestureDetector(
          onTap: () {
            if (secondaryAction != null) {
              secondaryAction();
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                  color: secondaryBgColor,
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child: Center(
                child: Text(
                  secondaryText,
                  style: const TextStyle(
                      color: AppColors.lightSecondary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              )),
        ),
        const SizedBox(height: 18,),
        GestureDetector(
          onTap: () {
            if (secondary2Action != null) {
              secondary2Action();
            }  else {
              Navigator.pop(context);
            }
             
          },
          child: Text(
                secondary2Text,
                style:   GoogleFonts.inter(color: AppColors.lightSecondary, fontSize: 14, fontWeight: FontWeight.w500),
              ),
        ),
        const SizedBox(height: 18,),

      ],
    ),
  );
}

successActions({
  required String message,
  required String primaryText,
  required Function primaryAction,
  required BuildContext context,
  required Color primaryBgColor,
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20,
        ),
        const ImageView.svg(AppImages.success),
        const SizedBox(
          height: 20,
        ),
        Text(
          message,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        ButtonView(
            color: primaryBgColor,
            borderColor: primaryBgColor,
            borderRadius: 100,
            onPressed: () {
              primaryAction();
            },
            child: Text(
              primaryText,
              style: const TextStyle(color: Colors.white),
            )),
        const SizedBox(
          height: 13,
        ),
      ],
    ),
  );
}
