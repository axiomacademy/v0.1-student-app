import 'package:flutter/material.dart';

import '../../components/buttons.dart';
import 'pulldown_handle.dart';

class ChooseSessionType extends StatelessWidget {
  final void Function(bool scheduled) onChoose;

  ChooseSessionType({@required this.onChoose, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: SafeArea(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              PulldownHandle(),
              Container(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
                  child: Row(children: <Widget>[
                    Text("Book a session",
                        style: Theme.of(context).primaryTextTheme.headline5),
                    Spacer(),
                    TextFlatButton(text: "Cancel", onPressed: () {}),
                  ])),
              ListView(shrinkWrap: true, children: <Widget>[
                _BookingOptionsTile(
                  title: "On-demand tutoring  ⌛",
                  subtitle: "Get immediate help right now",
                  onTap: () {
                    onChoose(false);
                  },
                ),
                _BookingOptionsTile(
                    title: "Scheduled Tutoring ⌚",
                    subtitle: "Schedule a repeated session with a tutor",
                    onTap: () {
                      onChoose(true);
                    }),
              ]),
            ])));
  }
}

class _BookingOptionsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  _BookingOptionsTile(
      {@required this.title, @required this.subtitle, @required this.onTap});

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
                              Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(subtitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .copyWith(color: Color(0x99000000))))
                            ]))))));
  }
}
