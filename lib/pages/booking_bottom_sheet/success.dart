import 'package:flutter/material.dart';

import 'pulldown_handle.dart';
import '../../components/buttons.dart';
import '../../components/tutor_profile.dart';

class Success extends StatefulWidget {
  Success({Key key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  final title = "Found a match 😄";
  final overline = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              PulldownHandle(),
              Container(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
                  child: Row(children: <Widget>[
                    Text(title,
                        style: Theme.of(context).primaryTextTheme.headline5),
                    Spacer(),
                    TextFlatButton(text: "Cancel", onPressed: () {}),
                  ])),
              Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  child: Text(overline.toUpperCase(),
                      style: Theme.of(context)
                          .accentTextTheme
                          .overline
                          .copyWith(fontWeight: FontWeight.w600))),
              Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0),
                  child: TutorProfile()),
              Spacer(),
              Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextRaisedButton(
                      text: "Start (10s)",
                      onPressed: () {
                        Navigator.of(context).pushNamed("book/match");
                      }))
            ])));
  }
}
