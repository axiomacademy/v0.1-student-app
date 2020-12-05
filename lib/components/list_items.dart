import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './buttons.dart';
import 'avatar.dart';

/// Create Lesson item, with tutor focus
class TutorListItem extends StatelessWidget {
  /// Tutor profile picture link
  final String tutorImage;

  /// Subject of lesson
  final String subject;

  /// Tutor first name
  final String tutorFirstName;

  /// Tutor last name
  final String tutorLastName;

  /// Lesson startTime
  final DateTime startTime;

  /// Lesson endTime
  final DateTime endTime;

  /// Whether lesson room is active
  final bool active;

  /// Whether to show the time to the lesson
  final bool showTimeTo;

  /// Default contructor
  TutorListItem(
      {@required this.startTime,
      @required this.endTime,
      @required this.tutorImage,
      @required this.subject,
      @required this.tutorFirstName,
      @required this.tutorLastName,
      this.active = false,
      this.showTimeTo = false,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
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
                                  padding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        (showTimeTo)
                                            ? Text(
                                                _readableDate(startTime)
                                                    .toUpperCase(),
                                                style: Theme.of(context)
                                                    .accentTextTheme
                                                    .overline
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600))
                                            : Container(),
                                        Text(
                                            (showTimeTo)
                                                ? " | ${_readableTime(startTime, endTime)}"
                                                    .toUpperCase()
                                                : _readableTime(
                                                        startTime, endTime)
                                                    .toUpperCase(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline
                                                .copyWith(
                                                    color: Color(0xFF666666),
                                                    fontWeight:
                                                        FontWeight.w500))
                                      ])),
                              Text(
                                  // This formats the subject name to capitalize just the first letter
                                  '${subject[0].toUpperCase()}${subject.substring(1).toLowerCase()}',
                                  style: Theme.of(context).textTheme.subtitle1),
                              Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text("$tutorFirstName $tutorLastName",
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
                            StandardFlatButton(
                                onPressed: () {}, text: "Join", icon: Icons.add)
                          ])))
                  : Container(),
            ])));
  }

  String _readableDate(DateTime startTime) {
    final timeTo = startTime.difference(DateTime.now());

    if (timeTo.inDays > 0) {
      return "In ${timeTo.inDays} ${timeTo.inDays == 1 ? 'day' : 'days'}";
    } else if (timeTo.inHours > 0) {
      return "In ${timeTo.inHours} ${timeTo.inHours == 1 ? 'hour' : 'hours'}";
    } else if (timeTo.inMinutes > 0) {
      return "In ${timeTo.inMinutes} ${timeTo.inMinutes == 1 ? 'minute' : 'minutes'}";
    } else {
      return "Happening Now";
    }
  }

  String _readableTime(DateTime startTime, DateTime endTime) {
    final startMeridian = (startTime.hour < 12) ? "AM" : "PM";
    final startHour =
        (startTime.hour < 12) ? startTime.hour : startTime.hour - 12;
    final startMin = startTime.minute.toString().padLeft(2, '0');
    ;

    final endMeridian = (endTime.hour < 12) ? "AM" : "PM";
    final endHour = (endTime.hour < 12) ? endTime.hour : endTime.hour - 12;
    final endMin = endTime.minute.toString().padLeft(2, '0');

    // Formats to the readable time (6:00 - 8:00 PM)
    return "${(startHour == 0) ? "12" : startHour}:$startMin ${(startMeridian == endMeridian) ? "" : startMeridian} - ${(endHour == 0) ? "12" : endHour}:$endMin $endMeridian";
  }
}

/// Lesson list element, with subject focus
class SubjectListItem extends StatelessWidget {
  /// Subject of the lesson
  final String subject;

  /// Description of the lesson
  final String summary;

  /// Start time of the lesson
  final DateTime startTime;

  /// End time of the lesson
  final DateTime endTime;

  /// Default constructor
  SubjectListItem(
      {@required this.subject,
      @required this.summary,
      @required this.startTime,
      @required this.endTime,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Material(
            child: Ink(
                child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    splashColor: Color(0xFFF0E8FA),
                    onTap: () {},
                    child: Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(children: <Widget>[
                          SubjectAvatar(subject),
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(left: 14.0),
                                  padding:
                                      EdgeInsets.only(top: 10.0, bottom: 12.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xFFE0E0E0),
                                              width: 1.0))),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.0, bottom: 5.0),
                                            child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Expanded(
                                                      child: Text(
                                                          '${subject[0].toUpperCase()}${subject.substring(1).toLowerCase()}',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle1)),
                                                  Text(
                                                      _readableDuration(
                                                              startTime,
                                                              endTime)
                                                          .toUpperCase(),
                                                      style: Theme.of(context)
                                                          .primaryTextTheme
                                                          .overline
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                  Text(
                                                      " | ${_readableDate(startTime).toUpperCase()}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline
                                                          .copyWith(
                                                              color: Color(
                                                                  0xFF666666),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))
                                                ])),
                                        Padding(
                                            padding: EdgeInsets.only(top: 4.0),
                                            child: Text(summary,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                        color: Color(
                                                            0xFF666666)))),
                                      ]))),
                        ]))))));
  }

  String _readableDuration(DateTime startTime, DateTime endTime) {
    final duration = endTime.difference(startTime);

    if (duration.inDays > 0) {
      return "${duration.inDays} ${duration.inDays == 1 ? 'day' : 'days'}";
    } else if (duration.inHours > 0) {
      return "${duration.inHours} ${duration.inHours == 1 ? 'hour' : 'hours'}";
    } else if (duration.inMinutes > 0) {
      return "${duration.inMinutes} ${duration.inMinutes == 1 ? 'minute' : 'minutes'}";
    } else {
      return "";
    }
  }

  String _readableDate(DateTime startTime) {
    final formatter = DateFormat('dd MMM y');
    return formatter.format(startTime);
  }
}
