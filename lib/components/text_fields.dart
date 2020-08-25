import 'package:flutter/material.dart';

class BorderTextFormField extends StatelessWidget {
  final String labelText;
  final Icon suffixIcon;
  final Icon prefixIcon;
  final String Function(String) validator;

  BorderTextFormField(
      {@required this.labelText,
      @required this.validator,
      this.suffixIcon,
      this.prefixIcon,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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

class FilledTextFormField extends StatelessWidget {
  final String labelText;
  final Icon suffixIcon;
  final Icon prefixIcon;
  final String Function(String) validator;
  final Color fillColor;
  final Color textColor;

  FilledTextFormField(
      {@required this.labelText,
      @required this.validator,
      this.suffixIcon,
      this.prefixIcon,
      this.fillColor = const Color(0x14000000),
      this.textColor = const Color(0xB0000000),
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
