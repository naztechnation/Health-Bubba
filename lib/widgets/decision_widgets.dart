import 'package:flutter/material.dart';
import 'package:healthbubba/widgets/button_view.dart';

import '../res/app_colors.dart';

destructiveActions({
  required String message,
  required String primaryText,
  required String secondaryText,
  required Function primaryAction,
  Function? secondaryAction,
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
        Text(message, textAlign: TextAlign.center,),
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
            child:   Text(primaryText, style: const TextStyle(color: Colors.white),)),
             const SizedBox(
          height: 13,
        ),
         GestureDetector(
                            onTap: () {
                             if (secondaryAction != null){
                                 secondaryAction();
                             }else{
                              Navigator.pop(context);
                             }
                            
                            },
                            child: Container(
                                width: MediaQuery.sizeOf(context).width,
                                height: 42,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      100,
                                    ),
                                    color: AppColors.lightPrimary,
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5)),
                                child:   Center(
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
