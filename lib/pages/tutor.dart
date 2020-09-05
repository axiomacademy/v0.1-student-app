import 'package:flutter/material.dart';

import '../components/tutor_profile.dart';
import '../components/text_fields.dart';
import '../components/list_items.dart';

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
      body: ListView(shrinkWrap: true, children: <Widget>[
        Container(
            padding: EdgeInsets.only(
                left: 20.0, right: 10.0, top: 20.0, bottom: 5.0),
            child: Text("Recent Sessions",
                style: Theme.of(context).textTheme.headline6)),
        SubjectListItem(
            subject: "Physics",
            date: "26 June 2020",
            duration: "15 mins",
            description:
                "Went through the basics of circular motion and summarised concepts on pressure"),
        SubjectListItem(
            subject: "Mathematics",
            date: "25 June 2020",
            duration: "2 hours",
            description:
                "Discussing and summarizing pre-calculus, touching on limits"),
        SubjectListItem(
            subject: "Economics",
            date: "20 June 2020",
            duration: "1 hour",
            description:
                "Taught supply-demand curves, price inelasticity and other key concepts"),
        SubjectListItem(
            subject: "Chemistry",
            date: "20 June 2020",
            duration: "2 hours",
            description: "Exam revision and prep-work"),
        SubjectListItem(
            subject: "Physics",
            date: "14 June 2020",
            duration: "2 hours",
            description: "Went through specific gravity, bouyancy concepts"),
      ]),
    ));
  }
}
