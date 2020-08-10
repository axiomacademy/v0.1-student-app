import 'package:flutter/material.dart';

class PulldownHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Spacer(),
      Container(
        height: 5.0,
        width: 40.0,
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
            color: Color(0xFFE0E0E0),
            borderRadius: BorderRadius.all(Radius.circular(2.0))),
      ),
      Spacer()
    ]);
  }
}
