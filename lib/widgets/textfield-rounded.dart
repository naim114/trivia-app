import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trivia_app/theme/theme.dart';

class TextFieldRounded extends StatelessWidget {
  final TextAlign textAlign;
  final String? hintText, initialValue;
  final TextStyle textStyle;
  final double circularRadius, borderWidth;
  final BorderStyle borderStyle;
  final bool filled;
  final EdgeInsetsGeometry contentPadding;
  final Color fillColor;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;

  const TextFieldRounded({
    Key? key,
    this.textAlign = TextAlign.center,
    this.hintText,
    this.textStyle = const TextStyle(fontSize: 16),
    this.circularRadius = 8,
    this.borderWidth = 0,
    this.borderStyle = BorderStyle.none,
    this.filled = true,
    this.contentPadding = const EdgeInsets.all(16),
    this.fillColor = AppTheme.white,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.inputFormatters,
    this.enabled = true,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      textAlign: textAlign,
      enabled: enabled,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(circularRadius),
          borderSide: BorderSide(
            width: borderWidth,
            style: borderStyle,
          ),
        ),
        filled: filled,
        contentPadding: contentPadding,
        fillColor: fillColor,
      ),
      controller: controller,
      inputFormatters: inputFormatters,
    );
  }
}
