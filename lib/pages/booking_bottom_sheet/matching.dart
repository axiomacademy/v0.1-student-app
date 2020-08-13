import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'pulldown_handle.dart';
import '../../components/buttons.dart';

class Matching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
      PulldownHandle(),
      Container(
          padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
          child: Row(children: <Widget>[
            Spacer(),
            TextFlatButton(text: "Cancel", onPressed: () {}),
          ])),
      Expanded(
          child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        SpinKitFadingCube(color: Theme.of(context).primaryColor, size: 50.0),
        Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text("Finding awesome tutors",
                style: Theme.of(context).primaryTextTheme.headline6))
      ])))
    ]));
  }
}
