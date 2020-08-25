import 'package:flutter/material.dart';

import '../components/avatar.dart';

class TutorProfile extends StatelessWidget {
  final String image = "https://s3.envato.com/files/236560326/preview.jpg";
  final String name = "Jasmine Sylvia";
  final List<String> subjects = ["economics", "mathematics"];
  final String bio =
      "Passionate about economics and mathematics and educating the future of humanity!";
  final List<String> qualifications = [
    "NUS High School",
    "Harvard Class of 2020"
  ];
  final int rating = 4;
  final int charge = 60;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Color(0xFFFAFAFA),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.14),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              spreadRadius: -2,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(children: <Widget>[
                UserAvatar(image, width: 75, height: 75),
                Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(name,
                              style: Theme.of(context).textTheme.headline6),
                          Padding(
                              padding: EdgeInsets.only(top: 2.0),
                              child: Text("$charge SGD PER HOUR",
                                  style: Theme.of(context)
                                      .accentTextTheme
                                      .overline
                                      .copyWith(fontWeight: FontWeight.w600))),
                          Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: subjects.map((subject) {
                                return Padding(
                                    padding: EdgeInsets.only(
                                        top: 5.0, bottom: 5.0, right: 5.0),
                                    child: SubjectAvatar(subject,
                                        width: 30.0, height: 30.0));
                              }).toList())
                        ])),
              ]),
              Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(bio, style: Theme.of(context).textTheme.caption)),
              Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: _buildQualificationsList(context)),
              Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _buildRatingStars(context)),
            ]));
  }

  Widget _buildQualificationsList(BuildContext context) {
    String qualificationsText = "";

    for (var qualification in qualifications) {
      qualificationsText += (" • " + qualification);
    }

    return Text(qualificationsText.substring(3),
        style: Theme.of(context).primaryTextTheme.caption);
  }

  List<Widget> _buildRatingStars(BuildContext context) {
    List<Widget> stars = [];

    for (var i = 0; i < rating; i++) {
      stars.add(Padding(
          padding: EdgeInsets.only(top: 10.0, right: 1.0),
          child: Icon(Icons.star,
              size: 25.0, color: Theme.of(context).primaryColor)));
    }

    return stars;
  }
}
