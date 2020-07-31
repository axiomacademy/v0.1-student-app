import 'package:flutter/material.dart';

import '../../components/appbar.dart';
import '../../components/list_items.dart';

class ScheduleView extends StatefulWidget {
  ScheduleView({Key key}) : super(key: key);

  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 8.0),
            child: ListView(shrinkWrap: true, children: <Widget>[
              AxiomAppBar(),
            ])));
  }
}
