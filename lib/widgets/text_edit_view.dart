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

  const TextEditView({
    Key? key,
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
    this.maxLines,
    this.textViewTitle = '',
    this.inputFormatters,
    this.boxHeight = 20,
  }) : super(key: key);

  OutlineInputBorder _border(BuildContext context, {Color? borderColor}) =>
      OutlineInputBorder(
          borderSide: BorderSide(
              width: borderWidth,
              color:
                  borderColor ?? Theme.of(context).shadowColor.withOpacity(0.1),
              style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)));

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          colorScheme:
              const ColorScheme.light(primary: AppColors.lightSecondary)),
      child: FormField<String>(
        validator: validator,
        builder: (FormFieldState<String> field) {
          final hasError = field.hasError;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: (maxLines == null) ? 45 : null,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: const Color(0xFFFFFFFF),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFF0F0F0),
                        offset: Offset(0, 0),
                        blurRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x409F9E9E),
                        offset: Offset(0, 1),
                        blurRadius: 1,
                      ),
                    ],
                    border: Border.all(
                      color: hasError
                          ? borderColor ?? const Color(0xFFF70000)
                          : borderColor ?? Colors.transparent,
                      width: borderWidth,
                    ),
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: controller,
                      keyboardType: keyboardType,
                      textInputAction: textInputAction,
                      onChanged: (value) {
                        field.didChange(value);
                        if (onChanged != null) {
                          onChanged!(value);
                        }
                      },
                      onTap: onTap,
                      autocorrect: autocorrect,
                      readOnly: readOnly,
                      autofocus: autofocus,
                      obscureText: obscureText,
                      maxLines: maxLines ?? 1,
                      inputFormatters: inputFormatters,
                      maxLength: maxLength,
                      autofillHints: autofillHints,
                      onFieldSubmitted: onFieldSubmitted,
                      focusNode: focusNode,
                      style: const TextStyle(
                        color: Color(0xff6B7280),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: _border(context),
                        enabledBorder: _border(context),
                        focusedBorder: _border(context),
                        focusedErrorBorder: _border(context,
                            borderColor: const Color(0xFFF70000)),
                        errorBorder: _border(context,
                            borderColor: const Color(0xFFF70000)),
                        disabledBorder: _border(context),
                        hintText: hintText,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                        ),
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
                        counterText: '',
                        iconColor: iconColor,
                        prefixIconColor: iconColor,
                        suffixIcon: suffixIcon,
                        suffixIconColor: iconColor,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 12.0),
                      ),
                    ),
                  ),
                ),
              ),
              if (hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    field.errorText ?? '',
                    style: TextStyle(
                        color: Theme.of(context).errorColor, fontSize: 12),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
