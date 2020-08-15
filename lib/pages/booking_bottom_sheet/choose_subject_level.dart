import 'package:flutter/material.dart';

import 'pulldown_handle.dart';
import '../../components/buttons.dart';

class ChooseSubjectLevel extends StatefulWidget {
  final void Function(String option) onChoose;
  final int step;
  final int totalSteps;

  ChooseSubjectLevel(
      {@required this.onChoose,
      @required this.step,
      @required this.totalSteps,
      Key key})
      : super(key: key);

  @override
  _ChooseSubjectLevelState createState() => _ChooseSubjectLevelState();
}

class _ChooseSubjectLevelState extends State<ChooseSubjectLevel> {
  static const List<String> subjectLevels = [
    "Cambridge 'A' Levels",
    "Cambridge 'O' Levels",
    "International Baccaulerate"
  ];
  int selectedSubjectLevel;

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
                    Text("Choose a subject level",
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
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return (selectedSubjectLevel == index)
                        ? SubjectLevelOptionsTile(
                            title: subjectLevels[index],
                            selected: true,
                            onTap: () {})
                        : SubjectLevelOptionsTile(
                            title: subjectLevels[index],
                            selected: false,
                            onTap: () {
                              setState(() {
                                selectedSubjectLevel = index;
                              });
                            });
                  }),
              Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: TextRaisedButton(
                      text: "Next",
                      onPressed: () {
                        widget.onChoose(subjectLevels[selectedSubjectLevel]);
                      }))
            ])));
  }
}

class SubjectLevelOptionsTile extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  SubjectLevelOptionsTile(
      {@required this.title, @required this.selected, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Material(
            color: (selected) ? Color(0xFFF0E8FA) : Color(0xFFFAFAFA),
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
