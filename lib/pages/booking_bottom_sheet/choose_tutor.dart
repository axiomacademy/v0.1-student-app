import 'package:flutter/material.dart';

import 'pulldown_handle.dart';
import '../../components/buttons.dart';
import '../../components/tutor_profile.dart';

class ChooseTutor extends StatefulWidget {
  ChooseTutor({Key key}) : super(key: key);

  @override
  _ChooseTutorState createState() => _ChooseTutorState();
}

class _ChooseTutorState extends State<ChooseTutor> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
          PulldownHandle(),
          Container(
              padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
              child: Row(children: <Widget>[
                Text("Choose a tutor",
                    style: Theme.of(context).primaryTextTheme.headline5),
                Spacer(),
                TextFlatButton(text: "Cancel", onPressed: () {}),
              ])),
          Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: Text("Step 4 of 4".toUpperCase(),
                  style: Theme.of(context)
                      .accentTextTheme
                      .overline
                      .copyWith(fontWeight: FontWeight.w600))),
          Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: TutorProfile()),
        ])));
  }
}
