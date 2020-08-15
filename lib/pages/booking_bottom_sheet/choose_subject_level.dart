import 'package:flutter/material.dart';

import 'pulldown_handle.dart';
import '../../components/buttons.dart';

class ChooseSubjectLevel extends StatelessWidget {
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
                    Text("Choose a subject level",
                        style: Theme.of(context).primaryTextTheme.headline5),
                    Spacer(),
                    TextFlatButton(text: "Cancel", onPressed: () {}),
                  ])),
              Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  child: Text("Step 2 of 4".toUpperCase(),
                      style: Theme.of(context)
                          .accentTextTheme
                          .overline
                          .copyWith(fontWeight: FontWeight.w600))),
              Expanded(
                  child: ListView(children: [
                SubjectLevelOptionsTile(
                  title: "GCE 'A' Levels",
                  onTap: () {},
                ),
                SubjectLevelOptionsTile(
                  title: "GCE 'O' Levels",
                  onTap: () {},
                ),
                SubjectLevelOptionsTile(
                  title: "International Baccaulerate",
                  onTap: () {},
                ),
              ])),
              Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextRaisedButton(
                      text: "Next",
                      onPressed: () {
                        Navigator.of(context).pushNamed("book/time");
                      }))
            ])));
  }
}

class SubjectLevelOptionsTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  SubjectLevelOptionsTile({@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Material(
            child: Ink(
                child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    splashColor: Color(0xFFF0E8FA),
                    onTap: onTap,
                    child: Container(
                        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xFFE0E0E0)))),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(title,
                                  style: Theme.of(context).textTheme.subtitle1),
                            ]))))));
  }
}
