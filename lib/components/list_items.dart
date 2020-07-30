import 'package:flutter/material.dart';
import 'avatar.dart';
import 'buttons.dart';

class UpcomingListItem extends StatelessWidget {
  final String tutorImage;
  final String readableDate;
  final String readableTime;
  final String subject;
  final String tutorName;
  final bool active;

  UpcomingListItem(
      {@required this.readableDate,
      @required this.readableTime,
      @required this.tutorImage,
      @required this.subject,
      @required this.tutorName,
      this.active = false,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 10.0, left: 0.0),
        child: Stack(children: <Widget>[
          Row(children: <Widget>[
            UserAvatar(tutorImage, active: active),
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: (active) ? 10.0 : 14.0),
                    padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color(0xFFE0E0E0), width: 1.0))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(readableDate.toUpperCase(),
                                        style: Theme.of(context)
                                            .accentTextTheme
                                            .overline
                                            .copyWith(
                                                fontWeight: FontWeight.w600)),
                                    Text(
                                        (readableTime != "")
                                            ? " | " + readableTime.toUpperCase()
                                            : "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .overline
                                            .copyWith(
                                                color: Color(0xFF666666),
                                                fontWeight: FontWeight.w500))
                                  ])),
                          Text(subject,
                              style: Theme.of(context).textTheme.subtitle1),
                          Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Text(tutorName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(color: Color(0xFF666666)))),
                        ]))),
          ]),
          (active)
              ? Positioned.fill(
                  child: Container(
                      margin: EdgeInsets.only(bottom: 2.0),
                      alignment: Alignment.bottomRight,
                      child: Row(children: <Widget>[
                        Spacer(),
                        TextIconFlatButton(
                            onPressed: () {}, text: "Join", icon: Icons.add)
                      ])))
              : Container(),
        ]));
  }
}

class SubjectListItem extends StatelessWidget {
  final String duration;
  final String date;
  final String subject;
  final String description;

  SubjectListItem(
      {@required this.subject,
      @required this.duration,
      @required this.date,
      @required this.description,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 10.0, left: 0.0),
        child: Row(children: <Widget>[
          SubjectAvatar(subject),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 14.0),
                  padding: EdgeInsets.only(top: 10.0, bottom: 12.0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0xFFE0E0E0), width: 1.0))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Expanded(
                                      child: Text(subject,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1)),
                                  Text(duration.toUpperCase(),
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .overline
                                          .copyWith(
                                              fontWeight: FontWeight.w600)),
                                  Text(" | " + date.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .overline
                                          .copyWith(
                                              color: Color(0xFF666666),
                                              fontWeight: FontWeight.w500))
                                ])),
                        Padding(
                            padding: EdgeInsets.only(top: 4.0),
                            child: Text(description,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(color: Color(0xFF666666)))),
                      ]))),
        ]));
  }
}
