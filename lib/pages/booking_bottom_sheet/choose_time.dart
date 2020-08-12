import 'package:flutter/material.dart';

import 'pulldown_handle.dart';
import '../../components/buttons.dart';

class ChooseTime extends StatefulWidget {
  ChooseTime({Key key}) : super(key: key);

  @override
  _ChooseTimeState createState() => _ChooseTimeState();
}

class _ChooseTimeState extends State<ChooseTime> {
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
          GridView.count(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                  top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
              crossAxisCount: 5,
              childAspectRatio: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: <Widget>[
                DateTimeSelector(text: "Mon", onPressed: () {}),
                DateTimeSelector(text: "Tue", onPressed: () {}),
                DateTimeSelector(text: "Wed", onPressed: () {}),
                DateTimeSelector(text: "Thu", onPressed: () {}),
                DateTimeSelector(text: "Fri", onPressed: () {}),
                DateTimeSelector(text: "Sat", onPressed: () {}),
                DateTimeSelector(text: "Sun", onPressed: () {}),
              ]),
          Divider(),
          Expanded(
              child: GridView.count(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                  crossAxisCount: 5,
                  childAspectRatio: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: <Widget>[
                DateTimeSelector(text: "Mon", onPressed: () {}),
                DateTimeSelector(text: "Tue", onPressed: () {}),
                DateTimeSelector(text: "Wed", onPressed: () {}),
                DateTimeSelector(text: "Thu", onPressed: () {}),
                DateTimeSelector(text: "Fri", onPressed: () {}),
                DateTimeSelector(text: "Sat", onPressed: () {}),
                DateTimeSelector(text: "Sun", onPressed: () {}),
              ])),
          Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextRaisedButton(text: "Next", onPressed: () {}))
        ]));
  }
}

class DateTimeSelector extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  DateTimeSelector({@required this.text, @required this.onPressed, Key key})
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
