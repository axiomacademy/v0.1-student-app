import 'package:flutter/material.dart';

import '../../components/buttons.dart';

class BookingBottomSheet extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: "book/choosetype",
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case "book/choosetype":
              builder = (BuildContext _) => ChooseSessionType();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        });
  }
}

class ChooseSessionType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Row(children: <Widget>[
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
      ]),
      Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
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

///************************* UTILITY  WIDGETS ******************************************///

class BookingOptionsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  BookingOptionsTile(
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
                    onTap: () {},
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
