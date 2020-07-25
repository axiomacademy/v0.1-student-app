import 'package:flutter/material.dart';

class BorderTextFormField extends StatelessWidget {
  final String labelText;
  final Icon suffixIcon;
  final String Function(String) validator;

  BorderTextFormField(
      {@required this.labelText,
      @required this.validator,
      this.suffixIcon,
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
      ),
      validator: validator,
    );
  }
}
