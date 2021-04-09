import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:trivia_app/theme/theme.dart';

class TextFieldDropdownSearch extends StatelessWidget {
  final TextAlign textAlign;
  final String? hintText;
  final TextStyle textStyle;
  final double circularRadius, borderWidth;
  final BorderStyle borderStyle;
  final bool filled;
  final EdgeInsetsGeometry contentPadding;
  final Color fillColor;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const TextFieldDropdownSearch({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      mode: Mode.MENU,
      showSelectedItem: true,
      searchBoxDecoration: InputDecoration(
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
      items: [
        "Education",
        "Music",
        "Movies",
        "History",
        "Cultures",
        "Geography",
        "Sports",
        "Politics",
      ],
      // label: "Menu mode",
      // hint: "Category",
      popupItemDisabled: (String s) => s.startsWith('I'),
      onChanged: print,
      selectedItem: "Education",
      searchBoxController: controller,
    );
  }
}
