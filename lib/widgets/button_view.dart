import 'package:flutter/material.dart';

import '../../res/app_colors.dart';
import 'progress_indicator.dart';

class ButtonView extends StatelessWidget {
  final void Function() onPressed;
  final Widget? child;
  final double fontSize;
  final Gradient? gradient;
  final Color? color;
  final Color? borderColor;
  final String title ;
  
  final double borderWidth;
  final double borderRadius;
  final bool disabled;
  final bool processin;
  final bool expanded;
  final EdgeInsets padding;

  const ButtonView(
      {required this.onPressed,
      required this.child,
      this.fontSize = 16,
      this.gradient,
    this.title = 'Loading...',

      this.color,
      this.borderColor,
      this.borderWidth = 0.0,
      this.disabled = false,
      this.processin = false,
      this.expanded = true,
      this.borderRadius = 16.0,
      this.padding =
          const EdgeInsets.symmetric(vertical: 14.0, horizontal: 8.0),
      super.key});

  @override
  Widget build(BuildContext context) {
    if (processin) {
      return SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
          
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: disabled
                ? Theme.of(context).primaryColor
                : (color ?? AppColors.lightSecondary),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: BorderSide(
                    color: disabled
                        ? Theme.of(context).textTheme.bodyMedium!.color!
                        : (borderColor ??
                            AppColors.lightSecondary),
                    width: borderWidth)),
            textStyle: TextStyle(
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 15,
                      width: 15,
                      child: ProgressIndicators.circularProgressBar()),
                      const SizedBox(width: 13,),
                  Text(title, style: const TextStyle(color: Colors.white),)
                ],
              ),
            ),
        ),
      );
    } else {
      if (expanded) {
        return SizedBox(
          width: double.maxFinite,
           
          child: ElevatedButton(
            onPressed: disabled ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: disabled
                  ? Theme.of(context).primaryColor
                  : (color ?? AppColors.lightSecondary),
                          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(
                      color: disabled
                          ? Theme.of(context).textTheme.bodyMedium!.color!
                          : (borderColor ??
                              AppColors.lightSecondary),
                      width: borderWidth)),
              textStyle: TextStyle(
              fontSize: fontSize,
                
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
            child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: child,
          ),
          ),
        );
      } else {
        return ElevatedButton(
          
          onPressed: disabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            
            backgroundColor: disabled
                ? Theme.of(context).primaryColor
                : (color ?? AppColors.lightSecondary),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: BorderSide(
                    color: disabled
                        ? Theme.of(context).textTheme.bodyMedium!.color!
                        : (borderColor ??
                            AppColors.lightSecondary),
                    width: borderWidth)),
            textStyle: TextStyle(
              fontSize: fontSize,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: child,
          ),
        );
      }
    }
  }
}
