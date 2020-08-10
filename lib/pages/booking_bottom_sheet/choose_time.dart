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
          ),
          Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextRaisedButton(text: "Next", onPressed: () {}))
        ]));
  }
}
