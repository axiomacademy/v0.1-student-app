import 'package:flutter/material.dart';

import '../../components/buttons.dart';
import '../../components/avatar.dart';

class BookingBottomSheet extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: "book/type",
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case "book/type":
              builder = (BuildContext _) => ChooseSessionType();
              break;
            case "book/subject":
              builder = (BuildContext _) => ChooseSubject();
              break;
            case "book/subjectlevel":
              builder = (BuildContext _) => ChooseSubjectLevel();
              break;
            case "book/time":
              builder = (BuildContext _) => ChooseBookingTime();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        });
  }
}

class ChooseBookingTime extends StatelessWidget {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          PulldownHandle(),
          Container(
              padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
              child: Row(children: <Widget>[
                Text("Choose a time",
                    style: Theme.of(context).primaryTextTheme.headline5),
                Spacer(),
                TextFlatButton(text: "Cancel", onPressed: () {}),
              ])),
          Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: Text("Step 3 of 4".toUpperCase(),
                  style: Theme.of(context)
                      .accentTextTheme
                      .overline
                      .copyWith(fontWeight: FontWeight.w600))),
          DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
          Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextRaisedButton(text: "Next", onPressed: () {}))
        ]));
  }
}

class ChooseSubjectLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
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
              child: TextRaisedButton(text: "Next", onPressed: () {}))
        ]));
  }
}

class ChooseSubject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          PulldownHandle(),
          Container(
              padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
              child: Row(children: <Widget>[
                Text("Choose a subject",
                    style: Theme.of(context).primaryTextTheme.headline5),
                Spacer(),
                TextFlatButton(text: "Cancel", onPressed: () {}),
              ])),
          Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: Text("Step 1 of 4".toUpperCase(),
                  style: Theme.of(context)
                      .accentTextTheme
                      .overline
                      .copyWith(fontWeight: FontWeight.w600))),
          Expanded(
              child: ListView(children: [
            SubjectOptionsTile(
              subject: "Physics",
              onTap: () {
                Navigator.of(context).pushNamed("book/subjectlevel");
              },
            ),
            SubjectOptionsTile(
                subject: "Mathematics",
                onTap: () {
                  Navigator.of(context).pushNamed("book/subjectlevel");
                }),
          ])),
          Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextRaisedButton(text: "Next", onPressed: () {}))
        ]));
  }
}

class ChooseSessionType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
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
          Expanded(
              child: ListView(children: <Widget>[
            BookingOptionsTile(
              title: "On-demand tutoring  ⌛",
              subtitle: "Get immediate help right now",
              onTap: () {
                Navigator.of(context).pushNamed("book/subject");
              },
            ),
            BookingOptionsTile(
                title: "Scheduled Tutoring ⌚",
                subtitle: "Schedule a repeated session with a tutor",
                onTap: () {
                  Navigator.of(context).pushNamed("book/subject");
                }),
          ])),
        ]));
  }
}

///************************* UTILITY  WIDGETS ******************************************///

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

class SubjectOptionsTile extends StatelessWidget {
  final String subject;
  final VoidCallback onTap;

  SubjectOptionsTile({@required this.subject, @required this.onTap});

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
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SubjectAvatar(subject),
                              Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(subject,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1)),
                            ]))))));
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
