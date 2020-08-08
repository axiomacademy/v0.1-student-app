import 'package:flutter/material.dart';

import '../../components/buttons.dart';

class BookingBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: <Widget>[
      Container(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
          child: Row(children: <Widget>[
            Text("Book a session",
                style: Theme.of(context).primaryTextTheme.headline5),
            Spacer(),
            TextFlatButton(text: "Cancel", onPressed: () {}),
          ])),
      BookingOptionsTile(
        title: "On-demand tutoring  ⌛",
        subtitle: "Get immediate help right now",
        onTap: () {},
      ),
      BookingOptionsTile(
          title: "Scheduled Tutoring ⌚",
          subtitle: "Schedule a repeated session with a tutor",
          onTap: () {}),
    ]);
  }
}

class BookingOptionsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  BookingOptionsTile(
      {@required this.title, @required this.subtitle, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title, style: Theme.of(context).textTheme.subtitle1),
        onTap: () {},
        subtitle: Text(subtitle,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(color: Color(0x99000000))));
  }
}
