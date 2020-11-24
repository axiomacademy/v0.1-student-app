import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'pulldown_handle.dart';
import '../../components/buttons.dart';

class Matching extends StatefulWidget {
  final void Function(String tutors) onComplete;

  Matching({@required this.onComplete, Key key}) : super(key: key);

  @override
  _MatchingState createState() => _MatchingState();
}

class _MatchingState extends State<Matching> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5000), () {
      widget.onComplete("done");
    });
  }

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
                    Spacer(),
                    StandardFlatButton(text: "Cancel", onPressed: () {}),
                  ])),
              Container(
                  height: 200.0,
                  child: Center(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                        SpinKitFadingCube(
                            color: Theme.of(context).primaryColor, size: 50.0),
                        Padding(
                            padding: EdgeInsets.only(top: 40.0),
                            child: Text("Finding awesome tutors",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6))
                      ])))
            ])));
  }
}
