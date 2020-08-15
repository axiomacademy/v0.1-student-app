import 'package:flutter/material.dart';

import 'pulldown_handle.dart';
import '../../components/buttons.dart';

class ChooseTime extends StatefulWidget {
  final void Function(String option) onChoose;
  final int step;
  final int totalSteps;

  ChooseTime(
      {@required this.onChoose,
      @required this.step,
      @required this.totalSteps,
      Key key})
      : super(key: key);

  @override
  _ChooseTimeState createState() => _ChooseTimeState();
}

class _ChooseTimeState extends State<ChooseTime> {
  static const List<String> days = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];
  static const List<String> times = [
    "7am",
    "8am",
    "9am",
    "10am",
    "11am",
    "12pm",
    "1pm",
    "2pm",
    "3pm",
    "4pm",
    "5pm",
    "6pm",
    "7pm",
    "8pm",
    "9pn",
    "10pm",
    "11pm",
    "12am",
    "1am",
    "2am",
    "3am",
    "4am",
    "5am",
    "6am"
  ];

  int selectedDay;
  int selectedTime;

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
                    Text("Choose a time",
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
              GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (selectedDay == index)
                        ? DateTimeSelector(
                            text: days[index], selected: true, onPressed: () {})
                        : DateTimeSelector(
                            text: days[index],
                            selected: false,
                            onPressed: () {
                              setState(() {
                                selectedDay = index;
                              });
                            });
                  }),
              Divider(),
              GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemCount: times.length,
                  itemBuilder: (BuildContext context, int index) {
                    return (selectedTime == index)
                        ? DateTimeSelector(
                            text: times[index],
                            selected: true,
                            onPressed: () {})
                        : DateTimeSelector(
                            text: times[index],
                            selected: false,
                            onPressed: () {
                              setState(() {
                                selectedTime = index;
                              });
                            });
                  }),
              Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: TextRaisedButton(
                      text: "Next",
                      onPressed: () {
                        widget.onChoose(times[selectedTime]);
                      }))
            ])));
  }
}

class DateTimeSelector extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onPressed;

  DateTimeSelector(
      {@required this.text,
      @required this.onPressed,
      this.selected = false,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        padding: EdgeInsets.all(0.0), //adds padding inside the button
        materialTapTargetSize: MaterialTapTargetSize
            .shrinkWrap, //limits the touch area to the button area
        minWidth: 15.0, //wraps child's width
        height: 10.0, //wraps child's height
        child: FlatButton(
          onPressed: onPressed,
          color: (selected) ? Color(0xFFF0E8FA) : Colors.white,
          splashColor: Color(0xFFF0E8FA),
          highlightColor: Color(0x00FFFFFF),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: new BorderRadius.circular(10.0)),
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context)
                .primaryTextTheme
                .button
                .copyWith(fontWeight: FontWeight.w600, fontSize: 9),
          ),
        ));
  }
}
