

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/enum.dart';
import '../res/app_colors.dart';
import '../res/app_images.dart';
import 'custom_toast.dart';
import 'image_view.dart';
import 'progress_indicator.dart';

class Modals {
  static void showSnackBar(String message,
      {required BuildContext context, MessageType? messageType}) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
            duration: messageType == MessageType.progress
                ? const Duration(seconds: 30)
                : const Duration(seconds: 2),
            content: messageType == MessageType.progress
                ? ProgressIndicators.circularProgressBar( )
                : Text(message, textAlign: TextAlign.center),
            backgroundColor: messageType == MessageType.success
                ? Colors.green
                : messageType == MessageType.error
                    ? Colors.red
                    : null),
      );
  }

  static void showToast(String message,BuildContext    context) {

    ToastService().showToast(
                            context,
                            
                            leadingIcon: const ImageView.svg(AppImages.tick, 
                            
                                                        height: 25,
                            
                            ),
                            title: '',
                            subtitle: message ,
                          );
    
  }

  static Future<bool?> showAlertOptionDialog(context,
      {required String title,
      required String message,
      required Function onTap,
      String buttonYesText = 'Yes',
      String buttonNoText = 'No'}) async {
    final data = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), 
                  ),
            title: Column(
              children: [
                Text(title,
                 style:   GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600,), ),
                const SizedBox(height: 10,),
                const Divider()
              ],
            ),
            content: Text(message,                 style:   GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600), ),

            actions: [
              TextButton(
                child: Text(buttonNoText,  style: GoogleFonts.inter( fontWeight: FontWeight.w600, color: Colors.red),),
                onPressed: () => Navigator.pop(context, false),
              ),
              TextButton(
                child: Text(buttonYesText, style:   GoogleFonts.inter( fontWeight: FontWeight.w600, color: Colors.black),),
                onPressed: (){
                  onTap();
                  Navigator.pop(context, false);
                },
              )
            ],
          );
        });
    return data;
  }

static Future<dynamic> showBottomSheetModal(
  BuildContext context, {
  required Widget page,
  double? heightFactor = 0.5,
  bool isDissmissible = false,
  bool isScrollControlled = false,
  double borderRadius = 20.0,
}) async {
  final data = await showModalBottomSheet<dynamic>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
    ),
    backgroundColor: AppColors.cardColor,
    isDismissible: isDissmissible,
     
    useSafeArea: true,
    isScrollControlled: isScrollControlled,
    builder: (BuildContext bc) {
      return DraggableScrollableSheet(
        initialChildSize: heightFactor ?? 0.5, 
        minChildSize: 0.3,  
        maxChildSize: 1.0,  
        expand: false,  
        builder: (context, scrollController) {
          return Column(
            children: [
              const SizedBox(height: 20,),
              Container(
                width: 49,
                height:4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,  
                  child: page,
                ),
              ),
            ],
          );
        },
      );
    },
  );
  return data;
}




  static Future<dynamic> showDialogModal(BuildContext context,
      {required Widget page, double borderRadius = 20.0}) async {
    final data = await showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(borderRadius)), //this right here
              child: page);
        });
    return data;
  }
}