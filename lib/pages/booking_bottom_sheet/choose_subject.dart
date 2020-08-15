import 'package:flutter/material.dart';

import 'pulldown_handle.dart';
import '../../components/buttons.dart';
import '../../components/avatar.dart';

class ChooseSubject extends StatefulWidget {
  final void Function(String option) onChoose;
  final int step;
  final int totalSteps;

  ChooseSubject(
      {@required this.onChoose,
      @required this.step,
      @required this.totalSteps,
      Key key})
      : super(key: key);

  @override
  _ChooseSubjectState createState() => _ChooseSubjectState();
}

class _ChooseSubjectState extends State<ChooseSubject> {
  static const List<String> subjects = ["Physics", "Mathematics"];
  int selectedSubject;

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
                mainAxisSize: MainAxisSize.min,
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
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  child: Text(
                      "Step ${widget.step} of ${widget.totalSteps}"
                          .toUpperCase(),
                      style: Theme.of(context)
                          .accentTextTheme
                          .overline
                          .copyWith(fontWeight: FontWeight.w600))),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return (selectedSubject == index)
                        ? SubjectOptionsTile(
                            subject: subjects[index],
                            selected: true,
                            onTap: () {})
                        : SubjectOptionsTile(
                            subject: subjects[index],
                            selected: false,
                            onTap: () {
                              setState(() {
                                selectedSubject = index;
                              });
                            });
                  }),
              Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: TextRaisedButton(
                      text: "Next",
                      onPressed: () {
                        widget.onChoose(subjects[selectedSubject]);
                      }))
            ])));
  }
}

class SubjectOptionsTile extends StatelessWidget {
  final String subject;
  final bool selected;
  final VoidCallback onTap;

  SubjectOptionsTile(
      {@required this.subject, @required this.selected, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Material(
            child: Ink(
                color: (selected) ? Color(0xFFF0E8FA) : Color(0xFFFAFAFA),
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
