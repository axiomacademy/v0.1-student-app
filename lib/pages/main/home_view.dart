import 'package:flutter/material.dart';

import '../../components/appbar.dart';
import '../../components/list_items.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 8.0),
      child: ListView(shrinkWrap: true, children: <Widget>[
        AxiomAppBar(),
        Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 0.0),
            child: Text("Upcoming Sessions",
                style: Theme.of(context).textTheme.headline6)),
        UpcomingListItem(
            active: true,
            readableDate: "Happening now",
            readableTime: "",
            subject: "Physics",
            tutorName: "Arvinderjit Singh",
            tutorImage:
                "https://s3-ap-southeast-1.amazonaws.com/engpeepingmoon/140919054722tiger-shroff.jpg"),
        UpcomingListItem(
            readableDate: "In 2 days",
            readableTime: "10 - 11AM",
            subject: "Economics",
            tutorName: "Jasmine Sylvia",
            tutorImage: "https://s3.envato.com/files/236560326/preview.jpg"),
        Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 0.0),
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
