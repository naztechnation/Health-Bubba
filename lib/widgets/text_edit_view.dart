import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../res/app_strings.dart';
import '../res/app_colors.dart';

class TextEditView extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? fillColor;
  final GestureTapCallback? onTap;
  final String? labelText;
  final String? textViewTitle;
  final String? hintText;
  final bool readOnly;
  final bool autofocus;
  final bool autocorrect;
  final bool obscureText;
  final double borderRadius;
  final double borderWidth;
  final bool isDense;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor;
  final int? maxLines;
  final int? maxLength;
  final bool filled;
  final String? prefixText;
  final String? helperText;
  final Color? iconColor;
  final Color? textColor;
  final double boxHeight;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  const TextEditView(
      {Key? key,
      this.onChanged,
      required this.controller,
      this.fillColor,
      this.onTap,
      this.keyboardType,
      this.textInputAction,
      this.validator,
      this.readOnly = false,
      this.autofocus = false,
      this.autocorrect = false,
      this.obscureText = false,
      this.isDense = false,
      this.labelText,
      this.hintText,
      this.onFieldSubmitted,
      this.borderRadius = 8.0,
      this.borderWidth = 1.5,
      this.suffixIcon,
      this.iconColor,
      this.textColor,
      this.prefixIcon,
      this.borderColor,
      this.filled = true,
      this.prefixText,
      this.autofillHints,
      this.focusNode,
      this.helperText,
      this.maxLength,
      this.maxLines = 1,
      this.textViewTitle = '',
      this.inputFormatters,   this.boxHeight = 20})
      : super(key: key);

  OutlineInputBorder _border(BuildContext context) => OutlineInputBorder(
      borderSide: BorderSide(
          width: borderWidth,
          color: borderColor ?? Theme.of(context).shadowColor.withOpacity(0.1),
          style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)));

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
              primary: AppColors.lightSecondary)),
      child: SizedBox(
       // height: 45,
        child: Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(8),
          color: AppColors.lightPrimary,
          child: Center(
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              validator: validator,
              onChanged: onChanged,
              onTap: onTap,
              autocorrect: autocorrect,
              readOnly: readOnly,
              autofocus: autofocus,
              obscureText: obscureText,
              maxLines: maxLines,
              inputFormatters: inputFormatters,
              maxLength: maxLength,
              autofillHints: autofillHints,
              onFieldSubmitted: onFieldSubmitted,
              focusNode: focusNode,
              style: TextStyle(
                  color: textColor,
                  fontFamily: AppStrings.montserrat,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                  border: _border(context),
                  enabledBorder: _border(context),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide(
                          width: borderWidth,
                          color: const Color(0xFF40B93C),
                          style: BorderStyle.solid)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide(
                          width: borderWidth,
                          color: borderColor ?? const Color(0xFFF70000),
                          style: BorderStyle.solid)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                      borderSide: BorderSide(
                          width: borderWidth,
                          color: borderColor ?? const Color(0xFFF70000),
                          style: BorderStyle.solid)),
                  disabledBorder: _border(context),
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontFamily: AppStrings.montserrat),
                  labelText: labelText,
                  labelStyle: TextStyle(color: textColor),
                  filled: filled,
                  isDense: isDense,
                  fillColor: fillColor ?? AppColors.lightPrimary,
                  helperText: helperText,
                  helperMaxLines: maxLength,
                  helperStyle: const TextStyle(fontSize: 10),
                  prefixText: prefixText,
                  prefixIcon: prefixIcon,
                  iconColor: iconColor,
                  prefixIconColor: iconColor,
                  suffixIcon: suffixIcon,
                  suffixIconColor: iconColor,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6)),
            ),
          ),
        ),
      ),
    );
  }
}
