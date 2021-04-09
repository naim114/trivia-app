import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trivia_app/theme/theme.dart';

class Input extends StatelessWidget {
  final String? placeholder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final void Function(String val)? onChanged;
  final TextEditingController? controller;
  final bool autofocus;
  final bool obscureText;
  final Color borderColor;
  final TextInputType keyboardType;
  final bool digitOnly;

  Input({
    this.placeholder,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onChanged,
    this.autofocus = false,
    this.borderColor = AppTheme.border,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.digitOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppTheme.muted,
      onTap: onTap,
      onChanged: onChanged,
      controller: controller,
      autofocus: autofocus,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: [
        if (digitOnly == true) FilteringTextInputFormatter.digitsOnly
      ],
      style: TextStyle(height: 0.85, fontSize: 14.0, color: AppTheme.initial),
      textAlignVertical: TextAlignVertical(y: 0.6),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppTheme.white,
        hintStyle: TextStyle(
          color: AppTheme.muted,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
                color: borderColor, width: 1.0, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
                color: borderColor, width: 1.0, style: BorderStyle.solid)),
        hintText: placeholder,
      ),
    );
  }
}
