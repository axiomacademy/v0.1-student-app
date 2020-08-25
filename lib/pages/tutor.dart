import 'package:flutter/material.dart';

import '../components/tutor_profile.dart';
import '../components/text_fields.dart';

class TutorPage extends StatefulWidget {
  TutorPage({Key key}) : super(key: key);

  @override
  _TutorPageState createState() => _TutorPageState();
}

class _TutorPageState extends State<TutorPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(500),
          child: Stack(children: <Widget>[
            Container(
                height: 200,
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, bottom: 5.0, top: 5.0),
                child: SafeArea(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 25.0,
                          color: Colors.white,
                          onPressed: () {}),
                      Expanded(
                          child: FilledTextFormField(
                              textColor: Colors.white,
                              labelText: "",
                              prefixIcon: Icon(Icons.search,
                                  size: 25.0, color: Colors.white),
                              validator: (input) {
                                return "";
                              })),
                      IconButton(
                          icon: Icon(Icons.more_vert),
                          iconSize: 25.0,
                          color: Colors.white,
                          onPressed: () {}),
                    ]))),
            Container(
              margin: EdgeInsets.only(top: 120, left: 15.0, right: 15.0),
              child: TutorProfile(),
            )
          ])),
    ));
  }
}
