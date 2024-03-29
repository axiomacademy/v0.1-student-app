import 'package:flutter/material.dart';

/// TextField with a border style
class BorderTextFormField extends StatelessWidget {
  final String labelText;
  final Icon suffixIcon;
  final Icon prefixIcon;
  final bool hidden;
  final String Function(String) validator;
  final TextEditingController controller;

  BorderTextFormField(
      {@required this.labelText,
      @required this.validator,
      this.suffixIcon,
      this.prefixIcon,
      this.hidden = false,
      this.controller,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: hidden,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(),
        labelText: labelText,
        suffixIcon: suffixIcon ?? null,
        prefixIcon: prefixIcon ?? null,
      ),
      validator: validator,
    );
  }
}

/// TextField with a filled style
class FilledTextFormField extends StatelessWidget {
  final String labelText;
  final Icon suffixIcon;
  final Icon prefixIcon;
  final String Function(String) validator;
  final Color fillColor;
  final Color textColor;
  final TextEditingController controller;

  FilledTextFormField(
      {@required this.labelText,
      @required this.validator,
      this.suffixIcon,
      this.prefixIcon,
      this.controller,
      this.fillColor = const Color(0x14000000),
      this.textColor = const Color(0xB0000000),
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: fillColor,
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 2.0, color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        hintText: labelText,
        suffixIcon: suffixIcon ?? null,
        prefixIcon: prefixIcon ?? null,
        hintStyle: TextStyle(color: textColor),
      ),
      style: TextStyle(color: textColor),
      validator: validator,
    );
  }
}
